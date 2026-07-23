public class TaskLinkedList {

    private Node head;

    // Add Task
    public void addTask(Task task) {

        Node newNode = new Node(task);

        if (head == null) {
            head = newNode;
            return;
        }

        Node current = head;

        while (current.next != null) {
            current = current.next;
        }

        current.next = newNode;

    }

    // Display Tasks
    public void displayTasks() {

        Node current = head;

        System.out.println("\nTask List:");

        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }

    }

    // Search Task
    public void searchTask(int id) {

        Node current = head;

        while (current != null) {

            if (current.task.taskId == id) {
                System.out.println(current.task);
                return;
            }

            current = current.next;
        }

        System.out.println("Task Not Found.");

    }

    // Delete Task
    public void deleteTask(int id) {

        if (head == null)
            return;

        if (head.task.taskId == id) {
            head = head.next;
            System.out.println("Task Deleted Successfully.");
            return;
        }

        Node current = head;

        while (current.next != null && current.next.task.taskId != id) {
            current = current.next;
        }

        if (current.next != null) {
            current.next = current.next.next;
            System.out.println("Task Deleted Successfully.");
        } else {
            System.out.println("Task Not Found.");
        }

    }

}