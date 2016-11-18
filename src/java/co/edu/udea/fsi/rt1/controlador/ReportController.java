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
    
    private int idAeropuerto;
    public Connection conn ;
    /**
     * Creates a new instance of ReportController
     */
    public ReportController() {
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance(); //se carga el driver
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/softfly", "root", "root");
            System.out.println("@@@@@@@@@@@@Conexion establecida");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void reportar(){
        System.out.println("@@@@@@@@@@@@"+conn);
         try {
            String archivo = "AeropuertoRutaReporte.jasper";
            System.out.println("Cargando desde: " + archivo);
            if (archivo == null) {
                System.out.println("No se encuentra el archivo.");
                System.exit(2);
            }
            File ruta = new File("/AeropuertoRutaReporte.jasper");
            JasperReport masterReport = null;
            try {
                masterReport = (JasperReport) JRLoader.loadObjectFromFile("/home/estudiantelis/Escritorio/FSI/RTF01_FSI_2016/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper");
                System.out.println("@@@@Miedos");
            } catch (JRException e) {
                System.out.println("Error cargando el reporte maestro: " + e.getMessage());
                System.exit(3);
            }
//este es el parámetro, se pueden agregar más parámetros
//basta con poner mas parametro.put
            Map parametro = new HashMap();
            parametro.put("idAeropuerto", idAeropuerto);//Reporte diseñado y compilado con iReport
            //JasperPrint jasperPrint = JasperFillManager.fillReport(masterReport, parametro, conn);
            String reporte = JasperFillManager.fillReportToFile("/home/estudiantelis/Escritorio/FSI/RTF01_FSI_2016/src/java/co/edu/udea/fsi/rt1/controlador/AeropuertoRutaReporte.jasper", parametro, conn);
            System.out.println("@@@@Miedo2"+ parametro);
             JasperExportManager.exportReportToPdfFile(reporte,"/home/estudiantelis/Escritorio/sample_report.pdf");
//Se lanza el Viewer de Jasper, no termina aplicación al salir
//            JasperViewer jviewer = new JasperViewer(jasperPrint, false);
//            System.out.println("@@@@Miedo3");
//            jviewer.setTitle("SoftFly -Reporte");
//            jviewer.setVisible(true);
        } catch (Exception j) {
            System.out.println("Mensaje de Error: " + j.getMessage()+"QQ"+j.toString());
        }
    }
    public int getIdAeropuerto() {
        return idAeropuerto;
    }

    public void setIdAeropuerto(int idAeropuerto) {
        this.idAeropuerto = idAeropuerto;
    }
    
    
    
}
