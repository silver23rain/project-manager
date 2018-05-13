<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/none.js"></script>

<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all"/>
<style>
    #chartdiv {
        width: 100%;
        height: 500px;
    }
</style>
<section id="main-content">
    <section class="wrapper">
        <div class="col-md-12 mt">
            <h2 id="sprint_title"><i class="fa fa-angle-right"></i>보고서</h2>
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">번다운 차트</a></li>
                <li role="presentation"><a href="#"></a></li>
                <li role="presentation"><a href="#"></a></li>
            </ul>
            <div class="panel">
                <div id="chartdiv"></div>
            </div>
        </div>
    </section>
</section>
<xmldata id="reportXmlData" data-sprintData="<c:out value="${sprintData}"/>">
</xmldata>
<script >
    var $xmlData = document.getElementById("reportXmlData");
    var sprintData = JSON.parse($xmlData.getAttribute("data-sprintData"));
    $(function () {
        console.log(sprintData);
        Report.init();

    })
</script>
<script src="/resources/js/project/report.js"/>
