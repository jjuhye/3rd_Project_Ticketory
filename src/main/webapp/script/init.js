let flag = true;

function check(){
	if(sessionStorage.getItem('ck') == null){
		sessionStorage.setItem('ck',true)
		
		
		
		
	}	
}

check();

let SeriveKey = '3a6e44a951484653af996a5f0c78bd8a';
//
window.onload = function() {
	
	function getInfo() {
		$.ajax({
			
    		type: "GET",
    		
    		url: "http://www.kopis.or.kr/openApi/restful/pblprfr?service=`+SeriveKey+`&stdate=20221201&eddate=20230401&cpage=1&rows=10"
    		,
    		success: function(response){
				alert("들어옴");
                let XmlNode = new DOMParser().parseFromString(response, "text/xml");
                let obj = xmlToJson(XmlNode);
                console.log(obj);
    			

                let item = [...obj.response.body.items.item];
                console.log(item);
                
                item.forEach(e => {
                    console.log(e.title)
                });

    		}
    		})
	}
	getInfo();
	
}

function xmlToJson(xml) {
  // Create the return object
  var obj = {};

  if (xml.nodeType == 1) {
    // element
    // do attributes
    if (xml.attributes.length > 0) {
      obj["@attributes"] = {};
      for (var j = 0; j < xml.attributes.length; j++) {
        var attribute = xml.attributes.item(j);
        obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
      }
    }
  } else if (xml.nodeType == 3) {
    obj = xml.nodeValue;
  }

  var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
    return node.nodeType === 3;
  });
  if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
    obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
      return text + node.nodeValue;
    }, "");
  } else if (xml.hasChildNodes()) {
    for (var i = 0; i < xml.childNodes.length; i++) {
      var item = xml.childNodes.item(i);
      var nodeName = item.nodeName;
      if (typeof obj[nodeName] == "undefined") {
        obj[nodeName] = xmlToJson(item);
      } else {
        if (typeof obj[nodeName].push == "undefined") {
          var old = obj[nodeName];
          obj[nodeName] = [];
          obj[nodeName].push(old);
        }
        obj[nodeName].push(xmlToJson(item));
      }
    }
  }
  return obj;
}


