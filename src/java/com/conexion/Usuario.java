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
}
