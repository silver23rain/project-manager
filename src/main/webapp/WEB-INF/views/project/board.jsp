<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="main-content">
    <section class="wrapper">
        <div class="col-md-12 mt">
            <h3><i class="fa fa-angle-right"></i></h3>
            <div class="panel">
            </div>
        </div>
    </section>
</section>
<xmldata id="boardXmlData"
         data-backLogList="<c:out value="${backLogList}"/>"
         data-sprintNameList="<c:out value="${sprintNameList}"/>">
</xmldata>