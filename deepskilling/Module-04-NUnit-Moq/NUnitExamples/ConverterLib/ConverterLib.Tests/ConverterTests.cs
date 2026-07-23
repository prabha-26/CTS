using Moq;
using NUnit.Framework;
using ConverterLib;

namespace ConverterLib.Tests
{
    [TestFixture]
    public class ConverterTests
    {
        private Mock<IDollarToEuroExchangeRateFeed> mockExchangeRate;
        private Converter converter;

        [SetUp]
        public void Setup()
        {
            mockExchangeRate = new Mock<IDollarToEuroExchangeRateFeed>();

            // Mock exchange rate: 1 USD = 0.9 Euro
            mockExchangeRate.Setup(x => x.GetActualUSDollarValue())
                            .Returns(0.9);

            converter = new Converter(mockExchangeRate.Object);
        }

        [Test]
        public void USDToEuro_100USD_Returns90Euro()
        {
            double actual = converter.USDToEuro(100);

            Assert.That(actual, Is.EqualTo(90));
        }

        [Test]
        public void USDToEuro_50USD_Returns45Euro()
        {
            double actual = converter.USDToEuro(50);

            Assert.That(actual, Is.EqualTo(45));
        }

        [Test]
        public void USDToEuro_0USD_Returns0Euro()
        {
            double actual = converter.USDToEuro(0);

            Assert.That(actual, Is.EqualTo(0));
        }
    }
}