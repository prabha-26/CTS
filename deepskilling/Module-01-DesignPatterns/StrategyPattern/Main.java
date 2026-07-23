public class Main {

    public static void main(String[] args) {

        ShoppingCart cart = new ShoppingCart();

        cart.setPaymentStrategy(new CreditCardPayment());
        cart.checkout(2500);

        cart.setPaymentStrategy(new PayPalPayment());
        cart.checkout(1500);

        cart.setPaymentStrategy(new UpiPayment());
        cart.checkout(750);

    }

}