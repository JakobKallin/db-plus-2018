/* 1 */
// Skapa en musikdatabas som motsvarar klasserna i den här C#-koden.
// Viktigt: det finns ingen koppling mellan klasserna och ska inte heller finnas det i era tabeller; detta kommer senare.

class Song {
    int ID;
    string Title;
    TimeSpan Length; // TimeSpan används i C# för att representera tidsintervall. Hur åstadkommer vi samma i T-SQL?
    string Lyrics; // Kom ihåg att dessa kan vara väldigt långa.
    bool Single; // Huruvida låten släpptes som singel eller inte.
}

class Album {
    int ID;
    string Title;
    DateTime ReleaseDate;
}

// Ett "band" kan också vara en enstaka artist, exempelvis Adele eller Bruno Mars.
class Band {
    int ID;
    string Name;
    int YearFormed; // Skulle vi kunna använda DateTime här? Bör vi använda en datumtyp i T-SQL? Varför eller varför inte?
    string Country;
}

/* 2 */
// Lägg in lämplig data i er nya musikdatabas. Lägg med så pass mycket data att
// ni får in många olika kombinationer av värden: långa titlar och korta titlar;
// långa låtar och korta låtar; singlar och icke-singlar; gamla och nya album
// och band; band från olika länder; och så vidare. (Ni kommer även att kunna
// lägga till mer data framöver, när ni får också får i uppgift att jobba med
// datan på olika sätt.)