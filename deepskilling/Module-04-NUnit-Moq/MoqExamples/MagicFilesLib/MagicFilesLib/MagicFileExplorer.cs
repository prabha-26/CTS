namespace MagicFilesLib
{
    public class MagicFileExplorer
    {
        private readonly IDirectoryExplorer directoryExplorer;

        public MagicFileExplorer(IDirectoryExplorer directoryExplorer)
        {
            this.directoryExplorer = directoryExplorer;
        }

        public int GetTotalFiles(string path)
        {
            return directoryExplorer.GetFiles(path).Count;
        }
    }
}