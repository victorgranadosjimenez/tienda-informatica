package org.iesbelen.model;


import java.util.Collection;

public class FabricanteDTO extends Fabricante{

    private int numProductos;

    public int getNumProductos() {
        return numProductos;
    }

    public void setNumProductos(int numProductos) {
        this.numProductos = numProductos;
    }

    //constructores
    public FabricanteDTO() {}

    public FabricanteDTO(int id, String nombre, int numProductos) {
        super();
        this.numProductos = numProductos;
    }

    public FabricanteDTO(Fabricante fab, int numProductos) {
        setIdFabricante(fab.getIdFabricante());
        setNombre(fab.getNombre());
        this.numProductos = numProductos;
    }


}