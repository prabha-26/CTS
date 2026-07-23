public class Main {

    public static void main(String[] args) {

        TaskLinkedList taskList = new TaskLinkedList();

        taskList.addTask(new Task(101, "Complete DSA Assignment", "Pending"));
        taskList.addTask(new Task(102, "Prepare for Interview", "In Progress"));
        taskList.addTask(new Task(103, "Submit Project", "Pending"));

        taskList.displayTasks();

        System.out.println("\nSearching Task:");

        taskList.searchTask(102);

        taskList.deleteTask(101);

        taskList.displayTasks();

    }

}