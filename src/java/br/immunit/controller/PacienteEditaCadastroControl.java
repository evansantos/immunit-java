package br.immunit.controller;

import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PacienteEditaCadastroControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
      
            long cpf = Long.parseLong(request.getParameter("cpf"));
            String email = request.getParameter("emailOculto");
            String responsavel = request.getParameter("responsavelOculto");
            String cep = request.getParameter("cep");
            String endereco = request.getParameter("endereco");
            int numero = Integer.parseInt(request.getParameter("numero"));
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String telefone = request.getParameter("telefone");
            String enderecoExiste = request.getParameter("enderecoExiste");
            
            boolean e_Cadastrado;
            if(enderecoExiste.equals("1")){
                e_Cadastrado = true;
            }else{
                e_Cadastrado = false;
            }
            
            PacienteDAO p = new PacienteDAO();
            p.atualizaPaciente(cpf, email, responsavel, cep, endereco, numero, complemento, bairro, 
                           cidade, estado, telefone,e_Cadastrado);
            return mapping.findForward(SUCCESS);
    }
}
