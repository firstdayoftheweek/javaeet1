package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;

import java.io.IOException;

@WebServlet(value = "/updateTask")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long delTaskId = Long.valueOf(req.getParameter("id"));
        String taskName = req.getParameter("taskName");
        String description = req.getParameter("description");
        String deadline = req.getParameter("deadline");
        String done = req.getParameter("done");
        Task currentTask = DBManager.getTask(delTaskId);
        currentTask.setName(taskName);
        currentTask.setDescription(description);
        currentTask.setDeadline(deadline);
        currentTask.setDone(done);
        resp.sendRedirect("/");
    }
}
