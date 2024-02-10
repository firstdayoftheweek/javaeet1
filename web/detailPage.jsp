<%@ page import="model.Task" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <%
        Task task = (Task) request.getAttribute("eachTask");
    %>
    <div class="container">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title fs-5" id="exampleModalLabel">Are you sure you want to eliminate this problem?</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="m-auto g-3" action="${pageContext.request.contextPath}/deleteTask" method="post">
                            <input name="id" type="number" class="d-none" value="<%=task.getId()%>">
                            <div class="d-flex justify-content-end gap-2">
                                <button class="btn btn-primary" type="submit">Yes</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <form action="/updateTask" method="post">
            <input name="id" type="number" class="d-none" value="<%=task.getId()%>">
            <div class="row m-auto mb-4 w-75 gap-2">
                <label for="taskName">Task name:</label>
                <input type="text" name="taskName" class="mx-2 form-control" id="taskName" value="<%=task.getName()%>"
                       required>
            </div>
            <div class="row m-auto mb-4 w-75 gap-2">
                <label for="description">Description:</label>
                <input type="text" name="description" class="mx-2 form-control" id="description"
                       value="<%=task.getDescription()%>" required>
            </div>
            <div class="row m-auto mb-4 w-75 gap-2">
                <label for="deadline" class="form-label">Deadline:</label>
                <input type="date" name="deadline" class="mx-2 form-select" id="deadline"
                       value="<%=task.getDeadline()%>" required>
            </div>
            <div class="row m-auto mb-4 w-75 gap-2">
                <label for="done" class="form-label">Done:</label>
                <select name="done" id="done" class="mx-2 form-select" value="<%=task.getDone()%>" required>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
            <div class="m-auto mb-4 w-75 gap-2">
                <button class="btn btn-success ms-2" type="submit">Save</button>
                <button type="button" class="btn btn-danger me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>