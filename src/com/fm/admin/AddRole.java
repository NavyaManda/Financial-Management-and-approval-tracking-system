/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.fm.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author 3-Edge
 */
public class AddRole extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        DataSource ds = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        HttpSession session = request.getSession(false);

        String roleName = request.getParameter("rolename");
        try {
            ds = (DataSource)getServletContext().getAttribute("database");
            con = ds.getConnection();
            pst = con.prepareStatement("INSERT INTO role VALUES(0,?)");
            pst.setString(1, roleName);

            int i = pst.executeUpdate();
            if(i > 0){
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h3>New Role is Added Successfully</h3>");
            }else{
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>Problem Adding New Role</h2>");
            }            
        } catch(Exception e){
            e.printStackTrace(out);
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }
                if(pst != null){
                    pst.close();
                }
                if(con != null){
                    con.close();
                }
            }catch(Exception e){
                rs = null;
                pst = null;
                con = null;
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
