<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${!empty msg }">
	<script>
		alert('"${msg}"');
	</script>
</c:if>
