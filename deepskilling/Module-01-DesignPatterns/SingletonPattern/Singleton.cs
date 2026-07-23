using System;

namespace SingletonPattern
{
    public sealed class Singleton
    {
        // Holds the single instance of the class
        private static Singleton instance = null;

        // Private constructor prevents object creation from outside
        private Singleton()
        {
            Console.WriteLine("Singleton object created.");
        }

        // Public method to get the single instance
        public static Singleton GetInstance()
        {
            if (instance == null)
            {
                instance = new Singleton();
            }

            return instance;
        }

        // Sample method
        public void DisplayMessage()
        {
            Console.WriteLine("Hello from Singleton Pattern!");
        }
    }
}