package com.fm.listener;

import javax.naming.InitialContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Web application lifecycle listener.
 * @author 3-Edge
 */
public class CCListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        try {
            DataSource ds = (DataSource) InitialContext.doLookup(
                    "java:/comp/env/jdbc/fmats");
            sce.getServletContext().setAttribute("database", ds);
        } catch (Exception e) {
        } finally {
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().removeAttribute("database");
    }
}
