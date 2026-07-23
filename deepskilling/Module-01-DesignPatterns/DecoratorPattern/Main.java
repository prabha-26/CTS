public class Main {

    public static void main(String[] args) {

        Notifier notifier = new BasicNotifier();

        notifier = new EmailNotifier(notifier);

        notifier = new SMSNotifier(notifier);

        notifier.send();

    }

}