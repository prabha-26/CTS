using NUnit.Framework;
using LeapYearCalculatorLib;

namespace LeapYearCalculatorLib.Tests
{
    [TestFixture]
    public class LeapYearCalculatorTests
    {
        private LeapYearCalculator leapYearCalculator;

        [SetUp]
        public void Setup()
        {
            leapYearCalculator = new LeapYearCalculator();
        }

        // Leap Years
        [TestCase(2000, 1)]
        [TestCase(2024, 1)]
        [TestCase(1996, 1)]
        public void IsLeapYear_LeapYear_ReturnsOne(int year, int expected)
        {
            int actual = leapYearCalculator.IsLeapYear(year);

            Assert.That(actual, Is.EqualTo(expected));
        }

        // Non-Leap Years
        [TestCase(2023, 0)]
        [TestCase(1900, 0)]
        [TestCase(1999, 0)]
        public void IsLeapYear_NonLeapYear_ReturnsZero(int year, int expected)
        {
            int actual = leapYearCalculator.IsLeapYear(year);

            Assert.That(actual, Is.EqualTo(expected));
        }

        // Invalid Years
        [TestCase(1700, -1)]
        [TestCase(10000, -1)]
        [TestCase(0, -1)]
        public void IsLeapYear_InvalidYear_ReturnsMinusOne(int year, int expected)
        {
            int actual = leapYearCalculator.IsLeapYear(year);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}