/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "categoria_aeropuerto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CategoriaAeropuerto.findAll", query = "SELECT c FROM CategoriaAeropuerto c"),
    @NamedQuery(name = "CategoriaAeropuerto.findById", query = "SELECT c FROM CategoriaAeropuerto c WHERE c.id = :id"),
    @NamedQuery(name = "CategoriaAeropuerto.findByNombre", query = "SELECT c FROM CategoriaAeropuerto c WHERE c.nombre = :nombre")})
public class CategoriaAeropuerto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(mappedBy = "categoria")
    private Collection<Aeropuerto> aeropuertoCollection;

    public CategoriaAeropuerto() {
    }

    public CategoriaAeropuerto(Integer id) {
        this.id = id;
    }

    public CategoriaAeropuerto(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public Collection<Aeropuerto> getAeropuertoCollection() {
        return aeropuertoCollection;
    }

    public void setAeropuertoCollection(Collection<Aeropuerto> aeropuertoCollection) {
        this.aeropuertoCollection = aeropuertoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CategoriaAeropuerto)) {
            return false;
        }
        CategoriaAeropuerto other = (CategoriaAeropuerto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.CategoriaAeropuerto[ id=" + id + " ]";
    }
    
}
