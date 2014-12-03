using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using FileInfoExt;

namespace pt_lab1
{
    class Program
    {
    static void Main(string[] args)
        {
            files = new Dictionary<string, long>();
            printContent(args[0]);
            Console.ReadKey();
            Console.WriteLine("\nWszystkie pliki:");
            printDetails();
            Console.ReadKey();
            serialize("file");
            files = null;
            deserialize("file");
            printDetails();
            Console.ReadKey();
        }

        private static Dictionary<string, long> files;

        private static void printContent(String path, int level = 0)
        {
            DirectoryInfo directory = new DirectoryInfo(path);
            
            FileInfo[] localFiles = directory.GetFiles();
            DirectoryInfo[] localDirectories = directory.GetDirectories();

            printSpace(level);
            Console.WriteLine(directory.Name + " (Podkatalogow: " + localDirectories.Length.ToString() + ", pliki lacznie: " + convertSize(directory.totalSize()) + ")");

            foreach (DirectoryInfo d in localDirectories)
                printContent(d.FullName, level + 1);

            foreach (FileInfo f in localFiles)
            {
                printSpace(level+1);
                Console.WriteLine(f.Name + " (a=" + f.countA() + ") " + convertSize(f.Length));
                files.Add(f.Name, f.Length);
            }
        }

        private static void printSpace(int size, char character = ' ')
        {
            for (int i = 0; i < size; i++)
                Console.Write(character);
        }

        private static void printDetails()
        {
            foreach (KeyValuePair<string, long> f in files)
                Console.WriteLine(f.Key + " (" + f.Value + " B)");
        }

        private static void serialize(String fileName)
        {
            using (FileStream fs = new FileStream(fileName + ".dat", FileMode.Create))
                new BinaryFormatter().Serialize(fs, files);
        }

        private static void deserialize(String fileName)
        {
            using (FileStream fs = new FileStream(fileName + ".dat", FileMode.Open))
                files = (Dictionary<string, long>)new BinaryFormatter().Deserialize(fs);
        }

        public static String convertSize(long size) 
        {
            if(size <= 0) return "0 B";
            String[] Units = new String[] { "B", "KB", "MB", "GB", "TB" };

            double unit = Math.Floor((size > 0 ? Math.Log10(size) : 0) / Math.Log10(1024));
            unit = Math.Min(unit, Units.Length-1);
            double value = (double)size / Math.Pow(1024, unit);
            return value.ToString(unit == 0 ? "F0" : "F2") + " " + Units[(int)unit];

        }

    }

}