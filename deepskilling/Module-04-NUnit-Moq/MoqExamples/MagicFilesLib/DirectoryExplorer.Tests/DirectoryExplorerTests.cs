using MagicFilesLib;
using Moq;
using NUnit.Framework;

namespace DirectoryExplorer.Tests
{
    [TestFixture]
    public class DirectoryExplorerTests
    {
        private Mock<IDirectoryExplorer> mockDirectory;
        private MagicFileExplorer explorer;

        [OneTimeSetUp]
        public void Setup()
        {
            mockDirectory = new Mock<IDirectoryExplorer>();

            mockDirectory.Setup(x => x.GetFiles(It.IsAny<string>()))
                .Returns(new List<string>
                {
                    "File1.txt",
                    "File2.txt",
                    "File3.txt",
                    "File4.txt"
                });

            explorer = new MagicFileExplorer(mockDirectory.Object);
        }

        [Test]
        public void GetTotalFiles_ShouldReturnFileCount()
        {
            int count = explorer.GetTotalFiles("C:\\Dummy");

            Assert.That(count, Is.EqualTo(4));
        }
    }
}