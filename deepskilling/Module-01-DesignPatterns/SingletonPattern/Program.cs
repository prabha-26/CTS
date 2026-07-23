using System;

namespace SingletonPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            // Get the Singleton instance
            Singleton obj1 = Singleton.GetInstance();
            Singleton obj2 = Singleton.GetInstance();

            obj1.DisplayMessage();
            obj2.DisplayMessage();

            Console.WriteLine();

            if (obj1 == obj2)
            {
                Console.WriteLine("Both objects are the same instance.");
            }
            else
            {
                Console.WriteLine("Objects are different.");
            }
        }
    }
}