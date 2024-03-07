package controller;

import dal.BodyDAO;
import dal.NewsDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.News;
import model.User;
import model.Wallet;

public class newscontroll extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User LoggedUser = (User) session.getAttribute("user");
        int uid = LoggedUser.getId();

        // Số trang hiện tại
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Số tin tức trên mỗi trang
        int recordsPerPage = 7;

        NewsDAO dao = new NewsDAO();

        // Lấy danh sách tin tức cho trang hiện tại
        List<News> paginatedNewsList = dao.getPaginatedNewsListByUserID(uid, page, recordsPerPage);

        // Tổng số trang
        int totalPages = dao.getTotalPagesByUserID(uid, recordsPerPage);
        
        BodyDAO d = new BodyDAO();
        Wallet w = d.getWalletById(LoggedUser.getId());
        request.setAttribute("balance", w.getBalance());
        
        request.setAttribute("newsList", paginatedNewsList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("news.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
