using NUnit.Framework;
using System;
using CalcLibrary;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class SimpleCalculatorTests
    {
        private SimpleCalculator calculator;

        [SetUp]
        public void Setup()
        {
            calculator = new SimpleCalculator();
        }

        // Exercise 1 - Addition
        [TestCase(10, 20, 30)]
        [TestCase(5, 5, 10)]
        [TestCase(-5, 5, 0)]
        [TestCase(100, 200, 300)]
        public void Addition_ShouldReturnCorrectSum(double a, double b, double expected)
        {
            double result = calculator.Addition(a, b);

            Assert.That(result, Is.EqualTo(expected));
        }

        // Exercise 2 - Subtraction
        [TestCase(20, 10, 10)]
        [TestCase(50, 20, 30)]
        [TestCase(10, 30, -20)]
        public void Subtraction_ShouldReturnCorrectDifference(double a, double b, double expected)
        {
            double result = calculator.Subtraction(a, b);

            Assert.That(result, Is.EqualTo(expected));
        }

        // Exercise 3 - Multiplication
        [TestCase(5, 5, 25)]
        [TestCase(10, 2, 20)]
        [TestCase(-5, 5, -25)]
        public void Multiplication_ShouldReturnCorrectProduct(double a, double b, double expected)
        {
            double result = calculator.Multiplication(a, b);

            Assert.That(result, Is.EqualTo(expected));
        }

        // Exercise 4 - Division
        [TestCase(20, 2, 10)]
        [TestCase(100, 10, 10)]
        [TestCase(25, 5, 5)]
        public void Division_ShouldReturnCorrectQuotient(double a, double b, double expected)
        {
            double result = calculator.Division(a, b);

            Assert.That(result, Is.EqualTo(expected));
        }

        // Exercise 5 - Exception Testing
        [Test]
        public void Division_ByZero_ShouldThrowException()
        {
            Assert.Throws<ArgumentException>(() =>
            {
                calculator.Division(10, 0);
            });
        }

        // Exercise 6 - AllClear
        [Test]
        public void AllClear_ShouldResetResult()
        {
            calculator.Addition(20, 30);

            calculator.AllClear();

            Assert.That(calculator.GetResult, Is.EqualTo(0));
        }

        // Exercise 7 - GetResult
        [Test]
        public void GetResult_ShouldReturnLatestResult()
        {
            calculator.Addition(15, 10);

            Assert.That(calculator.GetResult, Is.EqualTo(25));
        }
    }
}