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
@Table(name = "tipo_avion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoAvion.findAll", query = "SELECT t FROM TipoAvion t"),
    @NamedQuery(name = "TipoAvion.findById", query = "SELECT t FROM TipoAvion t WHERE t.id = :id"),
    @NamedQuery(name = "TipoAvion.findByGastoGasolina", query = "SELECT t FROM TipoAvion t WHERE t.gastoGasolina = :gastoGasolina"),
    @NamedQuery(name = "TipoAvion.findByVelocidad", query = "SELECT t FROM TipoAvion t WHERE t.velocidad = :velocidad"),
    @NamedQuery(name = "TipoAvion.findBySillasPrimeraClase", query = "SELECT t FROM TipoAvion t WHERE t.sillasPrimeraClase = :sillasPrimeraClase"),
    @NamedQuery(name = "TipoAvion.findBySillasClaseTurista", query = "SELECT t FROM TipoAvion t WHERE t.sillasClaseTurista = :sillasClaseTurista"),
    @NamedQuery(name = "TipoAvion.findByCapacidadTanque", query = "SELECT t FROM TipoAvion t WHERE t.capacidadTanque = :capacidadTanque"),
    @NamedQuery(name = "TipoAvion.findByNombre", query = "SELECT t FROM TipoAvion t WHERE t.nombre = :nombre")})
public class TipoAvion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gasto_gasolina")
    private float gastoGasolina;
    @Basic(optional = false)
    @NotNull
    @Column(name = "velocidad")
    private float velocidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "sillas_primera_clase")
    private int sillasPrimeraClase;
    @Basic(optional = false)
    @NotNull
    @Column(name = "sillas_clase_turista")
    private int sillasClaseTurista;
    @Basic(optional = false)
    @NotNull
    @Column(name = "capacidad_tanque")
    private float capacidadTanque;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "nombre")
    private String nombre;
    @JoinColumn(name = "configuracion_vuelo_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ConfiguracionVuelo configuracionVueloId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoAvionId")
    private Collection<Avion> avionCollection;

    public TipoAvion() {
    }

    public TipoAvion(Integer id) {
        this.id = id;
    }

    public TipoAvion(Integer id, float gastoGasolina, float velocidad, int sillasPrimeraClase, int sillasClaseTurista, float capacidadTanque, String nombre) {
        this.id = id;
        this.gastoGasolina = gastoGasolina;
        this.velocidad = velocidad;
        this.sillasPrimeraClase = sillasPrimeraClase;
        this.sillasClaseTurista = sillasClaseTurista;
        this.capacidadTanque = capacidadTanque;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getGastoGasolina() {
        return gastoGasolina;
    }

    public void setGastoGasolina(float gastoGasolina) {
        this.gastoGasolina = gastoGasolina;
    }

    public float getVelocidad() {
        return velocidad;
    }

    public void setVelocidad(float velocidad) {
        this.velocidad = velocidad;
    }

    public int getSillasPrimeraClase() {
        return sillasPrimeraClase;
    }

    public void setSillasPrimeraClase(int sillasPrimeraClase) {
        this.sillasPrimeraClase = sillasPrimeraClase;
    }

    public int getSillasClaseTurista() {
        return sillasClaseTurista;
    }

    public void setSillasClaseTurista(int sillasClaseTurista) {
        this.sillasClaseTurista = sillasClaseTurista;
    }

    public float getCapacidadTanque() {
        return capacidadTanque;
    }

    public void setCapacidadTanque(float capacidadTanque) {
        this.capacidadTanque = capacidadTanque;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ConfiguracionVuelo getConfiguracionVueloId() {
        return configuracionVueloId;
    }

    public void setConfiguracionVueloId(ConfiguracionVuelo configuracionVueloId) {
        this.configuracionVueloId = configuracionVueloId;
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
        if (!(object instanceof TipoAvion)) {
            return false;
        }
        TipoAvion other = (TipoAvion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.TipoAvion[ id=" + id + " ]";
    }
    
}
