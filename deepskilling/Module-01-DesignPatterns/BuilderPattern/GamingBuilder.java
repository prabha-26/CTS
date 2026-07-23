public class GamingBuilder extends ComputerBuilder {

    @Override
    public void buildCPU() {
        computer.setCPU("Intel i9");
    }

    @Override
    public void buildRAM() {
        computer.setRAM("32 GB");
    }

    @Override
    public void buildStorage() {
        computer.setStorage("2 TB SSD");
    }
}