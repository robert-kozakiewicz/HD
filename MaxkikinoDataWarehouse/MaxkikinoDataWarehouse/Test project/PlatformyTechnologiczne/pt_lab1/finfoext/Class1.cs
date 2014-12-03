using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace FileInfoExt
{
    public static class FileInfoExtensions
    {
        public static int countA(this FileInfo fileInfo)
        {
            //f.OpenText().ReadToEnd().TakeWhile(c => c == 'a').Count();
            int numberOfA = fileInfo.Name.Count(x => x == 'a');
            return numberOfA;
        }
    }

    public static class DirectoryInfoExtensions
    {
        public static long totalSize(this DirectoryInfo d)
        {
            long size = 0;
            foreach (FileInfo f in d.GetFiles())
                size += f.Length;
            return size;
        }
    }
}
