/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author wxjoy
 */
public class Usuario {
    private Conexion conexion;
    private CallableStatement clstm;
    private int id;
    private ResultSet rset;
    private String nombre;
    private char rol;
    private String correo;
    private Date fechaInicio;
    public Usuario(){
        
    }
    
    public Usuario(String nombre, String fechaInicio, String correo, char ff){
        this.nombre = nombre;
        String tmp[];
        String tmp2;
        if(ff=='1'){
            tmp =  fechaInicio.split("/");
            tmp2  = tmp[2] + "-" + tmp[1] + "-" + tmp[0] + " 00:00";
            this.fechaInicio = Date.valueOf(tmp2);
        }else if(ff=='2'){
            this.fechaInicio = Date.valueOf(fechaInicio);
        }
        this.correo = correo;
    }

    public Usuario(int id, String nombre, String mail) {
        this.id = id;
        this.nombre = nombre ;
        this.correo= mail;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public int getId(){
        return id;
    }
    
    public char getRol(){
        return rol;
    }
    public int loginUsuario(String correo, String clave){
        id= -1;
        conexion = new Conexion();
        String tmp;
        try {
            clstm = conexion.getConexion().prepareCall(" { call login_usuarios(?,?,?)}");
            clstm.setString(1,correo);
            clstm.setString(2, clave);
            clstm.registerOutParameter(3, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(3);
            if(rset.next()){
                id = rset.getInt(1);
                nombre = rset.getString(2);
                tmp = rset.getString(3);
                this.rol = tmp.charAt(0);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return id;
    }

    public int cambiarClave(int codu, String cAct, String nClave) {
        int resultado=0;
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call cambiar_clave(?,?,?,?) }");
            clstm.setInt(1, codu);
            clstm.setString(2, cAct);
            clstm.setString(3, nClave);
            clstm.registerOutParameter(4, OracleTypes.INTEGER);
            clstm.execute();
            resultado = (int) clstm.getObject(4);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
    
    public String getCorreo(){
        return correo;
    }
    
    public void cargarDatos(int codu){
        conexion = new Conexion();
        
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_d_usuario(?,?) }");
            clstm.setInt(1, codu);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(2);
            rset.next();
            nombre = rset.getString(1);
            correo = rset.getString(2);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public boolean isDisponible(String mail) {
        conexion = new Conexion();
        boolean disp= true;
        
        try {
            clstm = conexion.getConexion().prepareCall("{ call validar_correo(?,?) }");
            clstm.setString(1, mail);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(2);
            disp = ! rset.next();
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return disp;
    }

    public boolean cambiarDatos(String cambio) {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call act_d_usuario(?,?,?,?) }");
            clstm.setInt(1, id);
            clstm.setString(2, nombre);
            clstm.setString(3, correo);
            clstm.setString(4, cambio);
            return !clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
