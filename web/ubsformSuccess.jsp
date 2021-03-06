<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%    
    String cnes = (String) session.getAttribute("cnes"); 
    String nomeFantasia = (String) session.getAttribute("nomeFantasia"); 
    String razaoSocial = (String) session.getAttribute("razaoSocial");
    String telefone = (String) session.getAttribute("telefone"); 
    String cep = (String) session.getAttribute("cep");   
    String login = (String) session.getAttribute("login");
%>

<jsp:useBean id="userAdmin" class="br.immunit.dao.LoginDAO" />
<c:if test="${!login.equals('Admin')}" >
    <c:forEach var="ua" items="<%=userAdmin.perfilUser(login)%>">
        <c:if test="${!ua.funcao.equals('Administrador')}">
            <jsp:forward page="main.jsp"></jsp:forward>
        </c:if>
    </c:forEach>
</c:if>

<jsp:useBean id="l_UbsFormSuccess" class="br.immunit.dao.EnderecoDAO" />
<c:forEach var="e" items="<%=l_UbsFormSuccess.preencheLista(cep)%>">                   

    <h1 class="page-header">Adicionar UBS</h1>

    <form method="post" action="enderecoUbs.do">

        <div class="form-group">
            <label for="cnes">CNES</label>
            <input type="text" name="cnes" id="cnes" class="form-control" value="<%=cnes%>">
        </div>

        <div class="form-group">
            <label for="nomefantasia">Nome Fantasia</label>
            <input type="text" name="nomefantasia" id="nomefantasia" class="form-control" value="<%=nomeFantasia%>">
        </div>

        <div class="form-group">
            <label for="razaosocial">Raz�o Social</label>
            <input type="text" name="razaosocial" id="razaosocial" class="form-control" value="<%=razaoSocial%>">
        </div>

        <div class="form-group" style="padding-bottom: 10px;"> 

            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone" class="form-control" value="<%=telefone%>">
            </div> 

            <div class="col-sm-2" style="padding-left: 0px;">
                <label for="cep">CEP</label>
                <input type="text" name="cep" id="cep" class="form-control" value="${e.cep}">
            </div> 
            <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
                <button type="submit" class="btn btn-default btn-sm">
                    <span class="glyphicon glyphicon-search"></span> Pesquisar
                </button>
            </div> 
            
    </form>  

    <form method="post" action="cadastrarUbs.do">    

        <input type="hidden" name="cnesOculto" id="cnesOculto" value="<%=cnes%>">
        <input type="hidden" name="nomefantasiaOculto" id="nomefantasiaOculto" value="<%=nomeFantasia%>">
        <input type="hidden" name="razaosocialOculto" id="razaosocialOculto" value="<%=razaoSocial%>">
        <input type="hidden" name="telefoneOculto" id="telefoneOculto" value="<%=telefone%>">
        <input type="hidden" name="cepOculto" id="cepOculto" value="${e.cep}">

            <div class="col-sm-5">
                <label for="endereco">Endere�o</label>
                <input type="text" name="endereco" id="endereco" class="form-control" value="${e.endereco}">
            </div>

            <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
                <label for="numero">N�mero</label>
                <input type="text" name="numero" id="numero" class="form-control" 
                       onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;">
            </div>
        </div>

        <div class="form-group" style="padding-bottom: 10px;">
            <div class="col-sm-4" style="padding-left: 0px;">
                <label for="bairro">Bairro</label>
                <input type="text" name="bairro" id="bairro" class="form-control" value="${e.bairro}">
            </div>

            <div class="col-sm-4">
                <label for="cidade">Cidade</label>
                <input type="text" name="cidade" id="cidade" class="form-control" value="${e.cidade}">
            </div>

            <div class="col-sm-2" style="padding-right: 0px;">
                <label for="estado">UF</label>
                <input type="text" name="estado" id="estado" class="form-control" maxlength="2" value="${e.estado}"  
                       onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return false; else return true;">
            </div>

            <div class="col-sm-2"  style="padding-right: 0px; padding-top: 38px; padding-left: 35px;">
                <label for="ativo">Ativo?</label>
                <input type="checkbox" name="ativo" id="ativo">
            </div>
        </div>
        
        <div class="pull-right">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button>
        </div>
        
    </form>
            
</c:forEach>
    
<%@include  file="includes/_footer.jsp" %>