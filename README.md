# ArdoongaSmithy

1. Próbowałem grać w powieści wizualne RenPy Android. Po godzinie zwykle aplikacja sama się zabija.
2. Chyba za rządów Beaty Szydło założyłem pierwszą gildię w jednym z klonów Vallheru, która zakończyła erę.
     - Od tamtych czasów chciałem zrobić lepiej zoptymalizowaną wersję gry, o wiele łatwiejszą w modyfikacji.
     - Ale ostatecznie nic nie powstało.
3. Chciałem zostać Junior FullStack Developerem ale nie radzę sobie z najprostszymi zadaniami i nie pasuję do kultury żadnej organizacji.

Plan jest taki, że nie ma planu:

- Chcę zrobić deklaratywny framework z wtyczkami w WebAssembly na przeglądarki i Androida.
- Z domyślnym serwerem i publiczną bazą danych. Bez zbędnej konfiguracji po stronie twórców gier.
- Przypominający AsciiDoc w składni i podziale na szablony.
- Z podstawową obsługą Canvas 2D.
- Oparty na Konwencji Ponad Konfiguracją.

Oczywiście ani na Androidzie, ani na grafice 2D zbytnio się nie znam.

## Szablony

W założeniu twórcy modów zapisują układ strony na przykład:

```
:Photo: Zdjęcie.png
:Txt: Dokument.docx
:Select: Wybór.adoc
```

```
# Wybór.adoc

* Opcja A
** :TxT: Dobry_Wybór.docx
** :Location: ABC.html
* Opcja B
** :TxT: Zły_Wybór.docx
** :GameOver:
```

AsciiDoc jest niewrażliwy na spacje/taby (YAML odpada), 
poszczególne symbole są proste do odróżnienia (porównaj z opcja(Txt: A, Location: B) ),
łatwy do czytania w notatniku.

Komputer nie ma świadomości istnienia czegokolwiek. 
Miasto wyświetla linki do miejsc, a modyfikatory 
za rasę definiuje się w jednym pliku.

## Smithy

Smithy opisuje zarówno katalogi, jak i API dostępne w szablonach.

Powiedzmy, że mam:

```smithy
# test.smithy

$version: "2"
namespace templates.html5

// HTML5 template APIs
// Ten komentarz nie pojawi się w pliku źródłowym
service HTML5 {
    version: "0.1"
    operations: [
        Txt
    ]
}

/// Display text on screen
/// Ten komentarz będzie widoczny w pliku źródłowym
@TestExample txt.test # tests/templates/html5/txt/txt.js.test
operation Txt {
    input: String,
    output: String
}
```

Wiem, że istnieje taka funkcja jak Txt. Wiem, że wyświetla tekst na ekranie. 
I wiem, że więcej przykładów jak ona działa znajdę w katalogu tests/templates/html5/txt.

Implementacje w SolidJS i Kotlin Compose Jetpack będą w osobnych repozytoriach.

Pastebin: https://github.com/smithy-lang/smithy-examples/blob/main/custom-trait-examples/custom-trait/model/custom-traits.smithy
