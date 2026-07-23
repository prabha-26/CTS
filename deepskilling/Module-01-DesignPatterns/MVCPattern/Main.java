public class Main {

    public static void main(String[] args) {

        Student student = new Student();
        student.setName("Rishi");
        student.setRollNo("23KP1A04B6");

        StudentView view = new StudentView();

        StudentController controller = new StudentController(student, view);

        System.out.println("Initial Student Details:");
        controller.updateView();

        System.out.println();

        controller.setStudentName("Rishik Sai");

        System.out.println("Updated Student Details:");
        controller.updateView();

    }

}