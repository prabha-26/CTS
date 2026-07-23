namespace PlayersManagerLib
{
    public class PlayersManager
    {
        private readonly IPlayerMapper mapper;

        public PlayersManager(IPlayerMapper mapper)
        {
            this.mapper = mapper;
        }

        public Player GetPlayer(int id)
        {
            return mapper.GetPlayerById(id);
        }
    }
}