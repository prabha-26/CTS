public class Main {

    public static void main(String[] args) {

        Order[] orders = {
                new Order(101, "Rishi", 2500),
                new Order(102, "Rahul", 1200),
                new Order(103, "Swapna", 5000),
                new Order(104, "Anil", 3000)
        };

        System.out.println("Bubble Sort:");

        BubbleSort.sort(orders);

        for (Order order : orders) {
            System.out.println(order);
        }

        Order[] orders2 = {
                new Order(101, "Rishi", 2500),
                new Order(102, "Rahul", 1200),
                new Order(103, "Swapna", 5000),
                new Order(104, "Anil", 3000)
        };

        System.out.println("\nQuick Sort:");

        QuickSort.sort(orders2, 0, orders2.length - 1);

        for (Order order : orders2) {
            System.out.println(order);
        }

    }
}