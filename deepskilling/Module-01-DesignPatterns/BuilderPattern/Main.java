public class Main {

    public static void main(String[] args) {

        System.out.println("Desktop Configuration");

        Director director = new Director(new DesktopBuilder());

        Computer desktop = director.buildComputer();

        desktop.showDetails();

        System.out.println();

        System.out.println("Gaming Configuration");

        Director director2 = new Director(new GamingBuilder());

        Computer gaming = director2.buildComputer();

        gaming.showDetails();
    }
}