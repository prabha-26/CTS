using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace MagicFilesLib
{
    public class DirectoryExplorer : IDirectoryExplorer
    {
        public List<string> GetFiles(string path)
        {
            return Directory.GetFiles(path).ToList();
        }
    }
}