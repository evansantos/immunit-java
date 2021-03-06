<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@include file="includes/_header.jsp" %> 

<%
    session.removeAttribute("lote");
    session.removeAttribute("data");
    session.removeAttribute("quantidade");
    
    String login = (String) session.getAttribute("login");
%>

<c:if test="${!login.equals('Admin')}" >
<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
    <c:if test="${!ua.funcao.equals('Gerente')}">
        <jsp:forward page="main.jsp"></jsp:forward>
    </c:if>
</c:forEach>
</c:if>

<h1 class="page-header">Controle de vacinas</h1>

<form method="post" action="pesquisaLote.do">
    <div class="form-group">
        <div class="col-sm-2" style="padding-left: 0;">
            <label>Buscar Vacina</label>
            <input type="text" name="pesquisaLote" id="pesquisaLote" class="form-control" style="">
            <input type="hidden" name="log" id="log" class="form-control" style="" value="<%=login%>">
        </div>
        <div class="col-sm-2" style="padding-top: 25px; padding-left: 0">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisar
            </button>
        </div>
    </div>
</form>

<table class="table table-striped table-condensed">
    <thead>
        <tr>
            <th>C�digo</th>
            <th>Nome</th>
            <th>Lote</th>
            <th>Validade</th>
            <th>Quantidade</th>
            <th style="text-align:right;">
                <a href="vacineControlForm.jsp">
                    <button type="button" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Adicionar
                    </button>
                </a>
            </th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <td colspan="6"></td>
        </tr>
    </tfoot>
</table>

<%@include  file="includes/_footer.jsp" %>
