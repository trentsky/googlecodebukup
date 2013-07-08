package com.aisino;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.aisino.bean.Data;
import com.aisino.bean.GlobalInfo;
import com.aisino.bean.ReturnStateInfo;
import com.aisino.protocol.bean.Nsrqrqc;
import com.aisino.protocol.bean.Request_Nsrqrqc;
import com.aisino.util.ProXml;
import com.aisino.util.XmlPar;
import com.aisino.util.common.XMLShellFactory;

public class Test {
	public static void main(String[] args) {
		//封装xml
		GlobalInfo glo =ProXml.getGlobalInfo("123", "123", "123", "123");
		ReturnStateInfo res = ProXml.getReturnStateInfo("0000", "成功");
		
		Nsrqrqc nsrqrqc = new Nsrqrqc();
		List<Request_Nsrqrqc> list = new ArrayList<Request_Nsrqrqc>();
		
		Request_Nsrqrqc req_qrqc1 = new Request_Nsrqrqc();
		req_qrqc1.setNsrdzdah("纳税人电子档案号1");
		req_qrqc1.setNsrsbh("纳税人识别号1");
		list.add(req_qrqc1);
		
		Request_Nsrqrqc req_qrqc2 = new Request_Nsrqrqc();
		req_qrqc2.setNsrdzdah("纳税人电子档案号2");
		req_qrqc2.setNsrsbh("纳税人识别号2");
		list.add(req_qrqc2);
		
		nsrqrqc.setRequest_Nsrqrqcs(list.toArray(new Request_Nsrqrqc[list.size()]));
		ByteArrayOutputStream out= new ByteArrayOutputStream();
		XMLShellFactory.newInstance().saveXml(out, nsrqrqc);
		Data data = ProXml.getData(out.toByteArray());
		String requestXml = ProXml.getXml(glo, res, data);
		System.out.println(requestXml);
		
		//解析封装的xml
		Map reqMap = ProXml.getInterface(requestXml);
		Data data1 =  (Data)reqMap.get(XmlPar.DATA);
		try {
//			Request_Nsrqrqc REQUEST_NSRQRQC = (Request_Nsrqrqc)ProXml.getCountData(data1.getContent()).get(0);
//			System.out.println(REQUEST_NSRQRQC.getNsrdzdah());
			Nsrqrqc Nsrqrqc = (Nsrqrqc) ProXml.getCountData(data1.getContent()).get(0);
			System.out.println(Nsrqrqc.getRequest_Nsrqrqcs()[0].getNsrdzdah());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
