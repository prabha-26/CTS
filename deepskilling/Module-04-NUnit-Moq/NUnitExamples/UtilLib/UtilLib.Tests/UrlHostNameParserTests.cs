using NUnit.Framework;
using System;
using UtilLib;

namespace UtilLib.Tests
{
    [TestFixture]
    public class UrlHostNameParserTests
    {
        private UrlHostNameParser parser;

        [SetUp]
        public void Setup()
        {
            parser = new UrlHostNameParser();
        }

        [TestCase("http://www.google.com", "www.google.com")]
        [TestCase("https://www.github.com", "www.github.com")]
        [TestCase("http://localhost:8080", "localhost")]
        public void ParseHostName_ValidUrls_ShouldReturnHostName(string url, string expected)
        {
            string result = parser.ParseHostName(url);

            Assert.That(result, Is.EqualTo(expected));
        }

        [Test]
        public void ParseHostName_InvalidProtocol_ShouldThrowFormatException()
        {
            Assert.Throws<FormatException>(() =>
            {
                parser.ParseHostName("ftp://www.google.com");
            });
        }
    }
}