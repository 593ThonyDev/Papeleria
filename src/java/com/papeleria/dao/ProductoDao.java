package com.papeleria.dao;

import com.papeleria.database.Conexion;
import com.papeleria.interfaces.crudProducto;
import com.papeleria.model.producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao implements crudProducto {

    //Estancias necesarias para la logica
    producto producto = new producto();
    Conexion cn = new Conexion();
    CallableStatement cs;
    Connection con;
    ResultSet rs;

    //variables para los procedimientos almacenados
    String getAll = "CALL spLeerProductos()";
    String getById = "CALL spObtenerProductoPorID(?)";
    String add = "CALL spCrearProducto(?,?,?,?)";
    String update = "CALL spActualizarProducto(?,?,?,?,?)";
    String delete = "CALL spEliminarProducto(?)";

    @Override
    public List getAll() {
        ArrayList<producto> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getAll);
            rs = cs.executeQuery();
            while (rs.next()) {
                producto pro = new producto();
                pro.setIdProducto(rs.getInt(1));
                pro.setProNombre(rs.getString(2));
                pro.setProCodigo(rs.getString(3));
                pro.setProStock(rs.getInt(4));
                pro.setProPrecio(rs.getDouble(5));
                lista.add(pro);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return lista;
    }

    @Override
    public producto getById(Integer id) {
        ArrayList<producto> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getById);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                producto.setIdProducto(rs.getInt(1));
                producto.setProNombre(rs.getString(2));
                producto.setProCodigo(rs.getString(3));
                producto.setProStock(rs.getInt(4));
                producto.setProPrecio(rs.getDouble(5));
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return producto;
    }

    @Override
    public String add(producto pro) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(add);
            cs.setString(1, pro.getProNombre());
            cs.setString(2, pro.getProCodigo());
            cs.setInt(3, pro.getProStock());
            cs.setDouble(4, pro.getProPrecio());
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al crear: " + ex.getMessage());
            return "no creado";
        }
        return "creado";
    }

    @Override
    public String updateById(producto pro) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(update);
            cs.setInt(1, pro.getIdProducto());
            cs.setString(2, pro.getProNombre());
            cs.setString(3, pro.getProCodigo());
            cs.setInt(4, pro.getProStock());
            cs.setDouble(5, pro.getProPrecio());
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar: " + ex.getMessage());
            return "no actualizado";
        }
        return "actualizado";
    }

    @Override
    public String deleteById(Integer id) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(delete);
            cs.setInt(1, id);
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar: " + ex.getMessage());
            return "no eliminado";
        }
        return "eliminado";
    }

}
