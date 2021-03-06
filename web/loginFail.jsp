<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title><bean:message key="welcome.title"/></title>
    <html:base/>
</head>

<body style="padding-top: 60px;">
    
    <div class="container">
        <div class="jumbotron">
            
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:10px; text-align: center;">
                    <img src="images/logo.png" />
                </div>
            </div> 
            
            <form class="form-signin" role="form" METHOD=POST ACTION="login.do">
                <h2 class="form-signin-heading">Login:</h2>
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-6" style="margin-top:10px">
                        <input name="login" type="Text" class="form-control " placeholder="Usu�rio" required="" autofocus="">
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-6" style="margin-top:10px">
                        <input name="senha" type="password" class="form-control" placeholder="Senha" required="">
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:10px">
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Acessar">
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:20px; color: #428bca">
                        <b>
                           * Usu�rio e/ou senha incorretos.
                           <br>
                           * Caso tenha esquecido sua senha 
                           <a href="enviarSenhar.jsp"><i><u>clique aqui</u></i></a>.
                        </b>
                    </div>    
                </div>
            </form>
            
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>

</html:html>