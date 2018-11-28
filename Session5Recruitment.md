Ta fram en databasdesign utifrån följande beskrivning av ett rekryteringsbolag:

> Företag kan lägga ut annonser som innehåller en arbetsbeskrivning, en
> månadslön, ett sista ansökningsdatum och ett startdatum. Arbetssökande kan
> söka till valfria tjänster och kan nå företagen genom antingen postadress,
> hemsida eller e-post. Varje företag har bara en postadress och en hemsida men
> de kan ha flera e-postadresser, var och en av dem kopplad till en specifik
> person på företaget.
> 
> Arbetssökande har grundläggande personuppgifter samt ett telefonnummer och en
> e-postadress som de kan nås på. De har också kvalifikationer av två olika
> slag: 1) kompetenser (exempelvis "programmering", "bokföring", "tyska") som
> ska graderas mellan 1 och 5, samt 2) meriter (exempelvis "B-körkort",
> "auktoriserad tolk", "före detta statsminister") som inte har någon gradering.

Lägg sedan till constraints som upprätthåller följande regler:

1. sista ansökningsdatum ska vara före startdatum
2. månadslönen ska vara högre än en lagstadgad minimilön (låt säga att den
   hypotetiskt är 14.000 kr)
3. kompetenser ska bara kunna graderas med värdena 1 till 5
4. en och samma hemsida ska bara kunna användas av ett enda företag