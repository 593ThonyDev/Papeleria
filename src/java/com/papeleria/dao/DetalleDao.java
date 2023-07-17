package com.papeleria.dao;

import com.papeleria.database.Conexion;
import com.papeleria.interfaces.crudDetalle;
import com.papeleria.model.detalle;
import com.papeleria.model.producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetalleDao implements crudDetalle {

    //Estancias necesarias para la logica
    Conexion cn = new Conexion();
    CallableStatement cs;
    Connection con;
    ResultSet rs;
    ProductoDao proDao = new ProductoDao();
    producto pro = new producto();

    //variables para los procedimientos almacenados
    String getAll = "";
    String add = "";
    //Variables para la actualizacion del stock
    Integer stockBd = 0;
    Integer cantidadVendida = 0;
    Integer stockNuevo = 0;

    @Override
    public List getAllByCode(Integer fkVenta) {
        ArrayList<detalle> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getAll);
            cs.setInt(1, fkVenta);
            rs = cs.executeQuery();
            while (rs.next()) {
                detalle det = new detalle();
                det.setIdDetalle(rs.getInt(1));
                det.setFkVenta(rs.getInt(2));
                det.setFkProducto(rs.getInt(3));
                det.setProNombreDet(rs.getString(4));
                det.setProCodigoDet(rs.getString(5));
                det.setDetCantidad(rs.getInt(6));
                det.setDetTotal(rs.getDouble(7));
                lista.add(det);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return lista;
    }

    @Override
    public String add(detalle detalle) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(add);
            cs.setInt(1, detalle.getFkVenta());
            cs.setInt(2, detalle.getFkProducto());
            cs.setInt(3, detalle.getDetCantidad());
            cs.setDouble(4, detalle.getDetTotal());
            // Aqui generamos la actualizacion del stock del producto agregado
            pro = proDao.getById(detalle.getFkProducto());
            stockBd = pro.getProStock();
            cantidadVendida = detalle.getDetCantidad();
            if (cantidadVendida < stockBd) {
                cs.executeQuery();
                stockNuevo = detalle.getDetCantidad() - stockBd;
                pro.setProStock(stockNuevo);
                return proDao.updateById(pro);
            } else {
                return "cantidad invalida";
            }
        } catch (SQLException ex) {
            System.out.println("Error al crear: " + ex.getMessage());
            return "no creado";
        }
    }

    @Override
    public String deleteById(Integer id) {
        return null;
    }

}
