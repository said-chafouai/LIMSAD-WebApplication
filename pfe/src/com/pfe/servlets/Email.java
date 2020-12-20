package com.pfe.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pfe.beans.EmailBeans;

@WebServlet("/Email")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Email() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/email.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{

        // outgoing message information
        String mailTo = "chafouaisaid.97@gmail.com";
        String subject = "Limsad";
        String message = "testing email";

        EmailBeans mailer = new EmailBeans();

        try {
            mailer.sendPlainTextEmail(mailTo,subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
	}
}