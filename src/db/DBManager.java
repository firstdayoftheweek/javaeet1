package db;

import model.Task;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Task> tasks = new ArrayList<>();

    static {
        tasks.add(new Task("готовка", "готовить готовку", "2024-02-21"));
        tasks.add(new Task("стирка", "стирать стирку", "2024-02-21"));
        tasks.add(new Task("уборка", "убрать уборку", "2024-02-21"));
    }

    public static void addTask(Task task) {
        tasks.add(task);
    }

    public static void removeTask(Long taskId) {
        int taskIndex = 0;
        for (int i = 0; i < tasks.size(); i++) {
            Task eachTask = tasks.get(i);
            if (eachTask.getId() == taskId) {
                taskIndex = i;
            }
        }
        tasks.remove(taskIndex);
    }

    public static Task getTask(Long taskId) {
        int taskIndex = 0;
        for (int i = 0; i < tasks.size(); i++) {
            Task eachTask = tasks.get(i);
            if (eachTask.getId() == taskId) {
                taskIndex = i;
            }
        }
        return tasks.get(taskIndex);
    }

    public static ArrayList<Task> getAllTask() {
        return tasks;
    }
}
