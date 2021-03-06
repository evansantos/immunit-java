package br.immunit.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsEditaControl extends org.apache.struts.action.Action{

    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
      
            HttpSession session = request.getSession();
            String cnes = request.getParameter("cnes");
            session.setAttribute("cnes", cnes);
            
            return mapping.findForward(SUCCESS);
    }
}
