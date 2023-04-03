package com.basic.reserve.constController;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.vo.Ticket;


public class APICall {
	
	private APICall(){};
	private static APICall api = new APICall();
	public static APICall getInstance() {
		return api;
	}
	
	public void getItem(String elementId,String s) throws IOException, SAXException, ParserConfigurationException {
		StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr"); /*URL*/
		urlBuilder.append("/" + URLEncoder.encode(elementId,"UTF-8")); /*Service Key*/
		urlBuilder.append("?" + URLEncoder.encode("service","UTF-8") + "=3a6e44a951484653af996a5f0c78bd8a");
		
		URL url = new URL(urlBuilder.toString());
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Content-type", "application/xml");
      BufferedReader rd;
      if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
          rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      } else {
          rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
      }
      StringBuilder sb = new StringBuilder();
      String line;
      while ((line = rd.readLine()) != null) {
      	
          sb.append(line);
      }
      rd.close();
      conn.disconnect();
      
      
      Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
      NodeList nodes = doc.getElementsByTagName("prfnm"); // 제목을 가져옴
      NodeList nodes2 = doc.getElementsByTagName("styurl"); //포스터를 가져옴
      NodeList nodes3 = doc.getElementsByTagName("genrenm"); //장르를 가져옴
      NodeList nodes4 = doc.getElementsByTagName("prfpdfrom"); //시작일
      NodeList nodes5 = doc.getElementsByTagName("prfpdto"); //마감일
      NodeList nodes6 = doc.getElementsByTagName("sty"); //줄거리
      NodeList nodes7 = doc.getElementsByTagName("fcltynm"); //장소
      NodeList nodes8 = doc.getElementsByTagName("prfruntime"); //길이
      NodeList nodes9 = doc.getElementsByTagName("pcseguidance"); //티켓가격
      	
      
      Element e1 = (Element) nodes.item(0);
      String title = e1.getTextContent();
      
      Element e2 = (Element) nodes2.item(0);
      String poster = e2.getTextContent();
      
      Element e3 = (Element) nodes3.item(0);
      String category = e3.getTextContent();
      
      Element e4 = (Element) nodes4.item(0);
      String startD = e4.getTextContent();
      
      Element e5 = (Element) nodes5.item(0);
      String endD = e5.getTextContent();
      
      startD = startD.replace(".","-");
      endD = endD.replace(".","-");
      
      Element e6 = (Element) nodes6.item(0);
      String info = e6.getTextContent();
      
      Element e7 = (Element) nodes7.item(0);
      String place = e7.getTextContent();
      
      Element e8 = (Element) nodes8.item(0);
      String duration = e8.getTextContent();
      
      Element e9 = (Element) nodes9.item(0);
      String price = e9.getTextContent();
		
      if(info.length() <= 1) {
    	 info = title + "입니다";
      }
      
      String intStr = price.replaceAll("[^0-9]", "");
      if(intStr.equals("")) {
    	  intStr = "15000";
      }else if(intStr.length() > 6) {
    	  intStr = "100000";
      }
      System.out.println(intStr + " ----- ");
      int tprice = Integer.parseInt(intStr);
      if(tprice <= 1000){
    	  tprice = tprice * 1000;
      }
  	Random rand = new Random();
  	   int randomNumber = rand.nextInt(5)+1; //2~4 
      //3~4
      int dis = rand.nextInt(10)+2;
      
      if(s.equals("GGGA")){
    	  s = "공연";
      }

      boolean flag = true;
      
      Ticket t = new Ticket(poster,category,s,title,startD,endD,info,place,duration,30,tprice,dis,randomNumber);
      List<Ticket>tlist = TicketDAO.getInstance().getAllTicketList();
      for (Ticket ticket : tlist) {
		if(ticket.getTitle().equals(t.getTitle())) {
			flag = false;
		}
	}
      if(flag) {
    	   TicketDAO.getInstance().addTicket(t);
      }
      
	}
	
	public void getId(String s) throws IOException, SAXException, ParserConfigurationException{
		
	   StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr"); /*URL*/
       urlBuilder.append("?" + URLEncoder.encode("service","UTF-8") + "=3a6e44a951484653af996a5f0c78bd8a"); /*Service Key*/
       urlBuilder.append("&" + URLEncoder.encode("stdate","UTF-8") + "=" + URLEncoder.encode("20230301", "UTF-8")); /*시작일*/
       urlBuilder.append("&" + URLEncoder.encode("eddate","UTF-8") + "=" + URLEncoder.encode("20230531", "UTF-8")); /*끝일*/
       urlBuilder.append("&" + URLEncoder.encode("cpage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
       urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한페이지당 수*/
       urlBuilder.append("&" + URLEncoder.encode("shcate","UTF-8") + "=" + URLEncoder.encode(s, "UTF-8")); /*카테고리*/ 
       
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/xml");
       BufferedReader rd;
       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
       } else {
           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
       }
       StringBuilder sb = new StringBuilder();
       String line;
       while ((line = rd.readLine()) != null) {
           sb.append(line);
       }
       rd.close();
       conn.disconnect();
        
       Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
       NodeList nodes = doc.getElementsByTagName("mt20id");
       for (int i = 0; i < nodes.getLength(); i++) {
           Element element = (Element) nodes.item(i);
           String mt20id = element.getTextContent();
           getItem(mt20id,s);
       }
		
	}
	
}
