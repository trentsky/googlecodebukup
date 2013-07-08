package com.aisino.util.common;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.dom4j.Document;

public class XMLShellFactory
{
  public static String xmlCharset = "UTF-8";
  public static String rootElementName = "ROOT";
  private static final Logger log  =  Logger.getLogger(XMLShellFactory.class );
  private static XMLShellFactory factory;

  static
  {
    InputStream inputStream = XMLShellFactory.class.getResourceAsStream(
      "/config/commonConfig.properties");
    Properties prop = new Properties();
    try {
      prop.load(inputStream);
      if (prop.getProperty("xmlCharset") != null) {
        xmlCharset = prop.getProperty("xmlCharset");
      }
      if (prop.getProperty("rootElementName") != null) {
        rootElementName = prop.getProperty("rootElementName");
      }
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
  }

  public static XMLShellFactory newInstance()
  {
    if (factory == null) {
      factory = new XMLShellFactory();
    }
    return factory;
  }

  public List generateDomainObject(String xml)
    throws Exception
  {
    IXMLShell xmlShell = new XMLShellImp();

    InputStream is = new ByteArrayInputStream(xmlShell.xmlFilter(xml).getBytes(xmlCharset));
    List list = xmlShell.parseXML(is);
    return list;
  }

  public boolean saveXml(OutputStream out, Object obj)
  {
    IXMLShell xmlShell = new XMLShellImp(rootElementName);
    Document document = null;
    try
    {
      log.info("--begin save xml to out--");

      if (obj == null) {
        log.error("null obj param");
        return false;
      }
      document = xmlShell.genXMLRootEle(null);
      if ((obj.getClass().isAssignableFrom(List.class)) || 
        (obj.getClass().isAssignableFrom(ArrayList.class))) {
        Iterator it = ((List)obj).iterator();
        while (it.hasNext())
          xmlShell.recurInsertEle(document.getRootElement(), it.next());
      } else {
        xmlShell.recurInsertEle(document.getRootElement(), obj);
      }

      xmlShell.saveXML(document, out, xmlCharset);

      log.info("--finish save xml--\n");
    }
    catch (Exception e) {
      e.printStackTrace();
      log.error(e.getMessage());
      return false;
    }
    return true;
  }

  public String getXml(Object object)
    throws Exception
  {
    if (object == null) {
      return "";
    }
    IXMLShell xmlShell = new XMLShellImp(rootElementName);
    Document document = xmlShell.genXMLRootEle(null);
    if ((object.getClass().isAssignableFrom(List.class)) || 
      (object.getClass().isAssignableFrom(ArrayList.class))) {
      Iterator it = ((List)object).iterator();
      while (it.hasNext())
        xmlShell.recurInsertEle(document.getRootElement(), it.next());
    } else {
      xmlShell.recurInsertEle(document.getRootElement(), object);
    }
    return document.asXML();
  }
}