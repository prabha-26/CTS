public class Main {

    public static void main(String[] args) {

        EmployeeManagement management = new EmployeeManagement(10);

        management.addEmployee(new Employee(101, "Rishi", "Developer", 60000));
        management.addEmployee(new Employee(102, "Rahul", "Tester", 45000));
        management.addEmployee(new Employee(103, "Swapna", "Manager", 80000));

        management.displayEmployees();

        System.out.println("\nSearching Employee:");

        Employee emp = management.searchEmployee(102);

        if (emp != null)
            System.out.println(emp);
        else
            System.out.println("Employee Not Found");

        management.deleteEmployee(101);

        management.displayEmployees();

    }
}