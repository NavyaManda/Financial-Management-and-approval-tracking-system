/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.fm.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
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
public class AddEmployee extends HttpServlet {
   
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

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String dob = request.getParameter("dob");
        String doj = request.getParameter("doj");
        String department = request.getParameter("department_id");
        String role = request.getParameter("role_id");
        String gender = request.getParameter("gender");

        Integer roleId = null;
        Integer departmentId = null;
        Date dobDate = null;
        Date dojDate = null;

        String errorString = "";

        try {
            try{
                roleId = Integer.parseInt(role);
            }catch(Exception e){
                errorString += "<h2>Invalid role id</h2>";
            }
            try{
                departmentId = Integer.parseInt(department);
                if(departmentId == 0){
                    departmentId = null;
                }
            }catch(Exception e){
                departmentId = null;
            }
            try{
                dobDate = Date.valueOf(dob);
            }catch(Exception e){
                errorString += "<h2>Invalid Date of Birth</h2>";
            }
            try{
                dojDate = Date.valueOf(doj);
            }catch(Exception e){
                errorString += "<h2>Invalid Date of Joining</h2>";
            }

            if(errorString.length()>0){
                response.sendRedirect("commonMessage.jsp?message=" + errorString);
                return;
            }
            
            ds = (DataSource)getServletContext().getAttribute("database");
            con = ds.getConnection();
            pst = con.prepareStatement("INSERT INTO employee "
                    + "VALUES(0,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setInt(2, roleId);
            pst.setString(3, email);
            pst.setString(4, email);
            pst.setString(5, address);
            pst.setString(6, contact);
            pst.setString(7, email);
            pst.setString(8, "unknown");
            pst.setDate(9, dobDate);
            pst.setDate(10, dojDate);
            pst.setString(11, gender);
            if(departmentId == null){
                pst.setNull(12, Types.INTEGER);
            }else{
                pst.setInt(12, departmentId);
            }

            int i = pst.executeUpdate();
            if(i > 0){
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h3>New Employee is Added Successfully</h3>");
            }else{
                response.sendRedirect("commonMessage.jsp?message="
                        + "<h2>Problem Adding New Employee</h2>");
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
