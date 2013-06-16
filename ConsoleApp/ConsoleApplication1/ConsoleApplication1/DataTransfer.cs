using System;using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Ionic.Zip;
using System.Configuration;
using FtpClientVB.Utilities.FTP;
using System.Collections.Generic;
using System.Net;
using System.Xml;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace ConsoleApplication1
{
    class DataTransfer
    {
        string FtpServer = ConfigurationSettings.AppSettings["HostName"];
        string FtpUserName = ConfigurationSettings.AppSettings["Username"];
        string FtpPassword = ConfigurationSettings.AppSettings["Password"];
        string ZipFolder = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["ZipFile"];
        string ExtractPath = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["ExtractFile"];
        string ImagesFolder = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["Images"];
        string BackupZipFile = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["BackupZipFile"];
        public void DownloadFile()
        {


            // FTPclient ftp = new FtpClientVB.Utilities.FTP.FTPclient(FtpServer, FtpUserName, FtpPassword, false);
            string[] files = GetFileList();
            foreach (string file in files)
            {
                DirectoryInfo di = new DirectoryInfo(BackupZipFile);

                if (di.GetFiles("*.zip").Length > 0)
                {
                    foreach (FileInfo fi in di.GetFiles("*.zip"))
                    {
                        if (fi.Name != file)
                        {
                            Download(file);
                        }
                    }
                }
                else
                {
                    Download(file);
                }
            }
        }


        public string[] GetFileList()
        {
            string[] downloadFiles;
            StringBuilder result = new StringBuilder();
            WebResponse response = null;
            StreamReader reader = null;
            try
            {
                FtpWebRequest reqFTP;
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(FtpServer));
                reqFTP.UseBinary = true;
                reqFTP.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
                reqFTP.Method = WebRequestMethods.Ftp.ListDirectory;
                reqFTP.Proxy = null;
                reqFTP.KeepAlive = false;
                reqFTP.UsePassive = false;
                response = reqFTP.GetResponse();
                reader = new StreamReader(response.GetResponseStream());
                string line = reader.ReadLine();
                while (line != null)
                {
                    result.Append(line);
                    result.Append("\n");
                    line = reader.ReadLine();
                }
                // to remove the trailing '\n'
                result.Remove(result.ToString().LastIndexOf('\n'), 1);
                return result.ToString().Split('\n');
            }
            catch (Exception ex)
            {
                if (reader != null)
                {
                    reader.Close();
                }
                if (response != null)
                {
                    response.Close();
                }
                downloadFiles = null;
                return downloadFiles;
            }
        }

        private void Download(string file)
        {
            try
            {
                string uri = FtpServer + file;
                Uri serverUri = new Uri(uri);
                if (serverUri.Scheme != Uri.UriSchemeFtp)
                {
                    return;
                }
                FtpWebRequest reqFTP;
                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri(uri));
                reqFTP.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
                reqFTP.KeepAlive = false;
                reqFTP.Method = WebRequestMethods.Ftp.DownloadFile;
                reqFTP.UseBinary = true;
                reqFTP.Proxy = null;
                reqFTP.UsePassive = false;
                FtpWebResponse response = (FtpWebResponse)reqFTP.GetResponse();
                Stream responseStream = response.GetResponseStream();


                FileStream writeStream = new FileStream(ZipFolder + file, FileMode.Create);
                int Length = 2048;
                Byte[] buffer = new Byte[Length];
                int bytesRead = responseStream.Read(buffer, 0, Length);
                while (bytesRead > 0)
                {
                    writeStream.Write(buffer, 0, bytesRead);
                    bytesRead = responseStream.Read(buffer, 0, Length);
                }
                writeStream.Close();
                response.Close();
            }
            
            catch (Exception ex)
            {
                Console.WriteLine("Error in Downloading ......Error:- " + ex.Message);
            }
        }
        public void ExtractZipFile()
        {
            try
            {
                Console.WriteLine("Extract Files from Zip Folder...........");
                DirectoryInfo di = new DirectoryInfo(ZipFolder);
                if (di.GetFiles("*.zip").Length > 0)
                {
                    string curfile = string.Empty;
                    foreach (FileInfo fi in di.GetFiles("*.zip"))
                    {
                        curfile = fi.FullName;
                        using (ZipFile zip = ZipFile.Read(curfile))
                        {
                            zip.ExtractAll(ExtractPath, ExtractExistingFileAction.DoNotOverwrite);

                        }
                        fi.CopyTo(Path.Combine(BackupZipFile.ToString(), fi.Name), true);
                        fi.Delete();
                    }
                }
                else
                {
                    Console.WriteLine("No ZIP File Found....");
                }
                Console.WriteLine("Moving Images from Extract files folder to Images Folder.....");
                DirectoryInfo imgfiles = new DirectoryInfo(ExtractPath);
                if (imgfiles.GetFiles("*.JPG").Length > 0)
                {
                    foreach (FileInfo img in imgfiles.GetFiles("*.JPG"))
                    {
                        img.CopyTo(Path.Combine(ImagesFolder.ToString(), img.Name), true);
                        img.Delete();
                    }
                }
                else
                {
                    Console.WriteLine("No Images Found....");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in Extract ZipFile ......Error:- " + ex.Message);
            }
        }

        public void TransferXMLtoSQL()
        {

            DirectoryInfo xmlfiles = new DirectoryInfo(ExtractPath);
            if (xmlfiles.GetFiles().Length > 0)
            {
                foreach (FileInfo xml in xmlfiles.GetFiles())
                {

                    string xmlfilepath = xml.FullName;
                    string xmltoinsert = getXmlAsString(xmlfilepath);
                    if (xmltoinsert != "error")
                    {
                        try
                        {
                            xmltoinsert = xmltoinsert.Replace(@"<?xml version=""1.0"" encoding=""UTF-8""?>", "");
                            SqlParameter[] param = new SqlParameter[1];
                            param[0] = new SqlParameter("@xml", xmltoinsert);

                            SqlHelper.ExecuteNonQuery(ConfigurationSettings.AppSettings["conn"], CommandType.StoredProcedure, "InsertXMLData", param);
                            xml.Delete();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Error in Transferring XML Data into SQL.......Error:- " + ex.Message);
                        }
                    }
                   
                }
            }
            else
            {
                Console.WriteLine("No XML File found to transfer data into SQL.....");
            }
        }

        public string getXmlAsString(string xmlPath)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(xmlPath);
                StringWriter sw = new StringWriter();
                XmlTextWriter xw = new XmlTextWriter(sw);
                xmlDoc.WriteTo(xw);
                return sw.ToString();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error in converting XML File to String.......Error:- "+ex.Message);
                return "error";
            }
        }
    }
}