# ArdoongaSmithy

Deklaratywny framework jak Flutter ale od gier tekstowych. 
Oparty o WebAssembly32, Konwencję Ponad Konfiguracją
i składnię w stylu AsciiDoc.

## Problem do rozwiązania

Mam framework, który zmienia się minimum raz na miesiąc. 
Raz na rzekomo oficjalnej stronie czytasz o jakimś [API](https://developer.android.com/develop/ui/compose/layouts/flow?hl=pl), 
a zaraz potem trafiasz na [info o jego wycofaniu](https://android-review.googlesource.com/c/platform/frameworks/support/+/1521704).
Na dzień dziesiejszy jednak działa ALE w trybie ExperimentalLayoutApi.
Crystal Lang miał bardzo podobny problem (LLVM psuje się po każdej aktualizacji) 
i postanowił rozwiązać go dzieląc cały kod na jak najmniejsze elementy + testy.

Ja idę o krok dalej. Znam się jako tako na CSS 
ale kompletnie nie znam się na Kotlin Jetpack Compose.
Wymyśliłem, więc taki oto sposób nauki:

1. Biorę element w CSS
2. Szukam odpowiednika w Compose
3. Zapisuję je w dwóch katalogach, jako pliki o identycznych nazwach
4. Zakładam, że biblioteka UI nie zajmuje się niczym innym jak wyświetlaniem na ekranie

A teraz pomyślmy sobie, a gdyby zapisać to wszystko w języku pośrednim ? 
Czy byłbym w stanie napisać cały framework ? Czy byłby stabilny ?

Tak powstał pomysł na napisanie silnika gier tekstowych + usług online + proste 2D.

W katalogu *core* mam podstawowe elementy, w katalogu *implementation* zapisuję 
to samo w odpowiednich językach/bibliotekach. Pierwszy katalog to platforma (
Browsers, Windows, Linux, Mac, Android, iOS), drugi to nazwa frameworka.
W katalogu *templates* wprowadzam komponenty wyższego rzędu.

W ogóle przeprowadziłem kilka testów Chata GPT i całkiem dobrze sobie radzi z
```
Your code is correct and will work as intended. However, if you want to make it a bit cleaner or more flexible, you could consider the following:
```
Za to jak mu napiszesz <<Napisz mi X>> to najprawdopodobnie wyrzuci totalny bełkot.

Co jest przerażające. Tradycyjnie musiałem spędzić kilka dni na przygotowanie kilku funkcji 
testowych i ich uruchamianie z UNIX *time* po kilka razy. Nie miałem tego czegoś, że 
patrzysz na kod i po sekundzie wiesz ile nanosekund stracisz na pisaniu właśnie w ten sposób. 

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

Największym problemem z Flutterem jest ogromny rozmiar pliku 
(tak, istnieją androidy z 250 mb miejsca na dysku) i zarządzanie stanem.

W moim frameworku korzystam z ideologii serverless, 
więc mogę sobie pozwolić na zepchnięcie stanu na poziom komponentów.
Ty tworzysz grę, a dane użytkowników zapisują się same w bezpłatnej chmurze.

## Smithy
*@Unstable* *Zapewne wkrótce się zmieni*

Język przeznaczony dla automatycznych generatorów kodu, czytelny dla człowieka.

```smithy
$version: "2"

namespace core.models.city
use core.traits.layout#FlexColumnsDesktop
use core.traits.layout#FlexColumnsMobile

service City {
    version: "1.01"
}

@FlexColumnsDesktop(3)
@FlexColumnsMobile(2)
structure Layout {}
```

Tutaj nic wielkiego. Tworzę coś o nazwie City i daję wskazówki 
jak komputer ma mi podzielić ekran na mniejszych i większych urządzeniach.
Żeby zrobić z tego *component* w JS, czy *composable* w Kotlinie 
wykorzystuję gotowy szablon i argumenty funkcji.

Jeśli mówisz sobie *<Widzę przed sobą miasto w Amorionie, mam listę swoich linków i chcę żeby komputer zrobił mi identyczną stronę ale z moją treścią>*
ale nie ma akurat gotowego moda, to musisz napisać go w Smithy. Nie jest to trudne ale na początku może się wydawać dziwne.

## Układ Katalogów
*@Unstable* *Zapewne wkrótce się zmieni*

* Core
* * Models
* * Design
* * Implementation [Testy]
* * * SolidJS
* * * Compose Jetpack
* Templates
* * Vallheria
* * * Models
* * * Design
* * * Implementation
* * Canvas
* * FenoxoStyleDesign
* * AzgaarMapMod

### Wyjaśnienie

W przeciwieństwie do samouczków na YouTubach i kursów 
Samouctwo kładzie szczególny nacisk na planowanie. 
Zaczynamy od katalogu Design, w którym leżą pliki .svg 
(przekonwertowane z Figmy)
Wiedząc jak ma wyglądać UI przechodzę do katalogu 
Models, w którym leżą pliki .smithy . Tutaj zapisuję 
argumenty wszystkich funkcji oraz modele danych.

Katalog Templates jest podstawą deklaratywnego 
frameworku, o którym mowa w dalszej części dokumentu. 

WasMath to kilka prostych skryptów w WASM32, które pozwolą 
mi zautomatyzować tworzenie logiki biznesowej.

Canvas to zbiór eksperymentów z wyświetlaniem grafiki 2D
w stylu jRPG i RenPy Visual Novels (próbowałem z tego 
korzystać na Androidzie ale zawsze aplikacja się zabija 
po pewnym czasie). 

Fenoxo znany jest z charakterystycznego interfejsu 
użytkownika dla gier tekstowych.

Azgaar stworzył edytor map fantasy. Mod używa danych 
z istniejącej mapy do stworzenia realistyczniejszych gier.