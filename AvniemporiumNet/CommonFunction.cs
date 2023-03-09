using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System;

namespace CommonFn
{
    public class CommonFunction
    {
        public string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }
    public class CommonMessage
    {
        public const string InsertSuccessMessage = "Record has been added successfully.";
        public const string EditSuccessMessage = "Record has been updated successfully.";
        public const string DeleteSuccessMessage = "Record has been deleted successfully.";
        public const string DataNotFoundMessage = "Data not found.";
        public const string ErrorOccur = "Some error occured, please share referance ID: ";
        public const string Teamname = "Team name already exists.";
        public const string ChangeStatus = "Status has been changed successfully.";
        public const string Pagename = "Page header already exists.";
        public const string ResumeSuccessMessage = "Your resume submitted successfully. We will connect to you soon.";
        public const string RecordMoveSuccessMessage = "Record has been moved successfully.";
        public const string ResourceReleased = "This Resource has been released from this work order successfully.";
        public const string ResourceReleaseddatechange = "Released date for this Resource has been change for this work order successfully.";
        public const string UloadMPRSuccessMessage = "MPR uploaded successfully.";
        public const string MPRApproveSuccessMessage = "MPR has been approved successfully.";
        public const string MPRRejectSuccessMessage = "MPR has been rejected successfully.";
        public const string RecordAllReadyExists = "Record all ready exist.";
        public const string isAchievedTargetExceed = "Achieved Target can't be exceed from total target.";
        public const string TargetItemNotSet = "Target is not set for this financial year.";
        public const string MaliciousFile = "Invalid File ..(Try To Upload Malicious File Upload).";
        public const string ConfirmDelete = "Are you sure you want to delete this record?";
    }
}