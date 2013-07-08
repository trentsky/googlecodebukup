package com.aisino.util.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

public abstract interface IXMLShell
{
  public abstract List parseXML(InputStream paramInputStream)
    throws Exception;

  public abstract List parseXML(File paramFile)
    throws Exception;

  public abstract void saveXML(Document paramDocument, File paramFile, String paramString)
    throws IOException;

  public abstract void saveXML(Document paramDocument, OutputStream paramOutputStream, String paramString)
    throws IOException;

  public abstract Document genXMLRootEle(Document paramDocument);

  public abstract void recurInsertEle(Element paramElement, Object paramObject)
    throws Exception;

  public abstract List recurReadEle(Element paramElement)
    throws Exception;

  public abstract String xmlFilter(String paramString)
    throws Exception;
}