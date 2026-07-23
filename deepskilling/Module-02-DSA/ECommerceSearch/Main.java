import java.util.Arrays;
import java.util.Comparator;

public class Main {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Keyboard", "Electronics"),
                new Product(102, "Laptop", "Electronics"),
                new Product(103, "Mouse", "Electronics"),
                new Product(104, "Phone", "Mobiles")

        };

        System.out.println("Linear Search:");

        Product result1 = Search.linearSearch(products, "Mouse");

        if (result1 != null)
            System.out.println(result1);
        else
            System.out.println("Product Not Found");

        Arrays.sort(products, Comparator.comparing(p -> p.productName));

        System.out.println();

        System.out.println("Binary Search:");

        Product result2 = Search.binarySearch(products, "Mouse");

        if (result2 != null)
            System.out.println(result2);
        else
            System.out.println("Product Not Found");
    }

}