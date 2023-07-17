package com.papeleria.interfaces;

import com.papeleria.model.producto;
import java.util.List;

public interface crudProducto {

    List getAll();

    producto getById(Integer id);

    String add(producto producto);

    String updateById(producto producto);

    String deleteById(Integer id);
}
