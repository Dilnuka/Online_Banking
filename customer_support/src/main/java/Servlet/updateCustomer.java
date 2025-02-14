package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.customerService;
import model.customer;


@WebServlet("/updateCustomer")
public class updateCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateCustomer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        customer cus = new customer();
        cus.setFirstname(request.getParameter("firstname"));
        cus.setLastname(request.getParameter("lastname"));
        cus.setNIC(request.getParameter("NIC"));
        cus.setAccounttype(request.getParameter("accounttype"));
        cus.setAccountNo(request.getParameter("accountno"));
        cus.setDateofbirth(request.getParameter("dateofbirth"));
        cus.setAddress(request.getParameter("address"));
        cus.setPhoneno(request.getParameter("phoneno"));
        cus.setEmail(request.getParameter("email"));
        cus.setPassword(request.getParameter("password"));

        customerService service = new customerService();
        service.updateCustomer(cus);

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminCustomer");
        dispatcher.forward(request, response);
    }
}

