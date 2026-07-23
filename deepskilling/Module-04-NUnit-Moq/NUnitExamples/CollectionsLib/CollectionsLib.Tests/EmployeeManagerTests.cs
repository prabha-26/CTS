using NUnit.Framework;
using NUnit.Framework.Legacy;
using CollectionsLib;
using System.Linq;

namespace CollectionsLib.Tests
{
    [TestFixture]
    public class EmployeeManagerTests
    {
        private EmployeeManager employeeManager;

        [SetUp]
        public void Setup()
        {
            employeeManager = new EmployeeManager();
        }

        // Scenario 1
        [Test]
        public void GetEmployees_ShouldNotContainNull()
        {
            var employees = employeeManager.GetEmployees();

            CollectionAssert.AllItemsAreNotNull(employees);
        }

        // Scenario 2
        [Test]
        public void GetEmployees_ShouldContainFourEmployees()
        {
            var employees = employeeManager.GetEmployees();

            ClassicAssert.AreEqual(4, employees.Count);
        }

        // Scenario 3
        [Test]
        public void GetEmployees_ShouldContainUniqueEmployees()
        {
            var employees = employeeManager.GetEmployees();

            CollectionAssert.AllItemsAreUnique(employees);
        }

        // Scenario 4
        [Test]
        public void GetEmployees_ShouldContainJohn()
        {
            var employees = employeeManager.GetEmployees();

            CollectionAssert.Contains(
                employees.Select(e => e.EmpName),
                "John");
        }

        // Scenario 5
        [Test]
        public void GetEmployeesWhoJoinedInPreviousYears_ShouldReturnEmployees()
        {
            var employees = employeeManager.GetEmployeesWhoJoinedInPreviousYears();

            CollectionAssert.AllItemsAreNotNull(employees);
            ClassicAssert.AreEqual(4, employees.Count);
        }
    }
}