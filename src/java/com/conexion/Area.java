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

    private String descripcion;

    private int ranking;
    private int idtrab;
    
    public Area(){
        
    }
    
    public Area(int id, String nombre){
        this.id = id;
        this.nombre = nombre;
    }
    
    public Area(int id, String nombre, int ranking){
        this.id = id;
        this.nombre = nombre;
        this.ranking = ranking;
    }
    
    
    public void setRanking(int ranking){
        this.ranking = ranking;
    }
    
    public int getRanking(){
        return ranking;
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
    

    public void setArea(Area area)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_set_area(?,?,?,?)}");
            clstm.setString(1,area.getNombre());
            clstm.setString(2,area.getDescripcion());
            clstm.setInt(3,area.getRanking());
            clstm.setInt(4,area.getIdtrab());
            clstm.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void getInfo(int idarea)
    {
        
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_getinfoarea(?,?)}");
            clstm.setInt(1, idarea);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(2);
            while(rset.next()){
                
                this.setId(rset.getInt(1));
                this.setNombre(rset.getString(2));
                this.setDescripcion(rset.getString(3));
                this.setRanking(rset.getInt(4));
                this.setIdtrab(rset.getInt(5));
            }
             }
        catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }

        
       
        
    }

    public ArrayList<Area> getAreas(int idTrab){
        areas = new ArrayList<>();
        conexion = new Conexion();
        
        try {
            clstm = conexion.getConexion().prepareCall("{ call areas_trabajador(?,?)}");
            clstm.registerOutParameter(1, OracleTypes.CURSOR);
            clstm.setInt(2, idTrab);
            clstm.execute();
            rset = (ResultSet) clstm.getObject(1);
            while(rset.next()){
                areas.add(new Area(rset.getInt(1), rset.getString(2), rset.getInt(3)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }

              return areas;
    
       
        
    }
    
    public void Marea(Area area)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_M_area(?,?,?,?,?)}");
            clstm.setString(1,area.getNombre());
            clstm.setString(2,area.getDescripcion());
            clstm.setInt(3,area.getRanking());
            clstm.setInt(4,area.getIdtrab());
            clstm.setInt(5,area.getId());
            clstm.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void Earea(int idarea)
    {
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call a_E_area(?)}");
            clstm.setInt(1,idarea);
            clstm.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Area> getAreasSinJefe(){
        areas = new ArrayList<>();
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call get_areassinjefe(?)}");
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
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }




    /**
     * @return the idtrab
     */
    public int getIdtrab() {
        return idtrab;
    }

    /**
     * @param idtrab the idtrab to set
     */
    public void setIdtrab(int idtrab) {
        this.idtrab = idtrab;
    }
    
    

  
    
    public void cambiarRanking(int idTrab, int idArea, int vRanking){
        conexion = new Conexion();
        try {
            clstm = conexion.getConexion().prepareCall("{ call cambiar_ranking(?,?,?)}");
            clstm.setInt(1, idTrab);
            clstm.setInt(2, idArea);
            clstm.setInt(3, vRanking);
            clstm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Area.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
