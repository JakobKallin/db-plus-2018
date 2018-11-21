using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session3
{
    class Program
    {
        static void Main(string[] args)
        {
            // Se Session3.md utanför denna solution för en beskrivning av dagens uppgift.

            // För att ansluta Visual Studio till er databas, öppna View > Server Explorer och klicka på knappen "Connect to Database" i rutan som dyker upp. Skriv "(local)\SQLEXPRESS" under "Server Name", välj den aktuella databasen under "Select or enter a database name" och klicka på "OK".

            // Strängen nedanför ska ersättas med databasens "connection string". Denna hittar ni genom att högerklicka på databasen i Server Explorer, välja Properties och sedan leta upp "Connection String" i rutan som visas. Se till att ni först har anslutit Visual Studio till er databas med hjälp av föregående kommentar.
            SqlConnection connection = new SqlConnection(@"...");
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM Song", connection);
            SqlDataReader reader = command.ExecuteReader();

            // Denna loop fortsätter tills alla rader har lästs (genom att Read() returnerar en boolean).
            while (reader.Read())
            {
                // Via SqlDataReader kan vi hämta in värdena i varje rad, samt antalet kolumner, kolumnernas namn och liknande metadata. Samtliga värden är "object" och behöver därför konverteras med exempelvis metoderna i Convert-klassen.
                object firstColumnValue = reader[0];
                int firstColumnValueWithType = Convert.ToInt32(reader[0]);
                object namedColumnValue = reader["Title"];
                string firstColumnName = reader.GetName(0);
                int numberOfColumns = reader.FieldCount;
            }

            // I ett större program bör vi här stänga uppkopplingen samt de andra objekten när vi är klara med dem för att se till att de inte tar upp resurser i onödan. Detta kan göras med "using"-satsen, som i detta kodexempel: https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqlconnection
        }
    }
}
