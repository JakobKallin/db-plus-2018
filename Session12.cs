using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HackThis
{
    class Prescription
    {
        public string PersonalIdentityNumber { get; set; }
        public string Medicine { get; set; }
        public DateTime DatePrescribed { get; set; }
    }

    class Appointment
    {
        public string PersonalIdentityNumber { get; set; }
        public string Doctor { get; set; }
        public DateTime Date { get; set; }
    }

    class Program
    {
        private static SqlConnection connection;

        static void Main(string[] args)
        {
            connection = new SqlConnection(
        @"Data Source=MYCOMPUTER\SQLEXPRESS;Initial Catalog=HackThis;Integrated Security=True");
            connection.Open();

            Console.WriteLine("Welcome to eHealth!");
            Console.WriteLine();
            Console.WriteLine("-------------------");
            Console.WriteLine();
            Console.Write("Please enter your personal identity number: ");
            string id = Console.ReadLine();
            Console.Write("Please enter your password: ");
            string password = Console.ReadLine();

            bool loggedIn = Login(id, password);
            if (!loggedIn)
            {
                Console.WriteLine("Error: invalid credentials");
            }
            else
            {
                Console.WriteLine();
                Console.WriteLine("-------------------");
                Console.WriteLine();
                Console.WriteLine("What do you want to view?");
                Console.WriteLine();
                Console.WriteLine("1: Appointments");
                Console.WriteLine("2: Prescriptions");
                Console.WriteLine();
                Console.Write("Please enter option number: ");

                string option = Console.ReadLine();
                Console.WriteLine();
                if (option == "1")
                {
                    ShowAppointments(id);
                }
                else if (option == "2")
                {
                    ShowPrescriptions(id);
                }
                else
                {
                    Console.WriteLine("Error: invalid option");
                }
            }

            Console.WriteLine();
            Console.WriteLine("-------------------");
            Console.WriteLine();
            Console.WriteLine("Thank you for using eHealth!");
            Console.WriteLine();
            Console.WriteLine("Press any key to exit...");
            Console.ReadLine();
        }

        private static void ShowAppointments(string patient)
        {
            Console.Write("Which doctor? ");
            string doctor = Console.ReadLine();

            List<Appointment> appointments = LoadAppointments(patient, doctor);

            if (appointments.Count == 0)
            {
                Console.WriteLine("You have no appointments with Dr. " + doctor);
            }
            else

            {
                Console.WriteLine("Your scheduled appointments:");
                Console.WriteLine();
                foreach (Appointment appointment in appointments)
                {
                    Console.WriteLine("- Appointment with Dr. " + appointment.Doctor + " on " + appointment.Date.ToLongDateString());
                }
            }
        }

        private static List<Appointment> LoadAppointments(string id, string doctor)
        {
            string sql = @"
            SELECT PatientID, Date, Doctor
            FROM Appointment
            WHERE PatientID = '" + id + "' AND Doctor = '" + doctor + "'";

            SqlCommand command = new SqlCommand(sql, connection);
            List<Appointment> appointments = new List<Appointment>();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                appointments.Add(new Appointment
                {
                    Date = reader.GetDateTime(1),
                    Doctor = reader.GetString(2),
                    PersonalIdentityNumber = reader.GetString(0)
                });
            }

            return appointments;
        }

        private static void ShowPrescriptions(string id)
        {
            Console.Write("How many months back? ");
            string months = Console.ReadLine();

            List<Prescription> prescriptions = LoadPrescriptions(id, months);

            if (prescriptions.Count == 0)
            {
                Console.WriteLine("You have no prescriptions from the past " + months + " months");
            }
            else
            {
                Console.WriteLine("Your prescriptions from the past " + months + " months:");
                Console.WriteLine();
                foreach (Prescription prescription in prescriptions)
                {
                    Console.WriteLine("- " + prescription.Medicine + " prescribed to " + prescription.PersonalIdentityNumber + " on " + prescription.DatePrescribed.ToLongDateString());
                }
            }
        }

        private static List<Prescription> LoadPrescriptions(string id, string months)
        {
            string sql = @"
            SELECT PatientID, DatePrescribed, Medicine
            FROM Prescription
            WHERE PatientID = '" + id + "' AND DATEDIFF(month, DatePrescribed, GETDATE()) <= " + months;

            SqlCommand command = new SqlCommand(sql, connection);
            List<Prescription> prescriptions = new List<Prescription>();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                prescriptions.Add(new Prescription
                {
                    DatePrescribed = reader.GetDateTime(1),
                    Medicine = reader.GetString(2),
                    PersonalIdentityNumber = reader.GetString(0)
                });
            }

            return prescriptions;
        }

        // Returns ID of user with provided credentials, or throws an exception if credentials are invalid.
        private static bool Login(string id, string providedPassword)
        {
            string sql = "SELECT Password FROM Patient WHERE ID = '" + id + "'";
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                string password = reader.GetString(0);
                reader.Close();
                return password == providedPassword;
            }
            else
            {
                reader.Close();
                return false;
            }
        }
    }
}