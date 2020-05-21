<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>01JQ01Start</title>
        <script type="text/javascript" src="../common/jquery/jquery-3.5.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                alert("jQuery 시작하기1");
            });

            $().ready(function () {
                alert("jQuery 시작하기2");
            });
            jQuery(function () {
                alert("jQuery 시작하기3");
            });
            $(function () {
                alert("jQuery 시작하기4");
            });
        </script>
    </head>
    <body>
        <h2>jQuery 사용하기</h2>
        <script>
            alert("HTML문서 끝");
        </script>
    </body>
</html>
