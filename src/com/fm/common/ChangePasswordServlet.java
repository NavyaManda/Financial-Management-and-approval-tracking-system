/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fm.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class ChangePasswordServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);

        String old = request.getParameter("old");
        String newPass = request.getParameter("new");
        String retype = request.getParameter("retype");

        Connection con = null;
        PreparedStatement pst = null;

        Integer employeeId = (Integer) session.getAttribute("employee_id");

        try {
            if (!newPass.equalsIgnoreCase(retype)) {
                response.sendRedirect("commonMessage.jsp?message=<h2>password and retype "
                        + "are not matching</h2>");
                return;
            }

            DataSource ds = (DataSource) getServletContext().getAttribute("database");
            con = ds.getConnection();

            pst = con.prepareStatement("UPDATE EMPLOYEE SET "
                    + "PASSWORD=? WHERE PASSWORD=? AND EMPLOYEEID=?");
            pst.setInt(3, employeeId);

            pst.setString(1, newPass);
            pst.setString(2, old);

            int i = pst.executeUpdate();
            if (i == 0) {
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>password change not successful</h2>");
            } else {
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>password change is successful</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
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
