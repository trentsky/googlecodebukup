package com.aisino.util;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.xml.sax.InputSource;

import com.aisino.bean.Data;
import com.aisino.bean.DataLogBean;
import com.aisino.bean.GlobalInfo;
import com.aisino.bean.LogBean;
import com.aisino.bean.ReturnStateInfo;
import com.aisino.util.common.XMLShellFactory;
/**
 * 数据交换封包解包公共类
 */
public class ProXml {
	private static final Logger log  =  Logger.getLogger(ProXml.class );
	/**
	 * 编码方法
	 * @param res
	 * @return
	 */
	public static String encode(String res) {
		try {
			Base64 base = new Base64();
			return new String(base.encode(res.getBytes()));
		} catch (Exception e) {
			log.error("base转码错误", e);
			return "";
		}

	}
	/**
	 * 解码方法
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String decode(String str) throws UnsupportedEncodingException {
		return new String(new Base64().decode(str.getBytes()));
	}
	/**
	 * 压缩方法
	 * @param str
	 * @return
	 */
	public static final String zip(String str) {
		if (str == null) {
			return null;
		}
		byte[] compressed;
		ByteArrayOutputStream out = null;
		ZipOutputStream zout = null;
		String compressedStr = null;
		try {
			out = new ByteArrayOutputStream();
			zout = new ZipOutputStream(out);
			zout.putNextEntry(new ZipEntry("0"));
			zout.write(str.getBytes());
			zout.closeEntry();
			compressed = out.toByteArray();
			compressedStr = new String(compressed);
		} catch (IOException e) {
			compressed = null;
		} finally {
			if (zout != null) {
				try {
					zout.close();
				} catch (IOException e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
				}
			}
		}
		return compressedStr;
	}

	/**
	 * 解压缩方法
	 * @param compressedStr
	 * @return
	 */
	public static final String unZip(String compressedStr) {
		if (compressedStr == null) {
			return null;
		}
		ByteArrayOutputStream out = null;
		ByteArrayInputStream in = null;
		ZipInputStream zin = null;
		String decompressed = null;
		try {
			byte[] compressed = new sun.misc.BASE64Decoder()
					.decodeBuffer(compressedStr);
			out = new ByteArrayOutputStream();
			in = new ByteArrayInputStream(compressed);
			zin = new ZipInputStream(in);
			zin.getNextEntry();
			byte[] buffer = new byte[1024];
			int offset = -1;
			while ((offset = zin.read(buffer)) != -1) {
				out.write(buffer, 0, offset);
			}
			decompressed = out.toString();
		} catch (IOException e) {
			decompressed = null;
		} finally {
			if (zin != null) {
				try {
					zin.close();
				} catch (IOException e) {
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
				}
			}
		}
		return decompressed;
	}
/**
 * 判断需不需要压缩方法
 * @param xml
 * @param size
 * @return
 */
	public static String isZip(String xml, int size) {
		if (xml == null) {
			xml = "";
		}
		String isz = "0";
		if (xml.getBytes().length > 1024 * 1024 * size) {
			isz = "1";
		}
		return isz;
	}
/**
 * 获取协议报文方法
 * @param globalInfo
 * @param returnStateInfo
 * @param data
 * @return
 */
	public static String getXml(GlobalInfo globalInfo,
			ReturnStateInfo returnStateInfo, Data data) {
		Element root;
		root = new Element(XmlPar.ROOT_BASE);
		Namespace ns = Namespace.getNamespace(XmlPar.NS_ONE);
		root.addNamespaceDeclaration(ns);
		Namespace ns1 = Namespace.getNamespace("xsi", XmlPar.NS_TWO);
		root.addNamespaceDeclaration(ns1);
		Namespace ns2 = Namespace.getNamespace("schemaLocation",
				XmlPar.NS_THREE);
		root.addNamespaceDeclaration(ns2);
		Document doc = new Document(root);
		Element eRoot = doc.getRootElement();
		eRoot.setAttribute("version", XmlPar.VERSION_NO);

		// 全局信息
		Element eGlobalInfo;
		eGlobalInfo = new Element(XmlPar.GLOBALINFO);
		// eGlobalInfo.setText(globalInfo.getGlobalInfo());
		Element eAppID;
		eAppID = new Element(XmlPar.APPID);
		eAppID.setText(globalInfo.getAppId());
		eGlobalInfo.addContent(eAppID);
		Element eInterfaceId;
		eInterfaceId = new Element(XmlPar.INTERFACEID);
		eInterfaceId.setText(globalInfo.getInterfaceId());
		eGlobalInfo.addContent(eInterfaceId);
		Element eInterfaceCode;
		eInterfaceCode = new Element(XmlPar.INTERFACECODE);
		eInterfaceCode.setText(globalInfo.getInterfaceCode());
		eGlobalInfo.addContent(eInterfaceCode);
		Element ERequestCode;
		ERequestCode = new Element(XmlPar.REQUESTCODE);
		ERequestCode.setText(globalInfo.getRequestCode());
		eGlobalInfo.addContent(ERequestCode);
		Element eRequestTime;
		eRequestTime = new Element(XmlPar.REQUESTTIME);
		eRequestTime.setText(globalInfo.getRequestTime());
		eGlobalInfo.addContent(eRequestTime);
		Element eResponseCode;
		eResponseCode = new Element(XmlPar.RESPONSECODE);
		eResponseCode.setText(globalInfo.getResponseCode());
		eGlobalInfo.addContent(eResponseCode);
		Element eDataExchangeId;
		eDataExchangeId = new Element(XmlPar.DATAEXCHANGEID);
		eDataExchangeId.setText(globalInfo.getDataExchangeId());
		eGlobalInfo.addContent(eDataExchangeId);
		// 返回信息
		Element eReturnStateInfo;
		eReturnStateInfo = new Element(XmlPar.RETURNSTATEINFO);
		// eReturnStateInfo.setText(returnStateInfo.getReturnStateInfo());
		Element eReturnCode;
		eReturnCode = new Element(XmlPar.RETURNCODE);
		eReturnCode.setText(returnStateInfo.getReturnCode());
		eReturnStateInfo.addContent(eReturnCode);
		Element eReturnMessage;
		eReturnMessage = new Element(XmlPar.RETURNMESSAGE);
		if (returnStateInfo.getReturnMessage() != null
				&& !returnStateInfo.getReturnMessage().equals("null")
				&& !returnStateInfo.getReturnMessage().equals("")) {
			eReturnMessage.setText(encode(returnStateInfo.getReturnMessage()));
		} else {
			eReturnMessage.setText("");
		}
		eReturnStateInfo.addContent(eReturnMessage);
		// 交换数据
		Element eData;
		eData = new Element(XmlPar.DATA);
		Element eDataDescription;
		eDataDescription = new Element(XmlPar.DATADESCRIPTION);
		Element eZipCode;
		eZipCode = new Element(XmlPar.ZIPCODE);
		String iszip = isZip(data.getContent(), 10);
		eZipCode.setText(iszip);
		eDataDescription.addContent(eZipCode);
		Element eEncryptCode;
		eEncryptCode = new Element(XmlPar.ENCRYPTCODE);
		eEncryptCode.setText(data.getEncryptCode());
		eDataDescription.addContent(eEncryptCode);
		Element eCodeType;
		eCodeType = new Element(XmlPar.CODETYPE);
		eCodeType.setText(data.getCodeType());
		eDataDescription.addContent(eCodeType);
		eData.addContent(eDataDescription);
		Element eContent;
		eContent = new Element(XmlPar.CONTENT);
		if (data.getContent() != null && !data.getContent().equals("")) {
			if (iszip.equals("1")) {
				eContent.setText(encode(zip(data.getContent())));
			} else {
				eContent.setText(encode(data.getContent()));
			}
		} else {
			eContent.setText("");
		}
		eData.addContent(eContent);
		root.addContent(eGlobalInfo);
		root.addContent(eReturnStateInfo);
		root.addContent(eData);
		ByteArrayOutputStream byteRsp = null;
		String resData = "";
		try {
			// 格式化xml
			Format format = Format.getCompactFormat();
			format.setEncoding("UTF-8");
			// Format format=Format.getPrettyFormat().setEncoding("utf-8");
			// 设置xml文件的缩进为2个空格
			format.setIndent(" ");
			XMLOutputter xmlout = new XMLOutputter(format);
			byteRsp = new ByteArrayOutputStream();
			xmlout.output(doc, byteRsp);
			resData = byteRsp.toString("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resData;
	}
	/**
	 * 获取报文里三个对象的方法
	 * @param requestMessage
	 * @return
	 */
	public static Map getInterface(String requestMessage) {
		Map map = new HashMap();
		try {
			StringReader read = new StringReader(requestMessage);
			InputSource source = new InputSource(read);
			SAXBuilder sb = new SAXBuilder();
			Document doc = sb.build(source);
			Element root = doc.getRootElement();
			List node = root.getChildren();
			if (node != null && node.size() > 0) {
				for (int i = 0; i < node.size(); i++) {
					Element e1 = (Element) node.get(i);
					if (e1.getName().equals(XmlPar.GLOBALINFO)) {
						GlobalInfo globalInfo = new GlobalInfo();
						globalInfo
								.setAppId(e1.getChild(XmlPar.APPID).getText() == null ? ""
										: e1.getChild(XmlPar.APPID).getText());
						globalInfo.setInterfaceId(e1.getChild(
								XmlPar.INTERFACEID).getText() == null ? "" : e1
								.getChild(XmlPar.INTERFACEID).getText());
						globalInfo.setInterfaceCode(e1.getChild(
								XmlPar.INTERFACECODE).getText() == null ? ""
								: e1.getChild(XmlPar.INTERFACECODE).getText());
						globalInfo.setRequestCode(e1.getChild(
								XmlPar.REQUESTCODE).getText() == null ? "" : e1
								.getChild(XmlPar.REQUESTCODE).getText());
						globalInfo.setRequestTime(e1.getChild(
								XmlPar.REQUESTTIME).getText() == null ? "" : e1
								.getChild(XmlPar.REQUESTTIME).getText());
						globalInfo.setResponseCode(e1.getChild(
								XmlPar.RESPONSECODE).getText() == null ? ""
								: e1.getChild(XmlPar.RESPONSECODE).getText());
						globalInfo.setDataExchangeId(e1.getChild(
								XmlPar.DATAEXCHANGEID).getText() == null ? ""
								: e1.getChild(XmlPar.DATAEXCHANGEID).getText());
						map.put(e1.getName(), globalInfo);
					}
					if (e1.getName().equals(XmlPar.RETURNSTATEINFO)) {
						ReturnStateInfo returneStateInfo = new ReturnStateInfo();
						returneStateInfo.setReturnCode(e1.getChild(
								XmlPar.RETURNCODE).getText() == null ? "" : e1
								.getChild(XmlPar.RETURNCODE).getText());
						if (e1.getChild(XmlPar.RETURNMESSAGE).getText() != null
								&& !e1.getChild(XmlPar.RETURNMESSAGE).getText()
										.equals("")) {
							returneStateInfo.setReturnMessage(new String(
									decode(e1.getChild(XmlPar.RETURNMESSAGE)
											.getText()) == null ? "" : e1
											.getChild(XmlPar.RETURNMESSAGE)
											.getText()));
						} else {
							returneStateInfo.setReturnMessage("");
						}
						map.put(e1.getName(), returneStateInfo);
					}
					if (e1.getName().equals(XmlPar.DATA)) {
						Data data = new Data();
						data.setDataDescription(e1.getChild(
								XmlPar.DATADESCRIPTION).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION).getText());
						data.setZipCode(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.ZIPCODE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.ZIPCODE).getText());
						data.setEncryptCode(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.ENCRYPTCODE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.ENCRYPTCODE).getText());
						data.setCodeType(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.CODETYPE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.CODETYPE).getText());
						log.info(e1.getChild(XmlPar.CONTENT).getText());
						if (e1.getChild(XmlPar.CONTENT).getText() != null
								&& !e1.getChild(XmlPar.CONTENT).getText()
										.equals("")) {
							if (data.getZipCode().equals("1")) {
								data.setContent(unZip(decode(e1.getChild(
										XmlPar.CONTENT).getText() == null ? ""
										: e1.getChild(XmlPar.CONTENT).getText())));
							} else {
								data.setContent(decode(e1.getChild(
										XmlPar.CONTENT).getText() == null ? ""
										: e1.getChild(XmlPar.CONTENT).getText()));
							}
						} else {
							data.setContent("");
						}
						// data.setContent(new
						// String(decode(data.getContent())));
						log.info(new String(data.getContent())
								+ "+=============请求数据");

						map.put(e1.getName(), data);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
/**
 * 发票开具获取报文里三个对象的方法
 * @param requestMessage
 * @return
 */
	public static Map getInterfacefpkj(String requestMessage) {
		Map map = new HashMap();
		try {
			StringReader read = new StringReader(requestMessage);
			InputSource source = new InputSource(read);
			SAXBuilder sb = new SAXBuilder();
			Document doc = sb.build(source);
			Element root = doc.getRootElement();
			List node = root.getChildren();
			if (node != null && node.size() > 0) {
				for (int i = 0; i < node.size(); i++) {
					Element e1 = (Element) node.get(i);
					if (e1.getName().equals(XmlPar.GLOBALINFO)) {
						GlobalInfo globalInfo = new GlobalInfo();
						globalInfo
								.setAppId(e1.getChild(XmlPar.APPID).getText() == null ? ""
										: e1.getChild(XmlPar.APPID).getText());
						globalInfo.setInterfaceId(e1.getChild(
								XmlPar.INTERFACEID).getText() == null ? "" : e1
								.getChild(XmlPar.INTERFACEID).getText());
						globalInfo.setInterfaceCode(e1.getChild(
								XmlPar.INTERFACECODE).getText() == null ? ""
								: e1.getChild(XmlPar.INTERFACECODE).getText());
						globalInfo.setRequestCode(e1.getChild(
								XmlPar.REQUESTCODE).getText() == null ? "" : e1
								.getChild(XmlPar.REQUESTCODE).getText());
						globalInfo.setRequestTime(e1.getChild(
								XmlPar.REQUESTTIME).getText() == null ? "" : e1
								.getChild(XmlPar.REQUESTTIME).getText());
						globalInfo.setResponseCode(e1.getChild(
								XmlPar.RESPONSECODE).getText() == null ? ""
								: e1.getChild(XmlPar.RESPONSECODE).getText());
						globalInfo.setDataExchangeId(e1.getChild(
								XmlPar.DATAEXCHANGEID).getText() == null ? ""
								: e1.getChild(XmlPar.DATAEXCHANGEID).getText());
						map.put(e1.getName(), globalInfo);
					}
					if (e1.getName().equals(XmlPar.RETURNSTATEINFO)) {
						ReturnStateInfo returneStateInfo = new ReturnStateInfo();
						returneStateInfo.setReturnCode(e1.getChild(
								XmlPar.RETURNCODE).getText() == null ? "" : e1
								.getChild(XmlPar.RETURNCODE).getText());
						if (e1.getChild(XmlPar.RETURNMESSAGE).getText() != null
								&& !e1.getChild(XmlPar.RETURNMESSAGE).getText()
										.equals("")) {
							returneStateInfo.setReturnMessage(new String(
									decode(e1.getChild(XmlPar.RETURNMESSAGE)
											.getText()) == null ? "" : e1
											.getChild(XmlPar.RETURNMESSAGE)
											.getText()));
						} else {
							returneStateInfo.setReturnMessage("");
						}
						map.put(e1.getName(), returneStateInfo);
					}
					if (e1.getName().equals(XmlPar.DATA)) {
						Data data = new Data();
						data.setDataDescription(e1.getChild(
								XmlPar.DATADESCRIPTION).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION).getText());
						data.setZipCode(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.ZIPCODE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.ZIPCODE).getText());
						data.setEncryptCode(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.ENCRYPTCODE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.ENCRYPTCODE).getText());
						data.setCodeType(e1.getChild(XmlPar.DATADESCRIPTION)
								.getChild(XmlPar.CODETYPE).getText() == null ? ""
								: e1.getChild(XmlPar.DATADESCRIPTION)
										.getChild(XmlPar.CODETYPE).getText());
						log.info(e1.getChild(XmlPar.CONTENT).getText());
						if (e1.getChild(XmlPar.CONTENT).getText() != null
								&& !e1.getChild(XmlPar.CONTENT).getText()
										.equals("")) {
							if (data.getZipCode().equals("1")) {
								data.setContent(unZip(e1.getChild(
										XmlPar.CONTENT).getText() == null ? ""
										: e1.getChild(XmlPar.CONTENT).getText()));
							} else {
								data.setContent(e1.getChild(XmlPar.CONTENT)
										.getText() == null ? "" : e1.getChild(
										XmlPar.CONTENT).getText());
							}
						} else {
							data.setContent("");
						}
						// data.setContent(new
						// String(decode(data.getContent())));
						log.info(new String(data.getContent())
								+ "+=============请求数据");

						map.put(e1.getName(), data);
					}
				}
			}
		} catch (Exception e) {
			log.error("发票开具解析包失败",e);
		}
		return map;
	}
/**
 * 传入日期格式参数返回当前时间
 * @param formatStyle
 * @return
 */
	public static String getCurDate(String formatStyle) {
		DateFormat format1 = new SimpleDateFormat(formatStyle);
		return format1.format(new Date());
	}
	/**
	 * 传入getGlobalInfo属性值返回getGlobalInfo对象
	 * @param interfaceCode
	 * @param requestCode
	 * @param responsecode
	 * @param dataExchangeId
	 * @return
	 */
	public static GlobalInfo getGlobalInfo(String interfaceCode,
			String requestCode, String responsecode, String dataExchangeId) {
		GlobalInfo globalInfo = new GlobalInfo();
		globalInfo.setAppId(XmlPar.WLFP);
		globalInfo.setInterfaceId("");
		globalInfo.setInterfaceCode(interfaceCode);
		globalInfo.setRequestCode(requestCode);
		globalInfo.setRequestTime(ProXml.getCurDate("yyyy-MM-dd HH:mm:ss"));
		globalInfo.setDataExchangeId(dataExchangeId);
		globalInfo.setResponseCode(responsecode);
		return globalInfo;
	}
/**
 * 传入ReturnStateInfo对象属性值返回ReturnStateInfo对象
 * @param returnStateCode
 * @param returnMessage
 * @return
 */
	public static ReturnStateInfo getReturnStateInfo(String returnStateCode,
			String returnMessage) {
		ReturnStateInfo returnStateInfo = new ReturnStateInfo();
		returnStateInfo.setReturnCode(returnStateCode);
		returnStateInfo.setReturnMessage(returnMessage);
		return returnStateInfo;
	}
/**
 * 传入Data对象属性值返回Data对象
 * @param out
 * @return
 */
	public static Data getData(byte[] out) {
		Data data = new Data();
		try {
			data.setEncryptCode("0");
			data.setCodeType("");
			String temp_str = new String(out);
			data.setZipCode(ProXml.isZip(temp_str, 10));
			data.setContent(temp_str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
/**
 * 替换字符串里的空格
 * @param s
 * @return
 */
	public static String replaceStr(String s) {
		return s.replaceAll(" ", "");
	}
/**
 * 获取日志对象方法
 * @param map
 * @param type
 * @return
 */
	public static LogBean getLogBean(Map map, String type) {
		LogBean logBean = new LogBean();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			GlobalInfo globalInfoR = (GlobalInfo) map.get(XmlPar.GLOBALINFO);
			ReturnStateInfo returnStateInfoR = (ReturnStateInfo) map.get(XmlPar.RETURNSTATEINFO);
			if (returnStateInfoR == null) {
				returnStateInfoR = new ReturnStateInfo();
			}
			logBean.setAppId(globalInfoR.getAppId());
			if(globalInfoR.getInterfaceCode().equals(XmlPar.DJNSRXX) || globalInfoR.getInterfaceCode().equals(XmlPar.NSRQR)){
//				logBean.setDataEcChangeId(ExchangeId.newIntence().getExchangeId(globalInfoR.getRequestCode()));
			}else{
				logBean.setDataEcChangeId(globalInfoR.getDataExchangeId());
			}
			logBean.setInterFaceCode(globalInfoR.getInterfaceCode());
			logBean.setInterFaceId(globalInfoR.getInterfaceId());
			logBean.setRequestCode(globalInfoR.getRequestCode());
			try {
				logBean.setRequestTime(sdf.parse(globalInfoR.getRequestTime()));
			} catch (Exception e) {
				logBean.setRequestTime(new Date());
			}
			logBean.setResponseCode(globalInfoR.getResponseCode());
			logBean.setReturnCode(returnStateInfoR.getReturnCode());
			logBean.setReturnMessage(returnStateInfoR.getReturnMessage());
			if (type.equals("response")) {
				logBean.setReturnMessage(ProXml.encode(returnStateInfoR.getReturnMessage()));
			}
			return logBean;
		} catch (Exception ce) {
			ce.printStackTrace();
			logBean.setAppId(XmlPar.WLFP);
			logBean.setDataEcChangeId("");
			logBean.setInterFaceCode("");
			logBean.setInterFaceId("");
			logBean.setRequestCode("");
			logBean.setRequestTime(new Date());
			logBean.setResponseCode("");
			logBean.setReturnCode("");
			logBean.setReturnMessage("获取请求或响应的报文数据失败，请检查报文数据！");
			if (type.equals("response")) {
				logBean.setReturnMessage(ProXml
						.encode("获取请求或响应的报文数据失败，请检查报文数据！"));
			}
			return logBean;
		}
	}
	/**
	 * 获取日志对象方法
	 * @param map
	 * @param type
	 * @return
	 */
	public static DataLogBean getDataLogBean(Map map) {
		DataLogBean dataLogBean = new DataLogBean();
		try {
			Data dataR = (Data) map.get(XmlPar.DATA);
			GlobalInfo globalInfoR = (GlobalInfo) map.get(XmlPar.GLOBALINFO);
			dataLogBean.setZipCode(dataR.getZipCode());
			dataLogBean.setResponseCode(globalInfoR.getResponseCode());
			dataLogBean.setRequestCode(globalInfoR.getRequestCode());
			dataLogBean.setEncryptCode(dataR.getEncryptCode());
			dataLogBean.setDataExChangeId(globalInfoR.getDataExchangeId());
			if (dataR.getContent() != null) {
				dataLogBean.setContent((dataR.getContent()).getBytes());
			}
			return dataLogBean;
		} catch (Exception ce) {
			ce.printStackTrace();
			dataLogBean.setZipCode("");
			dataLogBean.setResponseCode("");
			dataLogBean.setRequestCode("");
			dataLogBean.setEncryptCode("0");
			dataLogBean.setDataExChangeId("");
			dataLogBean.setContent("".getBytes());
			return dataLogBean;
		}
	}
/**
 * 获取协议count里的对象
 * @param xml
 * @return
 * @throws Exception
 */
	public static List getCountData(String xml) throws Exception {
		Base64 base64 = new Base64();
		XMLShellFactory factory = XMLShellFactory.newInstance();
//		xml = new String(base64.decode(xml.getBytes()));
		return (List) factory.generateDomainObject(xml).get(0);
	}
}
