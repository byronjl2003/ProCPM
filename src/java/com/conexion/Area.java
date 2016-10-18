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
public class Area {
    private ArrayList<Area> areas;
    private Conexion conexion;
    private CallableStatement clstm;
    private ResultSet rset;
    
    private int id;
    private String nombre;
    private int idtrab;
    
    public Area(){
        
    }
    
    public Area(int id, String nombre){
        this.id = id;
        this.nombre = nombre;
    }
    
    public int getId(){
        return id;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public ArrayList<Area> getAreas(){
        areas = new ArrayList<>();
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_area(?)}");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(1);
            while(rset.next()){
                areas.add(new Area(rset.getInt(1),rset.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return areas;
    }
}
