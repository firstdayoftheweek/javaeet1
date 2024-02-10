<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
    </head>
    <title>Title</title>
</head>

<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
        + Add a new task
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">New task</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="m-auto g-3" action="/addTask" method="post">
                        <div class="mb-3">
                            <label for="validationDefault01" class="form-label">Task name:</label>
                            <input type="text" name="taskname" class="form-control" id="validationDefault01"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label for="validationDefault03" class="form-label">Description:</label>
                            <input type="text" name="description" class="form-control" id="validationDefault03"
                                   required>

                        </div>
                        <div class="mb-3">
                            <label for="validationCustom04" class="form-label">Deadline:</label>
                            <input type="date" name="deadline" class="form-select" id="validationCustom04"
                                   required>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button class="btn btn-primary" type="submit">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <hr>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Task name</th>
            <th scope="col">Deadline</th>
            <th scope="col">Done</th>
            <th scope="col">Details</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Task> tasks = DBManager.getAllTask();
            for (Task task : tasks) {
        %>
        <tr>
            <td><%=task.getId()%>
            </td>
            <td><%=task.getName()%>
            </td>
            <td><%=task.getDeadline()%>
            </td>
            <td><%=task.getDone()%>
            </td>
            <td>
                <a href="/detail?id=<%=task.getId()%>" class="btn btn-dark">More</a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
