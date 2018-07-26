/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fm.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author 3-Edge
 */
public class UpdateClaim extends HttpServlet {

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

        String claim_id = request.getParameter("claim_id");
        String amount = request.getParameter("amount");
        String approval_status = request.getParameter("approval_status");

        Integer claimId = null;
        Double amountValue = null;
        Integer approvalStatusId = null;

        String errorString = "";

        try {
            try {
                claimId = Integer.parseInt(claim_id);
            } catch (Exception e) {
                errorString += "Claim ID is not correct<br/>";
            }
            try {
                amountValue = Double.parseDouble(amount);
            } catch (Exception e) {
                errorString += "Given approved amount is not a valid number<br/>";
            }
            try {
                approvalStatusId = Integer.parseInt(approval_status);
            } catch (Exception e) {
                errorString += "Give approval statis is illegal<br/>";
            }
            if(errorString.length()>0){
                response.sendRedirect("commonMessage.jsp?message=" + errorString);
                return;
            }

            ds = (DataSource) getServletContext().getAttribute("database");
            con = ds.getConnection();
            pst = con.prepareStatement("UPDATE employee_claim SET DATE_OF_APPROVAL"
                    + "=?, APPROVED_AMOUNT=?, APPROVAL_STATUS=? WHERE CLAIM_ID=?");
            pst.setDate(1, new java.sql.Date(System.currentTimeMillis()));
            pst.setDouble(2, amountValue);
            pst.setInt(3, approvalStatusId);
            pst.setInt(4, claimId);

            int i = pst.executeUpdate();
            if(i>0){
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>Claim is updated successfully</h2>");
            }else{
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>Problem updating Claim status</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
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
