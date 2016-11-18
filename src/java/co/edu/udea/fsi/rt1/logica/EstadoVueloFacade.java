/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.logica;

import co.edu.udea.fsi.rt1.modelo.EstadoVuelo;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Yoiner Esteban Gomez Ayala yoiner.gomez22@gmail.com
 */
@Stateless
public class EstadoVueloFacade extends AbstractFacade<EstadoVuelo> {

    @PersistenceContext(unitName = "RTF_FSIPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstadoVueloFacade() {
        super(EstadoVuelo.class);
    }
    
}
