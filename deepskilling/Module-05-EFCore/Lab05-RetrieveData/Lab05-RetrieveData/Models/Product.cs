namespace Lab05_RetrieveData.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        public string Name { get; set; } = string.Empty;

        public decimal Price { get; set; }

        public int Stock { get; set; }

        public string Category { get; set; } = string.Empty;
    }
}