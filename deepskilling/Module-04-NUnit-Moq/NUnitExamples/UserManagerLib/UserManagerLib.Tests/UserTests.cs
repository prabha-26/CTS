using NUnit.Framework;
using UserManagerLib;
using System;

namespace UserManagerLib.Tests
{
    [TestFixture]
    public class UserTests
    {
        private User user;

        [SetUp]
        public void Setup()
        {
            user = new User();
        }

        [Test]
        public void CreateUser_ValidPAN_DoesNotThrowException()
        {
            var newUser = new User
            {
                PANCardNo = "ABCDE1234F"
            };

            Assert.That(() => user.CreateUser(newUser), Throws.Nothing);
        }

        [Test]
        public void CreateUser_NullPAN_ThrowsNullReferenceException()
        {
            var newUser = new User
            {
                PANCardNo = null
            };

            Assert.That(() => user.CreateUser(newUser),
                Throws.TypeOf<NullReferenceException>());
        }

        [Test]
        public void CreateUser_EmptyPAN_ThrowsNullReferenceException()
        {
            var newUser = new User
            {
                PANCardNo = ""
            };

            Assert.That(() => user.CreateUser(newUser),
                Throws.TypeOf<NullReferenceException>());
        }

        [TestCase("ABC")]
        [TestCase("ABCDE123456")]
        [TestCase("12345")]
        public void CreateUser_InvalidPANLength_ThrowsFormatException(string pan)
        {
            var newUser = new User
            {
                PANCardNo = pan
            };

            Assert.That(() => user.CreateUser(newUser),
                Throws.TypeOf<FormatException>());
        }
    }
}