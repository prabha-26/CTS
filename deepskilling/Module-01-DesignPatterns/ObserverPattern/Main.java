public class Main {

    public static void main(String[] args) {

        Stock stock = new Stock();

        Investor investor1 = new Investor("Rishi");
        Investor investor2 = new Investor("Rahul");

        stock.registerObserver(investor1);
        stock.registerObserver(investor2);

        stock.setPrice(1500);

    }

}