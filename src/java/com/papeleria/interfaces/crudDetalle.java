package com.papeleria.interfaces;

import com.papeleria.model.detalle;
import java.util.List;

public interface crudDetalle {

    List getAllByCode(Integer fkVenta);

    String add(detalle detalle);

    String deleteById(Integer id);
}
