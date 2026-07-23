using Moq;
using NUnit.Framework;
using PlayersManagerLib;

namespace PlayerManager.Tests
{
    [TestFixture]
    public class PlayerManagerTests
    {
        private Mock<IPlayerMapper> mockMapper;
        private PlayersManager manager;

        [OneTimeSetUp]
        public void Setup()
        {
            mockMapper = new Mock<IPlayerMapper>();

            mockMapper.Setup(x => x.GetPlayerById(1))
                .Returns(new Player
                {
                    Id = 1,
                    Name = "Virat Kohli",
                    Age = 36
                });

            manager = new PlayersManager(mockMapper.Object);
        }

        [Test]
        public void GetPlayer_ReturnsPlayer()
        {
            Player player = manager.GetPlayer(1);

            Assert.That(player, Is.Not.Null);
            Assert.That(player.Name, Is.EqualTo("Virat Kohli"));
            Assert.That(player.Id, Is.EqualTo(1));
        }
    }
}