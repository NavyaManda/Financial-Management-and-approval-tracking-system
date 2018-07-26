/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.fm.common;

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
public class LoginServlet extends HttpServlet {
   
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

        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        String errorString = "";

        try{
            ds = (DataSource)getServletContext().getAttribute("database");
            con = ds.getConnection();
            pst = con.prepareStatement("SELECT * FROM fmats.employee where EMAIL_ID=? AND PASSWORD=?");
            pst.setString(1, userName);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if(rs.next()){
                HttpSession session = request.getSession(true);
                session.setAttribute("employee_id", rs.getInt(1));
                session.setAttribute("role_id", rs.getInt(3));
                response.sendRedirect("commonMessage.jsp?message=you are "
                        + "successfully logged in");
            }else{
                response.sendRedirect("commonMessage.jsp?message=unable to"
                        + " login please retry");
            }
        }catch(Exception e){
            e.printStackTrace();
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
