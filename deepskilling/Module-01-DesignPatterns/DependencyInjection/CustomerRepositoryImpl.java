public class CustomerRepositoryImpl implements CustomerRepository {

    @Override
    public void saveCustomer(String name) {
        System.out.println("Customer \"" + name + "\" saved successfully.");
    }

}