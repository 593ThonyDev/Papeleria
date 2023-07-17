package com.papeleria.model;

public class producto {

    private Integer idProducto;
    private String proNombre;
    private String proCodigo;
    private Integer proStock;
    private Double proPrecio;

    public producto() {
    }

    public producto(Integer idProducto, String proNombre, String proCodigo, Integer proStock, Double proPrecio) {
        this.idProducto = idProducto;
        this.proNombre = proNombre;
        this.proCodigo = proCodigo;
        this.proStock = proStock;
        this.proPrecio = proPrecio;
    }

    public producto(String proNombre, String proCodigo, Integer proStock, Double proPrecio) {
        this.proNombre = proNombre;
        this.proCodigo = proCodigo;
        this.proStock = proStock;
        this.proPrecio = proPrecio;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }

    public String getProCodigo() {
        return proCodigo;
    }

    public void setProCodigo(String proCodigo) {
        this.proCodigo = proCodigo;
    }

    public Integer getProStock() {
        return proStock;
    }

    public void setProStock(Integer proStock) {
        this.proStock = proStock;
    }

    public Double getProPrecio() {
        return proPrecio;
    }

    public void setProPrecio(Double proPrecio) {
        this.proPrecio = proPrecio;
    }

    @Override
    public String toString() {
        return "producto{" + "\n"
                + "idProducto=" + idProducto + "\n"
                + ", proNombre=" + proNombre + "\n"
                + ", proCodigo=" + proCodigo + "\n"
                + ", proStock=" + proStock + "\n"
                + ", proPrecio=" + proPrecio + "\n"
                + '}';
    }

}
