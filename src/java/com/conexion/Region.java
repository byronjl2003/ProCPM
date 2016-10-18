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
public class Region {
    private ArrayList<Region> paises;
    private Conexion conexion;
    private CallableStatement clstm;
    private ResultSet rset;
    
    private int id;
    private float area;
    private long poblacion;
    private String nombre;
    
    public Region(){}
    
    public int getId(){
        return id;
    }
    
    public float getArea(){
        return area;
    }
    
    public long getPoblacion(){
        return poblacion;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public void setArea(float area){
        this.area = area;
    }
    
    public void setPoblacion(long poblacion){
        this.poblacion = poblacion;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public ArrayList<Region> getPaises(){
        this.paises = new ArrayList<>();
        conexion = new Conexion();
        Region reg;
        
        try {
            clstm = conexion.getConexion().prepareCall("{call listado_paises(?) }");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(1);
            while(rset.next()){
              reg = new Region();
              reg.setNombre(rset.getString(1));
              reg.setId(rset.getInt(2));
              paises.add(reg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return paises;
    }
            
    
}
