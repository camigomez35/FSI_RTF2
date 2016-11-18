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
@Table(name = "estado_avion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EstadoAvion.findAll", query = "SELECT e FROM EstadoAvion e"),
    @NamedQuery(name = "EstadoAvion.findById", query = "SELECT e FROM EstadoAvion e WHERE e.id = :id"),
    @NamedQuery(name = "EstadoAvion.findByNombre", query = "SELECT e FROM EstadoAvion e WHERE e.nombre = :nombre"),
    @NamedQuery(name = "EstadoAvion.findByJustificacion", query = "SELECT e FROM EstadoAvion e WHERE e.justificacion = :justificacion")})
public class EstadoAvion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "justificacion")
    private String justificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private Collection<Avion> avionCollection;

    public EstadoAvion() {
    }

    public EstadoAvion(Integer id) {
        this.id = id;
    }

    public EstadoAvion(Integer id, String nombre, String justificacion) {
        this.id = id;
        this.nombre = nombre;
        this.justificacion = justificacion;
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

    public String getJustificacion() {
        return justificacion;
    }

    public void setJustificacion(String justificacion) {
        this.justificacion = justificacion;
    }

    @XmlTransient
    public Collection<Avion> getAvionCollection() {
        return avionCollection;
    }

    public void setAvionCollection(Collection<Avion> avionCollection) {
        this.avionCollection = avionCollection;
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
        if (!(object instanceof EstadoAvion)) {
            return false;
        }
        EstadoAvion other = (EstadoAvion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.EstadoAvion[ id=" + id + " ]";
    }
    
}
