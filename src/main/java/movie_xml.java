import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class movie_xml {

   	 // tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, Element eElement) {

            	//결과를 저장할 result 변수 선언
            	String result = "";

	    	NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

	    	result = nlList.item(0).getTextContent();

	    	return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, String childTag, Element eElement) {

		//결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {

			//result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}

		return result;
	}

	public static void main(String[] args) {

		// 본인이 받은 api키를 추가
		String key = "3a6e44a951484653af996a5f0c78bd8a";

		try{
			// parsing할 url 지정(API 키 포함해서)
			String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key="+key+"&movieCd=20124079";
			//http://www.kopis.or.kr/openApi/restful/pblprfr?service={SeriveKey}&stdate=20160601&eddate=20160630&cpage=1&rows=5&prfstate=02&signgucode=11&signgucodesub=1111&kidstate=Y
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();
			
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("movieInfo");

			for(int temp = 0; temp < nList.getLength(); temp++){
				Node nNode = nList.item(temp);
			
				Element eElement = (Element) nNode;
				
				System.out.println("영화코드 : " + getTagValue("movieCd", eElement));
				System.out.println("영화명(한글) : " + getTagValue("movieNm", eElement));
				System.out.println("영화명(영문) : " + getTagValue("movieNmEn", eElement));
				System.out.println("재생시간 : " + getTagValue("showTm", eElement));
				System.out.println("개봉일 : " + getTagValue("openDt", eElement));
				System.out.println("영화유형 : " + getTagValue("typeNm", eElement));
				System.out.println("제작국가명 : " + getTagValue("nationNm", eElement));
				System.out.println("장르 : " + getTagValue("genres", "genre",eElement));
				System.out.println("감독명 : " + getTagValue("directors", "director",eElement));
				System.out.println("출연배우 : " + getTagValue("actors", "actor", eElement));
			}
			
		} catch (Exception e){	
			e.printStackTrace();
		}	
	}

}
