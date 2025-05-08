$version: "2"

namespace AzgaarMapMod.city
use core.traits.copyright#NamespaceOfOriginalWork

// Przykład rozszerzenia szablonu innego autora
//
// W tej chwili City wyświetla linki ułożone w kolumny.
// Ja chcę, by moje miasto stało się Tym Konkretnym Miastem 
// Położonym Na Mapie Świata
// A konkretnie, chcę by miało swój obszar, drogi handlowe, 
// pogodę, populację, religię, dominujące rasy itp. 
// Zgodnie z założeniem część tych danych nie musi mieć zaraz 
// większego znaczenia. W końcu każdy może rozszerzyć moje
// rozszerzenie o swoją treść.
//
// Jednocześnie część funkcjonalności mojego rozszerzenia wymaga 
// uruchomienia określonej funkcji w regularnych odstępach czasu.
// Potrzebuję też prostego modułu matematycznego, by opisać 
// wzory matematyczne uruchamiane po spełnieniu określonych warunków.
//
// Ale zanim zaczniemy jedno ważne pytanie:
// A może ja chcę mieć swoje własne City, a 
// nie modyfikować pracę innego autora ?
// Właśnie dlatego powstał trait NamespaceOfOriginalWork
// 
// Jak tylko sobie ułożę co i jak, dodam cały zestaw reguł
// praw autorskich, a ten komentarz pewnie gdzieś przeniosę.
//
//

@NamespaceOfOriginalWork("vallheria.city")
service City {
    version: "0.1.0"
}

