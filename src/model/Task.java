package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Task {
    private static Long counter = 0L;
    private Long id = 0L;
    private String name;
    private String description;
    private String done = "No";
    private String deadline;

    public Task() {
        this.id = generateId();
    }

    public Task(String name, String description, String deadline) {
        this.name = name;
        this.description = description;
        this.deadline = deadline;
        this.id = generateId();
    }

    private synchronized Long generateId() {
        return ++counter;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDone() {
        return done;
    }

    public void setDone(String done) {
        this.done = done;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }
}
