using NUnit.Framework;
using NUnit.Framework.Legacy;
using AccountsManagerLib;
using System;
namespace AccountsManagerLib.Tests
{
    [TestFixture]
    public class AccountsManagerTests
    {
        private AccountsManager accountsManager;

        [SetUp]
        public void Setup()
        {
            accountsManager = new AccountsManager();
        }

        [TestCase("user_11", "secret@user11", "Welcome user_11!!!")]
        [TestCase("user_22", "secret@user22", "Welcome user_22!!!")]
        public void ValidateUser_ValidCredentials_ReturnsWelcomeMessage(string userId, string password, string expected)
        {
            string actual = accountsManager.ValidateUser(userId, password);

            ClassicAssert.AreEqual(expected, actual);
        }

        [TestCase("user_11", "wrongpassword")]
        [TestCase("wronguser", "secret@user11")]
        [TestCase("abc", "xyz")]
        [TestCase("user_11", "wrongpassword")]
        [TestCase("wronguser", "secret@user11")]
        [TestCase("abc", "xyz")]
        public void ValidateUser_InvalidCredentials_ReturnsInvalidMessage(string userId, string password)
        {
            string actual = accountsManager.ValidateUser(userId, password);

            ClassicAssert.AreEqual("Invalid user id/password", actual);
        }

        [Test]
        public void ValidateUser_EmptyUserId_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() =>
                accountsManager.ValidateUser("", "secret@user11"));
        }

        [Test]
        public void ValidateUser_EmptyPassword_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() =>
                accountsManager.ValidateUser("user_11", ""));
        }

        [Test]
        public void ValidateUser_BothEmpty_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() =>
                accountsManager.ValidateUser("", ""));
        }

        [Test]
        public void ValidateUser_NullUserId_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() =>
                accountsManager.ValidateUser(null, "secret@user11"));
        }

        [Test]
        public void ValidateUser_NullPassword_ThrowsFormatException()
        {
            Assert.Throws<FormatException>(() =>
                accountsManager.ValidateUser("user_11", null));
        }
    }
}