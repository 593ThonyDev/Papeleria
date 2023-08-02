package com.papeleria.interfaces;

import com.papeleria.model.usuario;
import java.util.List;

public interface crudUsuario {

    List getAll();

    usuario getById(Integer id);

    String add(usuario usuario);

    String updateById(usuario usuario);

    String deleteById(Integer id);

    //Login
    Integer getIdUsuario(String USU_USUARIO);

    String getPassword(int ID_USUARIO);

    Integer getAttempts(int ID_USUARIO);

}
