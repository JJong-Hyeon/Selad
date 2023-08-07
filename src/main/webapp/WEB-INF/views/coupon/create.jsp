<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Coupon</title>
</head>
<body>
    <h1>쿠폰 생성</h1>
    <form action="/coupon/create" method="post">
        <label for="ccode">쿠폰코드:
			<select id="ccode" name="ccode"  onchange="updateFields()">
			  <option value="selad_001">selad_001</option>
			  <option value="selad_002">selad_002</option>
			  <option value="selad_003">selad_003</option>
			  <option value="selad_004">selad_004</option>
			</select>
		</label><br>
        <label for="userid">회원아이디:</label>
        <input type="text" id="userid" name="userid" required><br>
        <label for="csd">발급기준:</label>
        <input type="text" id="csd" name="csd" required readonly><br>
        <label for="cname">쿠폰명:</label>
        <input type="text" id="cname" name="cname" required readonly><br>
        <label for="ccon">할인내용:</label>
        <input type="text" id="ccon" name="ccon" required readonly><br>
        <button type="submit">Create</button>
    </form>
    
       <script>
    function updateFields() {
        var ccode = document.getElementById("ccode").value;
        var csdField = document.getElementById("csd");
        var cnameField = document.getElementById("cname");
        var cconField = document.getElementById("ccon");

        if (ccode === "selad_001") {
            csdField.value = "웰컴쿠폰";
            cnameField.value = "1000원할인권";
            cconField.value = "1000원할인";
        } else if (ccode === "selad_002") {
            csdField.value = "좋아요 100회 이상";
            cnameField.value = "2000원할인권";
            cconField.value = "2000원할인";
        } else if (ccode === "selad_003") {
            csdField.value = "10회 이상 주문";
            cnameField.value = "3000원할인권";
            cconField.value = "3000원할인";
        } else if (ccode === "selad_004") {
            csdField.value = "이 달의 최고 조합";
            cnameField.value = "5000원할인권";
            cconField.value = "5000원할인";
        } else {
            csdField.value = "";
            cnameField.value = "";
            cconField.value = "";
        }
    }
</script>

</body>
</html>
