package com.papeleria.interfaces;

import com.papeleria.model.venta;
import java.util.List;

public interface crudVenta {

    List getAll();

    venta getById(Integer id);

    String add(venta venta);

}
