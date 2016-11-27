/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.udea.fsi.rt1.controlador;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author estudiantelis
 */
public class ReportController {
    
    private String idAeropuerto;
    public Connection conn ;
    /**
     * Creates a new instance of ReportController
     */
    public ReportController() {
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance(); //se carga el driver
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/softfly", "root", "root");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void listFilesForFolder(final File folder) {
                for (final File fileEntry : folder.listFiles()) {
                    if (fileEntry.isDirectory()) {
                        listFilesForFolder(fileEntry);
                    } else {
                        System.out.println(fileEntry.getName());
                    }
                }
    }
    
    public void reportar(){
        JasperReport masterReport = null;
        try{
            String archivo = "AeropuertoRutaReporte.jasper";
            if (archivo == null) {
                System.out.println("No se encuentra el archivo.");
                System.exit(2);
            }
            ///home/esteban/NetBeansProjects/FSI_RTF2/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper
            System.out.println(new File(".").getCanonicalPath());
            String ruta = new File(".").getCanonicalPath()+"/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper";
            ruta = "/home/esteban/NetBeansProjects/FSI_RTF2/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper";
            
            try {
                //masterReport = (JasperReport) JRLoader.loadObjectFromFile("/home/esteban/NetBeansProjects/FSI_RTF2/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper");
             masterReport = (JasperReport) JRLoader.loadObject(new File(ruta));
            } catch (JRException e) {
                System.out.println("Error cargando el reporte maestro: " + e.getMessage());
                System.exit(3);
            }
            Map parametro = new HashMap();
            parametro.put("idAeropuerto", Integer.parseInt(idAeropuerto));//Reporte diseñado y compilado con iReport
            String reporte = JasperFillManager.fillReportToFile(ruta, parametro, conn);
            JasperExportManager.exportReportToPdfFile(reporte,"/home/esteban/Escritorio/sample_report.pdf");
        } catch (Exception j) {
            System.out.println("Mensaje de Error: " + j.getMessage()+"QQ"+j.toString());
        }
    }

    public String getIdAeropuerto() {
        System.out.println("@@@ GET");
        return idAeropuerto;
    }

    public void setIdAeropuerto(String idAeropuerto) {
        System.out.println("@@@ SET");
        this.idAeropuerto = idAeropuerto;
    }
   
    
    
    
}
