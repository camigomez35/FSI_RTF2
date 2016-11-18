/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.modelo;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Yoiner Esteban Gomez Ayala yoiner.gomez22@gmail.com
 */
@Entity
@Table(name = "vuelo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vuelo.findAll", query = "SELECT v FROM Vuelo v"),
    @NamedQuery(name = "Vuelo.findById", query = "SELECT v FROM Vuelo v WHERE v.id = :id"),
    @NamedQuery(name = "Vuelo.findByFechaSalida", query = "SELECT v FROM Vuelo v WHERE v.fechaSalida = :fechaSalida"),
    @NamedQuery(name = "Vuelo.findByPesoEquipaje", query = "SELECT v FROM Vuelo v WHERE v.pesoEquipaje = :pesoEquipaje"),
    @NamedQuery(name = "Vuelo.findByPesoCarga", query = "SELECT v FROM Vuelo v WHERE v.pesoCarga = :pesoCarga"),
    @NamedQuery(name = "Vuelo.findByPasajerosEmbarcados", query = "SELECT v FROM Vuelo v WHERE v.pasajerosEmbarcados = :pasajerosEmbarcados"),
    @NamedQuery(name = "Vuelo.findByHoraLlegada", query = "SELECT v FROM Vuelo v WHERE v.horaLlegada = :horaLlegada"),
    @NamedQuery(name = "Vuelo.findByIncidentes", query = "SELECT v FROM Vuelo v WHERE v.incidentes = :incidentes"),
    @NamedQuery(name = "Vuelo.findByCostoTotal", query = "SELECT v FROM Vuelo v WHERE v.costoTotal = :costoTotal"),
    @NamedQuery(name = "Vuelo.findByHoraSalida", query = "SELECT v FROM Vuelo v WHERE v.horaSalida = :horaSalida"),
    @NamedQuery(name = "Vuelo.findByFechaLlegada", query = "SELECT v FROM Vuelo v WHERE v.fechaLlegada = :fechaLlegada")})
public class Vuelo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "fecha_salida")
    @Temporal(TemporalType.DATE)
    private Date fechaSalida;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "peso_equipaje")
    private Float pesoEquipaje;
    @Column(name = "peso_carga")
    private Float pesoCarga;
    @Column(name = "pasajeros_embarcados")
    private Integer pasajerosEmbarcados;
    @Column(name = "hora_llegada")
    @Temporal(TemporalType.TIME)
    private Date horaLlegada;
    @Size(max = 250)
    @Column(name = "incidentes")
    private String incidentes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "costo_total")
    private double costoTotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hora_salida")
    @Temporal(TemporalType.TIME)
    private Date horaSalida;
    @Column(name = "fecha_llegada")
    @Temporal(TemporalType.DATE)
    private Date fechaLlegada;
    @ManyToMany(mappedBy = "vueloCollection")
    private Collection<Empleado> empleadoCollection;
    @JoinColumn(name = "ruta", referencedColumnName = "id")
    @ManyToOne
    private Ruta ruta;
    @JoinColumn(name = "estado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstadoVuelo estado;
    @JoinColumn(name = "avion", referencedColumnName = "id")
    @ManyToOne
    private Avion avion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idVuelo")
    private Collection<Escala> escalaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idVueloEscala")
    private Collection<Escala> escalaCollection1;

    public Vuelo() {
    }

    public Vuelo(Integer id) {
        this.id = id;
    }

    public Vuelo(Integer id, double costoTotal, Date horaSalida) {
        this.id = id;
        this.costoTotal = costoTotal;
        this.horaSalida = horaSalida;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public Float getPesoEquipaje() {
        return pesoEquipaje;
    }

    public void setPesoEquipaje(Float pesoEquipaje) {
        this.pesoEquipaje = pesoEquipaje;
    }

    public Float getPesoCarga() {
        return pesoCarga;
    }

    public void setPesoCarga(Float pesoCarga) {
        this.pesoCarga = pesoCarga;
    }

    public Integer getPasajerosEmbarcados() {
        return pasajerosEmbarcados;
    }

    public void setPasajerosEmbarcados(Integer pasajerosEmbarcados) {
        this.pasajerosEmbarcados = pasajerosEmbarcados;
    }

    public Date getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(Date horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    public String getIncidentes() {
        return incidentes;
    }

    public void setIncidentes(String incidentes) {
        this.incidentes = incidentes;
    }

    public double getCostoTotal() {
        return costoTotal;
    }

    public void setCostoTotal(double costoTotal) {
        this.costoTotal = costoTotal;
    }

    public Date getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Date horaSalida) {
        this.horaSalida = horaSalida;
    }

    public Date getFechaLlegada() {
        return fechaLlegada;
    }

    public void setFechaLlegada(Date fechaLlegada) {
        this.fechaLlegada = fechaLlegada;
    }

    @XmlTransient
    public Collection<Empleado> getEmpleadoCollection() {
        return empleadoCollection;
    }

    public void setEmpleadoCollection(Collection<Empleado> empleadoCollection) {
        this.empleadoCollection = empleadoCollection;
    }

    public Ruta getRuta() {
        return ruta;
    }

    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }

    public EstadoVuelo getEstado() {
        return estado;
    }

    public void setEstado(EstadoVuelo estado) {
        this.estado = estado;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    @XmlTransient
    public Collection<Escala> getEscalaCollection() {
        return escalaCollection;
    }

    public void setEscalaCollection(Collection<Escala> escalaCollection) {
        this.escalaCollection = escalaCollection;
    }

    @XmlTransient
    public Collection<Escala> getEscalaCollection1() {
        return escalaCollection1;
    }

    public void setEscalaCollection1(Collection<Escala> escalaCollection1) {
        this.escalaCollection1 = escalaCollection1;
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
        if (!(object instanceof Vuelo)) {
            return false;
        }
        Vuelo other = (Vuelo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.udea.fsi.rt1.modelo.Vuelo[ id=" + id + " ]";
    }
    
}
