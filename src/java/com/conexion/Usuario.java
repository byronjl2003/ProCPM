/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;
import java.sql.*;
import java.util.ArrayList;
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
    private String password;
    private char tipo;
    private char tipojefe;
    private float salario;
    private float comision;
            
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
        setId(-1);
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
                setId(rset.getInt(1));
                setNombre(rset.getString(2));
                tmp = rset.getString(3);
                this.setRol(tmp.charAt(0));
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
            setNombre(rset.getString(1));
            setCorreo(rset.getString(2));
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
            clstm.setString(2, getNombre());
            clstm.setString(3, correo);
            clstm.setString(4, cambio);
            return !clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void set_trabajador(String nombre,String usuario,String pass,String date,char tip,char tipj,float salario,float comision)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call set_trabajador(?,?,?,?,?,?,?,?) }");
            clstm.setString(1, nombre);
            clstm.setString(2,usuario);
            clstm.setString(2,pass);
            clstm.setDate(4,java.sql.Date.valueOf(date));
            clstm.setString(5,String.valueOf(tip));
            clstm.setString(6,String.valueOf(tipj));
            clstm.setFloat(7,salario);
            clstm.setFloat(8,comision);
            
            clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    public ArrayList<Usuario> get_trabajadores()
    {
        ArrayList<Usuario>lista = new ArrayList();
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_trabajadores(?) }");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            
            clstm.execute();
            rset =(ResultSet) clstm.getObject(1);
            while(rset.next()){
              Usuario usu = new Usuario();
              usu.setId(rset.getInt(1));
              usu.setNombre(rset.getString(2));
              lista.add(usu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    
    
    
    
    
    
    
    
    
    public ArrayList<Usuario> get_trabajadorestipo3()
    {
        ArrayList<Usuario>lista = new ArrayList();
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_trabajadoresNoJefe(?) }");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            
            clstm.execute();
            rset =(ResultSet) clstm.getObject(1);
            while(rset.next()){
              Usuario usu = new Usuario();
              usu.setId(rset.getInt(1));
              usu.setNombre(rset.getString(2));
              lista.add(usu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public void getInfo(int idusu)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_infotrabajador(?,?) }");
            clstm.setInt(1, idusu);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            
            clstm.execute();
            rset =(ResultSet) clstm.getObject(2);
            while(rset.next()){
              
              this.setId(rset.getInt(1));
              this.setNombre(rset.getString(2));
              this.setCorreo(rset.getString(3));
              this.setPassword(rset.getString(4));
              this.setFechaInicio(rset.getDate(5));
              this.setTipo(rset.getString(6).charAt(0));
              this.setTipojefe(rset.getString(7).charAt(0));
              this.setSalario(rset.getFloat(8));
              this.setComision(rset.getFloat(9));
              
            }
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void Mtrabajador( Usuario usu)
    {
       conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_M_trabajador(?,?,?,?,?,?,?,?,?) }");
            clstm.setString(1,usu.getNombre());
            clstm.setString(2,usu.getCorreo());
            clstm.setString(3,usu.getPassword());
            clstm.setDate(4,usu.getFechaInicio());
            //java.sql.Date.valueOf()
            clstm.setString(5,String.valueOf(usu.getTipo()));
            clstm.setString(6,String.valueOf(usu.getTipojefe()));
            clstm.setFloat(7,usu.getSalario());
            clstm.setFloat(8,usu.getComision());
            clstm.setInt(9,usu.getId());
            clstm.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void Etrabajador(int idt)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_E_trabajador(?) }");
            clstm.setInt(1, idt);
            
            
            
            clstm.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the tipo
     */
    public char getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the tipojefe
     */
    public char getTipojefe() {
        return tipojefe;
    }

    /**
     * @param tipojefe the tipojefe to set
     */
    public void setTipojefe(char tipojefe) {
        this.tipojefe = tipojefe;
    }

    /**
     * @return the salario
     */
    public float getSalario() {
        return salario;
    }

    /**
     * @param salario the salario to set
     */
    public void setSalario(float salario) {
        this.salario = salario;
    }

    /**
     * @return the comision
     */
    public float getComision() {
        return comision;
    }

    /**
     * @param comision the comision to set
     */
    public void setComision(float comision) {
        this.comision = comision;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @param rol the rol to set
     */
    public void setRol(char rol) {
        this.rol = rol;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
