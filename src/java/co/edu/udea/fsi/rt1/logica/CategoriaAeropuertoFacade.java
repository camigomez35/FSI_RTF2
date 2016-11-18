/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.logica;

import co.edu.udea.fsi.rt1.modelo.CategoriaAeropuerto;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Yoiner Esteban Gomez Ayala yoiner.gomez22@gmail.com
 */
@Stateless
public class CategoriaAeropuertoFacade extends AbstractFacade<CategoriaAeropuerto> {

    @PersistenceContext(unitName = "RTF_FSIPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoriaAeropuertoFacade() {
        super(CategoriaAeropuerto.class);
    }
    
}
