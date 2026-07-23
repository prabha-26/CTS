public class Main {

    public static void main(String[] args) {

        Inventory inventory = new Inventory();

        inventory.addProduct(new Product(101, "Laptop", 10, 65000));
        inventory.addProduct(new Product(102, "Mouse", 50, 700));
        inventory.addProduct(new Product(103, "Keyboard", 30, 1200));

        inventory.displayProducts();

        inventory.updateProduct(102, "Wireless Mouse", 45, 900);

        inventory.displayProducts();

        inventory.deleteProduct(103);

        inventory.displayProducts();

    }

}