using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;



namespace ConsoleApplication1
{
    class Program
    {

        static void Main(string[] args)
        {
            DataTransfer obj = new DataTransfer();
            Console.WriteLine("Downloading ZipFile........Please Wait ....");
            obj.DownloadFile();
             obj.ExtractZipFile();
            obj.TransferXMLtoSQL();
            Console.WriteLine("!...............Script Completed..................!");
        }

    }
}