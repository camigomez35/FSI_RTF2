/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Yoiner Esteban Gomez Ayala yoiner.gomez22@gmail.com
 */
@Entity
@Table(name = "escala")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Escala.findAll", query = "SELECT e FROM Escala e"),
    @NamedQuery(name = "Escala.findById", query = "SELECT e FROM Escala e WHERE e.id = :id")})
public class Escala implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "id_vuelo", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Vuelo idVuelo;
    @JoinColumn(name = "id_vuelo_escala", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Vuelo idVueloEscala;

    public Escala() {
    }

    public Escala(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Vuelo getIdVuelo() {
        return idVuelo;
    }

    public void setIdVuelo(Vuelo idVuelo) {
        this.idVuelo = idVuelo;
    }

    public Vuelo getIdVueloEscala() {
        return idVueloEscala;
    }

    public void setIdVueloEscala(Vuelo idVueloEscala) {
        this.idVueloEscala = idVueloEscala;
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
        if (!(object instanceof Escala)) {
            return false;
        }
        Escala other = (Escala) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.Escala[ id=" + id + " ]";
    }
    
}
