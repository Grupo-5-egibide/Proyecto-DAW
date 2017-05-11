package Parsers;

import Modelo.BD.ParteBD;
import Modelo.UML.Parte;
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.sun.org.apache.xml.internal.serialize.XMLSerializer;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
/**
 *
 * @author Aroa, Adrián y Jon
 */
public class DOMParserAplicacion {
    
    private ArrayList listaPartes;
    private Document dom;
    private static Element element;
      Element rootElement;
      
    public DOMParserAplicacion() throws Exception {
        
        listaPartes = new ArrayList(); 
        listaPartes = ParteBD.obtenerPartes();
        for(int x = 0; x < listaPartes.size(); x++); 
    }
    
    
    public void runExample() throws ParseException, Exception {
               

        creardocxml();
        createDOMTree();

        printToFile();
        XMLtoHTML();
    }

    private void creardocxml() {
        try {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
                dom = docBuilder.newDocument();
		element= dom.createElement("partes");
		dom.appendChild(element);
            } catch (ParserConfigurationException pce) {
		pce.printStackTrace();
            }
    }
     private void createDOMTree() {   
        Iterator it = listaPartes.iterator();
        while (it.hasNext()) {
            Parte p = (Parte) it.next();
            element.appendChild(createParteElement(p));
        }
    }
     private Element createParteElement(Parte p) {
        Element parte = dom.createElement("partes");
            element.appendChild(parte);
            
            
        Element idParte = dom.createElement("idParte");
        idParte.appendChild(dom.createTextNode(p.getIdParte().toString()));
        parte.appendChild(idParte);

        Element kmInicio = dom.createElement("kmInicio");
        kmInicio.appendChild(dom.createTextNode(p.getKmInicio().toString()));
        parte.appendChild(kmInicio);
        
        Element kmFin = dom.createElement("kmFin");
        kmFin.appendChild(dom.createTextNode(p.getKmFin().toString()));
        parte.appendChild(kmFin);
        
        Element gasto = dom.createElement("gasto");
        gasto.appendChild(dom.createTextNode(p.getGasto().toString()));
        parte.appendChild(gasto);

        Element incidencia = dom.createElement("incidencia");
        incidencia.appendChild(dom.createTextNode(p.getIncidencia()));
        parte.appendChild(incidencia);
        
        Element estado = dom.createElement("estado");
        estado.appendChild(dom.createTextNode(p.getEstado()));
        parte.appendChild(estado);
      
        return parte;
    }

    private void printToFile() {

        try {
            OutputFormat format = new OutputFormat(dom);
            format.setIndenting(true);
            
            XMLSerializer serializer = new XMLSerializer(
                    new FileOutputStream(new File("PartesMensuales/ParteMen.xml")), format);

            serializer.serialize(dom);

        } catch (IOException ie) {
            ie.printStackTrace();
        } 
    }
    
        
    public static void XMLtoHTML(){
          try {
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Source xslDoc = new StreamSource ("PartesMensuales/estilo.xsl");
            Source xmlDoc = new StreamSource ("PartesMensuales/ParteMen.xml");
    
            String outputFileName="PartesMensuales/Partes_Mensuales.html";
   
            OutputStream htmlFile=new FileOutputStream(outputFileName);
            Transformer transformer = tFactory.newTransformer(xslDoc);
            transformer.transform(xmlDoc, new StreamResult(htmlFile));
          }
          catch (Exception e) {
            e.printStackTrace( );
            }
    }
}
    
