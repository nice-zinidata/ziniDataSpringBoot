<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bizmap</title>
    <%@ include file="/WEB-INF/views/sample/include/head.jsp" %>
</head>
<body>
<h2>현재시간: ${mainVO.currentTime}</h2>

<table id="table1">
    <colgroup>
        <col width="10%">
        <col width="10%">
        <col width="10%">
        <col width="10%">
    </colgroup>
    <thead>
    <tr>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
    </tr>
    </thead>
    <tbody id="table1_tbody">

    </tbody>
</table>
</body>
</html>

<%@ include file="/WEB-INF/views/sample/include/script.jsp" %>

<script type="text/javascript">

    $(function (){
        var data={
            id:1
            , name:2
        }
        getAjax("login", "/sample/api/mainList", data, fn_succ_mainList, fn_error);
    });

    function fn_succ_mainList(id, response){
        var template = $('#tmp_table1_tbody').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        console.log(context);
        var html = templateScript(context);
        $('#table1_tbody').html(html);
    }

    function fn_error(response) {
        console.log(response);
        console.log('error');
    }

</script>

<script type="text/x-handlebars-template" id="tmp_table1_tbody">
    {{#each data}}
    <tr>
        <td>{{data1}}</td>
        <td>{{data2}}</td>
        <td>{{data3}}</td>
        <td>{{data4}}</td>
    </tr>
    {{else}}
    <tr>
        데이터없음
    </tr>
    {{/each}}
</script>