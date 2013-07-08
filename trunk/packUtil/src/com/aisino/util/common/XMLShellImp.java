package com.aisino.util.common;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class XMLShellImp implements IXMLShell {
	private static final Logger log = Logger.getLogger(XMLShellImp.class);

	private String rootNodeName = XMLShellFactory.rootElementName;

	public XMLShellImp() {
	}

	public XMLShellImp(String rootEleName) {
		this.rootNodeName = rootEleName;
	}

	public Document genXMLRootEle(Document document) {
		if (document == null) {
			document = DocumentHelper.createDocument();
		}

		document.addElement(this.rootNodeName);

		return document;
	}

	public void recurInsertEle(Element parentE, Object object) throws Exception {
		String fieldName = null;
		Class cls = null;
		Method methodTitle = null;
		Element secondE = null;
		Element thirdE = null;
		Object tmpObj = null;

		if ((parentE == null) || (object == null)) {
			log.warn("null object");
			return;
		}

		cls = object.getClass();
		log.debug("class name:" + cls.getName());
		if (object == null) {
			log.warn("----empty object----");
			return;
		}
		if (List.class.isInstance(object)) {
			List tList = (List) object;
			if (tList.size() == 0) {
				log.warn("----empty object----");
				return;
			}
			if ((tmpObj = tList.get(0)) != null) {
				secondE = parentE.addElement(getClsShortName(tmpObj.getClass())
						+ "S");
				secondE.addAttribute("class", getClsShortName(Array
						.newInstance(tmpObj.getClass(), 0).getClass()));
				secondE.addAttribute("size", String.valueOf(tList.size()));
				Iterator it = tList.iterator();
				while (it.hasNext()) {
					thirdE = secondE.addElement(getClsShortName(tmpObj
							.getClass()));
					recurInsertEle(thirdE, it.next());
				}
			} else {
				log.warn("----empty list----");
			}
		} else if (cls.isArray()) {
			fieldName = getClsShortName(cls.getComponentType());
			secondE = parentE.addElement(fieldName + "S");

			secondE.addAttribute("class", getClsShortName(cls));
			int len = 0;
			if ((object != null) && ((len = Array.getLength(object)) > 0)) {
				secondE.addAttribute("size", String.valueOf(len));
				for (int j = 0; j < len; j++) {
					thirdE = secondE.addElement(fieldName);
					if (isPrimitiveCls(cls.getComponentType())) {
						thirdE.setText(Array.get(object, j).toString());
					} else {
						recurInsertEle(thirdE, Array.get(object, j));
					}
				}
			} else {
				secondE.addAttribute("size", "0");
			}
		} else {
			if (parentE.getParent() == null) {
				parentE = parentE.addElement(getClsShortName(cls));
				parentE.addAttribute("class", getClsShortName(cls));
			}

			Field[] field = cls.getDeclaredFields();
			for (int i = 0; i < field.length; i++) {
				fieldName = field[i].getName();
				log.debug("field name:" + fieldName);
				if (fieldName.startsWith("class$")) {
					continue;
				}
				if ((fieldName.equals("ZY")) || (fieldName.equals("JYFW"))) {
					continue;
				}
				methodTitle = cls.getMethod(getOnetoUpperCase(fieldName),
						new Class[0]);
				log.debug("method name:" + methodTitle);
				Object childObj = methodTitle.invoke(object, null);

				if (!isPrimitiveCls(field[i].getType())) {
					if (field[i].getType().isArray()) {
						secondE = parentE.addElement(fieldName);
						secondE.addAttribute("class", getClsShortName(field[i]
								.getType()));
						int len = 0;
						if ((childObj != null)
								&& ((len = Array.getLength(childObj)) > 0)) {
							tmpObj = Array.get(childObj, 0);
							secondE.addAttribute("size", String.valueOf(len));

							for (int j = 0; j < len; j++) {
								thirdE = secondE
										.addElement(getClsShortName(field[i]
												.getType().getComponentType()));
								if (isPrimitiveCls(tmpObj.getClass())) {
									thirdE.setText(Array.get(childObj, j)
											.toString());
								} else {
									recurInsertEle(thirdE, Array.get(childObj,
											j));
								}
							}
						} else {
							secondE.addAttribute("size", "0");
						}

					} else if (childObj != null) {
						secondE = parentE.addElement(fieldName);
						secondE.addAttribute("class", getClsShortName(field[i]
								.getType()));

						recurInsertEle(secondE, childObj);
					}
				} else {
					secondE = parentE.addElement(fieldName);
					Object o = methodTitle.invoke(object, null);
					if (o != null)
						secondE.setText(o.toString());
				}
			}
		}
	}

	private String getClsShortName(Class cls) {
		String clsShortName = null;

		if (cls == null) {
			return null;
		}
		int lastDotIndex = cls.getName().lastIndexOf(".");
		if (lastDotIndex < 0) {
			log.error("error");
			return null;
		}
		clsShortName = cls.getName().substring(lastDotIndex + 1);
		return clsShortName;
	}

	private String getOnetoUpperCase(String str) {
		return "get" + firsttoUpperCase(str);
	}

	public String firsttoUpperCase(String str) {
		return Character.toUpperCase(str.charAt(0)) + str.substring(1);
	}

	private String getElementClassAtt(Element e) {
		Iterator attIt = e.attributeIterator();
		while (attIt.hasNext()) {
			Attribute attri = (Attribute) attIt.next();
			if ("class".equals(attri.getName().trim())) {
				if (attri.getValue().endsWith(";")) {
					return "[Lcom.aisino.protocol.bean." + attri.getValue();
				}
				return "com.aisino.protocol.bean." + attri.getValue();
			}

		}

		return null;
	}

	private String getElementSizeAtt(Element e) {
		Iterator attIt = e.attributeIterator();
		while (attIt.hasNext()) {
			Attribute attri = (Attribute) attIt.next();
			if ("size".equals(attri.getName().trim())) {
				return attri.getValue();
			}
		}

		return null;
	}

	private Object readEle(Element parentE, Class objCls) throws Exception {
		if ((objCls.isArray()) || (objCls.isAssignableFrom(List.class))
				|| (objCls.isAssignableFrom(ArrayList.class))) {
			log.error("parameters error");
			return null;
		}
		Object obj = objCls.newInstance();
		Field[] field = objCls.getDeclaredFields();
		String fieldName = null;
		for (Iterator it = parentE.elementIterator(); it.hasNext();) {
			Element ele = (Element) it.next();
			for (int i = 0; i < field.length; i++) {
				fieldName = field[i].getName();
				if (fieldName.startsWith("class$")) {
					continue;
				}

				if (fieldName.equals(ele.getName())) {
					field[i].setAccessible(true);
					recurSetObject(field[i], obj, ele);
					break;
				}
			}
		}
		return obj;
	}

	public List recurReadEle(Element parentE) throws Exception {
		List list = new ArrayList();
		Class parentCls = null;
		int arraySize = 0;
		String tmpStr = null;

		String parentClsName = getElementClassAtt(parentE);
		if ((parentClsName == null) || (parentClsName.equals(""))) {
			log.warn("--error paramter---");
			return null;
		}
		parentCls = Class.forName(parentClsName);

		tmpStr = getElementSizeAtt(parentE);
		if ((tmpStr != null) && (!tmpStr.equals(""))) {
			arraySize = new Integer(tmpStr).intValue();
		}

		if (parentCls.isArray()) {
			if (arraySize != 0) {
				int index = 0;
				Object object = Array.newInstance(parentCls.getComponentType(),
						arraySize);
				if (isPrimitiveCls(parentCls.getComponentType())) {
					for (Iterator firtIt = parentE.elementIterator(); firtIt
							.hasNext(); index++) {
						Element secondE = (Element) firtIt.next();
						Array.set(object, index, secondE.getTextTrim());
					}
				} else {
					index = 0;
					for (Iterator firtIt = parentE.elementIterator(); firtIt
							.hasNext(); index++) {
						Element secondE = (Element) firtIt.next();
						Object secondObj = readEle(secondE, parentCls
								.getComponentType());
						Array.set(object, index, secondObj);
					}
				}
				list.add(object);
			}
		} else {
			Object object = readEle(parentE, parentCls);
			list.add(object);
		}
		return list.size() == 0 ? null : list;
	}

	public void saveXML(Document document, File file, String encoding)
			throws IOException {
		OutputFormat format = OutputFormat.createPrettyPrint();
		XMLWriter writer = null;
		format.setEncoding(encoding);
		writer = new XMLWriter(new FileWriter(file), format);
		writer.write(document);
		writer.close();
	}

	public void saveXML(Document document, OutputStream out, String encoding)
			throws IOException {
		OutputFormat format = OutputFormat.createPrettyPrint();
		XMLWriter writer = null;
		format.setEncoding(encoding);
		writer = new XMLWriter(out, format);
		writer.write(document);
		writer.close();
	}

	public List parseXML(InputStream in) throws Exception {
		List list = new ArrayList();
		SAXReader sr = new SAXReader();
		Document doc = sr.read(in);
		Element root = doc.getRootElement();
		Iterator it = root.elementIterator();
		while (it.hasNext()) {
			Element firstE = (Element) it.next();
			list.add(recurReadEle(firstE));
		}
		return list;
	}

	public List parseXML(File file) throws Exception {
		List list = new ArrayList();
		SAXReader sr = new SAXReader();
		Document doc = sr.read(file);
		Element root = doc.getRootElement();
		Iterator it = root.elementIterator();
		while (it.hasNext()) {
			Element firstE = (Element) it.next();
			list.add(recurReadEle(firstE));
		}
		return list;
	}

	private void recurSetObject(Field field, Object object, Element element)
			throws Exception {
		String clsName = getElementClassAtt(element);
		List tList = null;

		log.debug("in recurSetObject element text = " + element.getTextTrim());

		if (field.getType().equals(Integer.TYPE)) {
			field.set(object, new Integer(element.getTextTrim()));
		} else if (field.getType().equals(Double.TYPE)) {
			field.set(object, new Double(element.getTextTrim()));
		} else if (field.getType().equals(Long.TYPE)) {
			field.set(object, new Long(element.getTextTrim()));
		} else if (field.getType().equals(String.class)) {
			field.set(object, element.getTextTrim());
		} else if (field.getType().isArray()) {
			if (clsName != null) {
				tList = recurReadEle(element);
				if (tList != null)
					field.set(object, tList.get(0));
				else
					field.set(object, null);
			} else {
				field.set(object, null);
			}
		} else if ((field.getType().equals(List.class))
				|| (field.getType().equals(ArrayList.class))) {
			tList = recurReadEle(element);
			field.set(object, tList);
			log.warn("----warning 对象中没有对list做支持----");
		} else {
			tList = recurReadEle(element);
			if (tList != null)
				field.set(object, tList.get(0));
			else
				field.set(object, null);
		}
	}

	private static boolean isPrimitiveCls(Class cls) {
		return (cls == String.class) || (cls.isPrimitive());
	}

	public String getRootNodeName() {
		return this.rootNodeName;
	}

	public void setRootNodeName(String rootNodeName) {
		this.rootNodeName = rootNodeName;
	}

	public static void recurOutPut(Object obj) {
		Class cls = obj.getClass();
		if (List.class.isInstance(obj)) {
			Iterator it = ((List) obj).iterator();
			while (it.hasNext()) {
				Object o = it.next();
				recurOutPut(o);
			}
		} else if (cls.isArray()) {
			int len = Array.getLength(obj);
			for (int i = 0; i < len; i++)
				recurOutPut(Array.get(obj, i));
		}
	}

	public static void testParse(String filePath, String encoding,
			String rootName) {
		File file = new File(filePath);
		IXMLShell xmlShell = new XMLShellImp(rootName);
		List list = new ArrayList();
		try {
			log.debug("--begin read xml--");
			list = xmlShell.parseXML(file);
			recurOutPut(list);
			log.debug("--finish read xml--");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	public static void testSeries(String filePath, String encoding,
			String rootName, Object obj) {
		File file = new File(filePath);
		IXMLShell xmlShell = new XMLShellImp(rootName);
		Document document = null;
		try {
			log.debug("--begin write xml--");
			document = xmlShell.genXMLRootEle(null);
			if ((obj.getClass().isAssignableFrom(List.class))
					|| (obj.getClass().isAssignableFrom(ArrayList.class))) {
				Iterator it = ((List) obj).iterator();
				while (it.hasNext())
					xmlShell.recurInsertEle(document.getRootElement(), it
							.next());
			} else {
				xmlShell.recurInsertEle(document.getRootElement(), obj);
			}
			xmlShell.saveXML(document, file, encoding);
			log.debug("--finish write xml--\n");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	public static void main(String[] args) {
		String fileName = "D:/山西税务/发票上传(抄报).xml";
		String rootName = "root";
		String encodeName = "UTF-8";

		testParse(fileName, encodeName, rootName);
	}

	public String xmlFilter(String xml) throws Exception {
		if ((xml == null) || ("".equals(xml))) {
			return xml;
		}
		return xml.replaceAll("[\\x00-\\x08\\x0b-\\x0c\\x0e-\\x1f]", "");
	}
}