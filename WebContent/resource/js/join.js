
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById('postcode').value=data.zonecode;
        	/* document.getElementById('addr').value = data.roadAddress;
        	document.getElementById('addr').value = data.jibunAddress; */
        	roadAddr = data.roadAddress;
        	jibunAdd = data.jibunAddress;
        	extraAddr = '';
        	if(roadAddr != ''){
        		if(data.bname != ''){
        			extraAddr += data.bname;
        		}
        		if(data.buildingName != ''){
        			extraAddr += (extraAddr != '') ?','+ data.buildingName : data.buildingName
        		}
        		roadAddr += extraAddr != ''? '('+extraAddr+')' : '';
        		document.getElementById('addr').value = roadAddr;
        	}else if(jibunAdd != ''){
        		document.getElementById('addr').value = jibunAdd;
        	}
          	regFrm.detailaddress.focus();
        }
    }).open();
}
