/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Yoiner Esteban Gomez Ayala yoiner.gomez22@gmail.com
 */
@Entity
@Table(name = "aeropuerto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Aeropuerto.findAll", query = "SELECT a FROM Aeropuerto a"),
    @NamedQuery(name = "Aeropuerto.findByCodigo", query = "SELECT a FROM Aeropuerto a WHERE a.codigo = :codigo"),
    @NamedQuery(name = "Aeropuerto.findByNombre", query = "SELECT a FROM Aeropuerto a WHERE a.nombre = :nombre"),
    @NamedQuery(name = "Aeropuerto.findByImpuestoAeroportuario", query = "SELECT a FROM Aeropuerto a WHERE a.impuestoAeroportuario = :impuestoAeroportuario"),
    @NamedQuery(name = "Aeropuerto.findByCostoPlataforma", query = "SELECT a FROM Aeropuerto a WHERE a.costoPlataforma = :costoPlataforma")})
public class Aeropuerto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo")
    private Integer codigo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "impuesto_aeroportuario")
    private double impuestoAeroportuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo_plataforma")
    private double costoPlataforma;
    @JoinColumn(name = "categoria", referencedColumnName = "id")
    @ManyToOne
    private CategoriaAeropuerto categoria;
    @JoinColumn(name = "ciudad", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Ciudad ciudad;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "aeropuertoOrigen")
    private Ruta ruta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aeropuertoDestino")
    private Collection<Ruta> rutaCollection;

    public Aeropuerto() {
    }

    public Aeropuerto(Integer codigo) {
        this.codigo = codigo;
    }

    public Aeropuerto(Integer codigo, String nombre, double impuestoAeroportuario, double costoPlataforma) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.impuestoAeroportuario = impuestoAeroportuario;
        this.costoPlataforma = costoPlataforma;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getImpuestoAeroportuario() {
        return impuestoAeroportuario;
    }

    public void setImpuestoAeroportuario(double impuestoAeroportuario) {
        this.impuestoAeroportuario = impuestoAeroportuario;
    }

    public double getCostoPlataforma() {
        return costoPlataforma;
    }

    public void setCostoPlataforma(double costoPlataforma) {
        this.costoPlataforma = costoPlataforma;
    }

    public CategoriaAeropuerto getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaAeropuerto categoria) {
        this.categoria = categoria;
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public Ruta getRuta() {
        return ruta;
    }

    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }

    @XmlTransient
    public Collection<Ruta> getRutaCollection() {
        return rutaCollection;
    }

    public void setRutaCollection(Collection<Ruta> rutaCollection) {
        this.rutaCollection = rutaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aeropuerto)) {
            return false;
        }
        Aeropuerto other = (Aeropuerto) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.Aeropuerto[ codigo=" + codigo + " ]";
    }
    
}
