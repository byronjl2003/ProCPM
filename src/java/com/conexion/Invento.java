/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;

import java.sql.CallableStatement;
import java.sql.Date;
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
public class Invento {
    private Conexion conexion;
    private CallableStatement clstm;
    private ResultSet rset;
    private int id;
    private String descripcion;
    private Date fechaPub;
    private char estado;
    private int regId;
    private int areaId;
    private ArrayList<Invento> inventos;
    
    public Invento(){}
    
    public Invento(String descripcion, int regId, int areaId){
        this.descripcion = descripcion;
        this.regId = regId;
        this.areaId = areaId;
    }
    
    public int getId(){
        return id;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
    
    public Date getFechaPub(){
        return fechaPub;
    }
    
    public char getEstado(){
        return estado;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
    
    public void setEstado(char estado){
        this.estado = estado;
    }
    
    public void setFechaPub(Date fechaPub){
        this.fechaPub = fechaPub;
    }
    public void setId(int id){
        this.id = id;
    }
    public int guardarInvento(){
        id = -1;
        
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call nuevo_invento(?,?,?,?) } ");
            clstm.setString(1, descripcion);
            clstm.setInt(2, this.regId);
            clstm.setInt(3, this.areaId);
            clstm.registerOutParameter(4,OracleTypes.INTEGER );
            clstm.execute();
            this.id = clstm.getInt(4);
        } catch (SQLException ex) {
            Logger.getLogger(Invento.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return id;
    }
    
    public void setInventor(int idInventor){
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call rel_inv_inv(?,?) }");
            clstm.setInt(1, idInventor);
            clstm.setInt(2, id);
            clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Invento.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Invento> getInventosAsig(int idTrab){
        inventos = new ArrayList<>();
        conexion = new Conexion();
        Invento inv ;
        try {
            clstm  = conexion.getConexion().prepareCall("{ call inventos_trabajador(?,?)}");
            clstm.setInt(1, idTrab);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(2);
            while(rset.next()){
                inv = new Invento();
                inv.setId(rset.getInt(1));
                inv.setDescripcion(rset.getString(2));
                inventos.add(inv);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Invento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inventos;
    }
    
    public void aproInvento(int idInv){
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call aprobar_invento(?)}");
            clstm.setInt(1, idInv);
            clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Invento.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
