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
    private char tipor;
    private int iddcontenedora;
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
    
    
    public ArrayList<Region> getRegionesPorTipo(char cara){
        this.paises = new ArrayList<>();
        conexion = new Conexion();
        Region reg;
        
        try {
            clstm = conexion.getConexion().prepareCall("{call get_regiones1(?,?) }");
            clstm.setString(1,String.valueOf(cara));
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(2);
            while(rset.next()){
              reg = new Region();
              reg.setNombre(rset.getString(2));
              reg.setId(rset.getInt(1));
              paises.add(reg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return paises;
    }
    public ArrayList<Region> get_fronteras(String flag)
    {
        ArrayList<Region> lista = new ArrayList<>();
        
        Region reg;
        conexion = new Conexion();
        try {
            
            clstm = conexion.getConexion().prepareCall("{call get_fronteras(?,?,?) }");
            clstm.setString(1,flag);
            clstm.setInt(2,this.getId());
            clstm.registerOutParameter(3, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(3);
            while(rset.next()){
              reg = new Region();
              reg.setNombre(rset.getString(2));
              reg.setId(rset.getInt(1));
              lista.add(reg);
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    public void getInfo(int idr)
    {
        conexion = new Conexion();
        
        
        try {
            clstm = conexion.getConexion().prepareCall("{call get_inforegion(?,?) }");
            clstm.setInt(1,idr);
            clstm.registerOutParameter(2, OracleTypes.CURSOR);
            clstm.execute();
            rset =(ResultSet) clstm.getObject(2);
            while(rset.next()){
              String tipoo = rset.getString(3);
              System.out.println("TIPO EN getinfo:"+tipoo);
              this.setTipor(tipoo.charAt(0));
              System.out.println("TIPO EN getinfo:"+this.getTipor());
              if(this.getTipor()=='C')
              {
                  this.setId(rset.getInt(1));
                  this.setNombre(rset.getString(2));
                  
              }
              else if(this.getTipor()=='N')
              {
                  this.setId(rset.getInt(1));
                  this.setNombre(rset.getString(2));
                  this.setArea(rset.getFloat(4));
                  this.setPoblacion(rset.getInt(5));
                  this.setIddcontenedora(rset.getInt(6));
                
              }
              else if(this.getTipor()=='A' || this.getTipor()=='R')
              {
                  this.setId(rset.getInt(1));
                  this.setNombre(rset.getString(2));
                  this.setIddcontenedora(rset.getInt(6));
              }
              else
              {
                  System.out.println("ERROR EN EL TIPOR...GRAVE");
              }
              
              
              
            }
        } catch (SQLException ex) {
            Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String setRegion(String erg[])
    {
        
        String mensaje="";
        int idd = 0;
            if(this.getTipor()=='N')
            {
                try {
                    conexion = new Conexion();
                    clstm = conexion.getConexion().prepareCall("{call set_region(?,?,?,?,?,?,?) }");
                    clstm.setString(1,this.getNombre());
                    clstm.setString(2,String.valueOf(this.getTipor()));
                    clstm.setFloat(3,this.getArea());
                    clstm.setLong(4,this.getPoblacion());
                    clstm.setInt(5,this.getIddcontenedora());
                    clstm.registerOutParameter(6, OracleTypes.VARCHAR);
                    clstm.registerOutParameter(7, OracleTypes.INTEGER);
                    clstm.execute();
                    mensaje = clstm.getString(6);
                    idd = clstm.getInt(7);
                    } catch (SQLException ex) {
                        Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
                    }
                
                for(int i=0;i<erg.length;i++)
                {
                    try {
                        conexion = new Conexion();
                        clstm = conexion.getConexion().prepareCall("{call set_frontera(?,?) }");
                        clstm.setInt(1,idd);
                        clstm.setInt(2,Integer.valueOf(erg[1]));
                        
                    
                    } catch (SQLException ex) {
                        Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
            }
            else
            {
                 try {
                    conexion = new Conexion();
                    clstm = conexion.getConexion().prepareCall("{call set_region(?,?,?,?,?,?,?) }");
                    clstm.setString(1,this.getNombre());
                    clstm.setString(2,String.valueOf(this.getTipor()));
                    clstm.setFloat(3,this.getArea());
                    clstm.setLong(4,this.getPoblacion());
                    clstm.setInt(5,this.getIddcontenedora());
                    clstm.registerOutParameter(6, OracleTypes.VARCHAR);
                    clstm.registerOutParameter(7, OracleTypes.INTEGER);
                    clstm.execute();
                    mensaje = clstm.getString(6);
                    idd = clstm.getInt(7);
                    } catch (SQLException ex) {
                        Logger.getLogger(Region.class.getName()).log(Level.SEVERE, null, ex);
                    }
            }
                
            
            
        
        return mensaje;
    }

    /**
     * @return the tipor
     */
    public char getTipor() {
        return tipor;
    }

    /**
     * @param tipor the tipor to set
     */
    public void setTipor(char tipor) {
        this.tipor = tipor;
    }

    /**
     * @return the iddcontenedora
     */
    public int getIddcontenedora() {
        return iddcontenedora;
    }

    /**
     * @param iddcontenedora the iddcontenedora to set
     */
    public void setIddcontenedora(int iddcontenedora) {
        this.iddcontenedora = iddcontenedora;
    }
    
   
    
            
    
}
