public class Director {

    private ComputerBuilder builder;

    public Director(ComputerBuilder builder) {
        this.builder = builder;
    }

    public Computer buildComputer() {

        builder.createComputer();
        builder.buildCPU();
        builder.buildRAM();
        builder.buildStorage();

        return builder.getComputer();
    }
}