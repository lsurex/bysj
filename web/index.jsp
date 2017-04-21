<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/24
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <script src="/static/js/jquery/jquery-3.1.1.min.js"></script>
  <script>
    $.ready(function () {

      $("#dadsa").click(function () {
        $.post("/ls",{ls:"123"},function () {
          alert(123)
        })
     /*   $.ajax({
          type:'POST',
          url:"/excle/upload",
          data:{ls:"123"},
          dataType:'json',
          success:function (data) {
            alert(data);
          },
          error:function (data) {
            alert(data)
          }

        })*/
      })

    })
  </script>
</head>
<body>
<form id="my">
  <input type="text">

</form>
<button id="dadsa" type="button">12313</button>
</body>


</html>
