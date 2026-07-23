var orders = new List<Order>
{
    new(1001, "Laptop", 2, 75000),
    new(1002, "Mouse", 5, 650),
    new(1003, "Keyboard", 0, 1200)
};

Console.WriteLine("Order totals");
foreach (var order in orders)
{
    Console.WriteLine($"{order.Id} {order.ItemName}: {order.Total:C}");
}

var average = orders.Count == 0 ? 0 : orders.Average(order => order.Total);
Console.WriteLine($"Average order value: {average:C}");

record Order(int Id, string ItemName, int Quantity, decimal UnitPrice)
{
    public decimal Total
    {
        get
        {
            if (Quantity < 0)
            {
                throw new InvalidOperationException("Quantity cannot be negative.");
            }

            return Quantity * UnitPrice;
        }
    }
}
