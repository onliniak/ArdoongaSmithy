$version: "2"

namespace core.models.city
use core.traits.layout#FlexColumnsDesktop
use core.traits.layout#FlexColumnsMobile

service City {
    version: "1.dealwithit.01"
}

@FlexColumnsDesktop(3)
@FlexColumnsMobile(2)
structure Layout {}