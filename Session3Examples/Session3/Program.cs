using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session3
{
    class Song
    {
        public int ID;
        public string Title;
        public int Length;
        public string Lyrics;
        public bool Single;

        // Skapa ett Song-objekt utifrån en rad i databasen. Hädanefter har vi bestämda typer på allting och behöver inte längre bry oss om att datan ursprungligen kom från en databas.
        public Song(SqlDataReader reader)
        {
            ID = Convert.ToInt32(reader["ID"]);
            Title = Convert.ToString(reader["Title"]);
            Length = Convert.ToInt32(reader["Length"]);
            Lyrics = Convert.ToString(reader["Lyrics"]);
            Single = Convert.ToBoolean(reader["Single"]);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Se Session3.md utanför denna solution för en beskrivning av dagens uppgift.

            // För att ansluta Visual Studio till er databas, öppna View > Server Explorer och klicka på knappen "Connect to Database" i rutan som dyker upp. Skriv "(local)\SQLEXPRESS" under "Server Name", välj den aktuella databasen under "Select or enter a database name" och klicka på "OK".

            // Strängen nedanför ska ersättas med databasens "connection string". Denna hittar ni genom att högerklicka på databasen i Server Explorer, välja Properties och sedan leta upp "Connection String" i rutan som visas. Se till att ni först har anslutit Visual Studio till er databas med hjälp av föregående kommentar.
            SqlConnection connection = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=Session1Solution;Integrated Security=True");
            connection.Open();

            Console.WriteLine("Vad vill du göra?");
            Console.WriteLine("1. Visa låtar sorterade på titel");
            Console.WriteLine("2. Visa låtar med min- och maxlängd");
            Console.WriteLine("3. Visa låtar sorterade på längd");
            int option = int.Parse(Console.ReadLine());

            if (option == 1)
            {
                RunQuery("SELECT * FROM Song ORDER BY Title", connection);
            }
            else if (option == 2)
            {
                Console.Write("Min number of minutes: ");
                int min = int.Parse(Console.ReadLine());

                Console.Write("Max number of minutes: ");
                int max = int.Parse(Console.ReadLine());

                string sql = "SELECT * FROM Song WHERE Length >= (60 * @MinMinutes) AND Length <= (60 * @MaxMinutes)";

                SqlParameter minParam = new SqlParameter
                {
                    ParameterName = "@MinMinutes",
                    Value = min
                };
                SqlParameter maxParam = new SqlParameter
                {
                    ParameterName = "@MaxMinutes",
                    Value = max
                };

                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(minParam);
                command.Parameters.Add(maxParam);
                SqlDataReader reader = command.ExecuteReader();

                List<Song> songs = new List<Song>();
                while (reader.Read())
                {
                    Song s = new Song(reader);
                    songs.Add(s);
                }
            }
            else if (option == 3)
            {
                List<List<object>> songs = GetResults("SELECT * FROM Song ORDER BY Length DESC", connection);
                foreach (List<object> s in songs)
                {
                    foreach (object x in s)
                    {
                        Console.Write(x + ", ");
                    }
                    Console.WriteLine();
                }
            }

            // I ett större program bör vi här stänga uppkopplingen samt de andra objekten när vi är klara med dem för att se till att de inte tar upp resurser i onödan. Detta kan göras med "using"-satsen, som i detta kodexempel: https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqlconnection
        }

        // Kör ett godtyckligt SQL-kommando, med antagandet att resultatet har kolumnerna ID, Title och Length.
        static void RunQuery(string sql, SqlConnection c)
        {
            SqlCommand command = new SqlCommand(sql, c);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int id = Convert.ToInt32(reader["ID"]);
                string title = Convert.ToString(reader["Title"]);
                int length = Convert.ToInt32(reader["Length"]);
                Console.WriteLine(id + ": " + title + " (" + length + "s)");
            }
        }

        // Kör ett helt godtyckligt kommando och returnera resultatet oavsett antal kolumner och datatyper.
        // List<Dictionary<string, object>> är ett alternativ på returtyp som troligtvis är enklare att arbeta med: varje rad är en Dictionary, och varje rad ligger i sin tur i en List.
        static List<List<object>> GetResults(string sql, SqlConnection c)
        {
            SqlCommand command = new SqlCommand(sql, c);
            SqlDataReader reader = command.ExecuteReader();

            List<List<object>> allRows = new List<List<object>>();
            while (reader.Read())
            {
                List<object> singleRow = new List<object>();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    singleRow.Add(reader[i]);
                }
                allRows.Add(singleRow);
            }

            return allRows;
        }
    }
}
