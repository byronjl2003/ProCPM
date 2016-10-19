/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author wxjoy
 */
public class Inventor {
    private int id;
    private String nombre;
    private String correo;
    private Conexion conexion;
    private CallableStatement clstm;
    private ResultSet rset;
    
    private ArrayList<Inventor> inventores;
    
    public Inventor(){
        
    }
    
    public Inventor( String nombre, String correo){
        this.nombre = nombre;
        this.correo = correo;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public void setCorreo(String correo){
        this.correo = correo;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public String getCorreo(){
        return correo;
    }
    
    public int getId(){
        return id;
    }
    
    public boolean guardarInventor(int codPais){
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call crear_inventor(?,?,?)}");
            clstm.setString(1, nombre);
            clstm.setString(2, correo);
            clstm.setInt(3, codPais);
            clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Inventor.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    
    public ArrayList<Inventor> getInventores(){
        inventores = new ArrayList<>();
        conexion = new Conexion();
        Inventor inv;
        try {
            clstm = conexion.getConexion().prepareCall("{ call extraer_inventores(?)}");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(1);
            while(rset.next()){
                inv = new Inventor();
                inv.setId(rset.getInt(1));
                inv.setNombre(rset.getString(2));
                inventores.add(inv);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Inventor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventores;
    }
    
}
