<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%@include file="includes/_header.jsp" %>

<%
    String cpf = (String) session.getAttribute("cpf"); 
    String rg = (String) session.getAttribute("rg"); 
    String nome = (String) session.getAttribute("nome");
    String sobrenome = (String) session.getAttribute("sobrenome");
    String sexo = (String) session.getAttribute("sexo");
    String datanascimento = (String) session.getAttribute("datanascimento");
    String email = (String) session.getAttribute("email");
    String cep = (String) session.getAttribute("cep");   
    
    if(cep != null){
    }else{
        cpf = "";
        rg = "";
        nome = "";
        sobrenome = "";
        sexo = "F";
        datanascimento = "";
        email = "";
        cep = ""; 
    }
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

<h1 class="page-header">Adicionar Usu�rio</h1>

<form role="form" method="post" action="enderecoUser.do">
    
    <div class="form-group">
        
        <div class="col-sm-6" style="padding-left: 0px;">
            <label for="cpf">CPF</label>
            <input type="text" name="cpf" id="cpf" class="form-control" value="<%=cpf%>">
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <label for="rg">RG </label>
            <input type="text" name="rg" id="rg" class="form-control" value="<%=rg%>">
        </div>
        
    </div>
    
    <div class="clearfix"></div>
    
    <div class="form-group" style="padding-top: 10px;">
        
        <div class="col-sm-6" style="padding-left: 0px;">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" class="form-control" value="<%=nome%>">
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <label for="sobrenome">Sobrenome</label>
            <input type="text" name="sobrenome" id="sobrenome" class="form-control" value="<%=sobrenome%>">
        </div>
        
    </div>
    
    <div class="clearfix"></div>
    
    <div class="form-group" style="padding-top: 10px;">
        
        <div class="col-sm-3" style="padding-left: 0px;">
            <label>Sexo </label>
            <div class="clearfix"></div>
            
            <%
                if(sexo.equals("M")){                    
            %>
                <div class="radio-inline">
                    <label><input type="radio" name="sexo" id="sexo" value="F">Feminino</label>
                </div>
                <div class="radio-inline">
                    <label><input type="radio" name="sexo" id="sexo" value="M" checked>Masculino</label>
                </div>
            <%
                }else{
            %>
                <div class="radio-inline">
                    <label><input type="radio" name="sexo" id="sexo" value="F" checked>Feminino</label>
                </div>
                <div class="radio-inline">
                    <label><input type="radio" name="sexo" id="sexo" value="M">Masculino</label>
                </div>
            <%
                }                
            %>

        </div>  
        <div class="col-sm-3">
            <label for="datanascimento">Data de Nascimento</label>
            <input type="text" name="datanascimento" id="data" class="form-control" value="<%=datanascimento%>">
        </div>
        <div class="col-sm-6" style="padding-right: 0px;"> 
            <label for="email">E-mail</label>
            <input type="text" name="email" id="email" class="form-control" value="<%=email%>">
        </div>
    </div>
    
    <div class="clearfix"></div>
   
    <div class="form-group"  style="padding-top: 10px;">
        
        <div class="col-sm-2" style="padding-left: 0px;">
            <label for="cep">CEP</label>
            <input type="text" name="cep" id="cep" class="form-control" value="<%=cep%>">
        </div>
        <div class="col-sm-1" style="padding-top: 25px; padding-left: 0; padding-right: 0; width: 11%; ">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span> Pesquisa
            </button>
        </div>
    
</form>       
     
<form method="post" action="cadastrarUser.do">

    <input type="hidden" name="cpfOculto" id="cpfOculto" value="<%=cpf%>"/>
    <input type="hidden" name="rgOculto" id="rgOculto" value="<%=rg%>">
    <input type="hidden" name="nomeOculto" id="nomeOculto" value="<%=nome%>">
    <input type="hidden" name="sobrenomeOculto" id="sobrenomeOculto" value="<%=sobrenome%>">
    <input type="hidden" name="sexoOculto" id="sexoOculto" value="<%=sexo%>">
    <input type="hidden" name="datanascimentoOculto" id="dataOculto" value="<%=datanascimento%>">
    <input type="hidden" name="emailOculto" id="emailOculto" value="<%=email%>">
    <input type="hidden" name="cepOculto" id="cepOculto" value="<%=cep%>">
    
        <div class="col-sm-5">
            <label for="endereco">Endere�o</label>
            <input type="text" name="endereco" id="endereco" class="form-control">
        </div>
        <div class="col-sm-2">
            <label for="numero">N�mero</label>
            <input type="text" name="numero" id="numero" class="form-control" 
                   onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;">
        </div>
        <div class="col-sm-2" style="padding-right: 0; padding-left: 0; width: 14%;">
            <label for="complemento">Complemento</label>
            <input type="text" name="complemento" id="complemento" class="form-control">
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form-group" style="padding-top: 10px;">
        
        <div class="col-sm-5" style="padding-left: 0px;">
            <label for="bairro">Bairro</label>
            <input type="text" name="bairro" id="bairro" class="form-control">
        </div>
        <div class="col-sm-5">
            <label for="cidade">Cidade</label>
            <input type="text" name="cidade" id="cidade" class="form-control">
        </div>            
        <div class="col-sm-2" style="padding-right: 0px;">
            <label for="estado">UF</label>
            <input type="text" name="estado" id="estado" class="form-control" maxlength="2" 
                   onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return false; else return true;">
        </div>
        
    </div>
    
    <div class="clearfix"></div>
    
    <div class="form-group" style="padding-top: 10px;">
        
        <div class="col-sm-3" style="padding-left: 0;">
            <label for="telefone">Telefone</label>
            <input type="text" name="telefone" id="telefone" class="form-control" />
        </div>
        <div class="col-sm-2">
            <label for="ramal">ramal</label>
            <input type="text" name="ramal" id="ramal" class="form-control" maxlength="4" 
                   onkeypress="if (!isNaN(String.fromCharCode(window.event.keyCode))) return true; else return false;"/>
        </div>
        
        <div class="col-sm-4" style="padding-right: 0px;">
            <label for="funcao">Fun��o</label>
            <select id="funcao" name="funcao" class="form-control">
                <jsp:useBean id="listaF" class="br.immunit.dao.FuncaoDAO" />
                <c:forEach var="f" items="<%=listaF.preencheLista()%>">
                    <option>${f.funcao}</option>
                </c:forEach>
            </select>
        </div>
        
        <div class="col-sm-3" style="padding-right: 0px;">
            <label for="ubs">UBS</label>
            <select id="ubs" name="ubs" class="form-control">
                <jsp:useBean id="listaU" class="br.immunit.dao.UbsDAO" />
                <c:forEach var="u" items="<%=listaU.listaUBS()%>">
                    <option>${u.nomeFantasia}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="clearfix"></div>
    
    <input type="text" name="enderecoExiste" id="enderecoExiste" value="0" hidden="">
    
    <div class="form-group" style="padding-top: 10px">
        <div class="pull-right">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> Salvar
            </button>
        </div>
    </div>
    
</form>

<%@include  file="includes/_footer.jsp" %>