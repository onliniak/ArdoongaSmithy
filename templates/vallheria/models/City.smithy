$version: "2"

namespace vallheria.city
use core.traits.layout#FlexColumnsDesktop
use core.traits.layout#FlexColumnsMobile
use core.traits.copyright#AuthorOfOriginalWork
use core.traits.copyright#AuthorEmailOfOriginalWork
use core.traits.copyright#VersionOfOriginalWork
use core.traits.copyright#RepositoryOfOriginalWork
use core.traits.copyright#YearOfOriginalWork
use core.traits.copyright#LicenseOfOriginalWork

// Klon https://amorion.pl/screens/s4_big.jpg albo https://amorion.pl/screens/s2_big.jpg
// 
//
// Layout: Mamy tu 3 kolumny, pierwszy wiersz podkreślony i pogrubiony.
// Data:   Bazy danych będą w osobnym projekcie.
//
// Do tego chcę mieć taką nakładkę:
//
// * Dystrykt Pierwszy
// * * NazwaMiejsca -> www.moja.strona/NazwaMiejsca
// * * *  link: ki
// * * *  name: bf -> [bf](www.moja.strona/ki) 
// * Dystrykt Drugi
//
// Prostszym sposobem będzie stworzenie kilku folderów i plików
// Folder = Dystrykt, Nazwa Pliku = NazwaMiejsca, Zawartość Pliku = Niestandardowy link
//
//
// Z punktu widzenia generatora otrzymuję kilka list o nazwie District
//
@AuthorOfOriginalWork("Thindil")
@AuthorEmailOfOriginalWork("thindil@vallheru.net")
@VersionOfOriginalWork("1.7")
@RepositoryOfOriginalWork("https://github.com/Vallheru/vallheru-engine")
@YearOfOriginalWork(2013)
@LicenseOfOriginalWork("GPL-2.0-or-later")
service City {
    version: "1.dealwithit.01"
    operations: [LocationsList]
}

@FlexColumnsDesktop(3)
@FlexColumnsMobile(2)
structure Layout {}

operation LocationsList {
    input: LocationsListInput
    output: LocationsListOutput
}

@mixin
structure DistrictsObject {
    @required
    district: String
    @required
    location: String
}

@input
structure LocationsListInput with [DistrictsObject] {
    locationLink: String
}

@output
structure LocationsListOutput with [DistrictsObject] {}