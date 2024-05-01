require "Items/SuburbsDistributions"

local gameNightDistro = require "gameNight - Distributions"

gameNightDistro.proceduralDistGameNight.itemsToAdd["mtgStarterKit"] = {
    perDistFactor = {
        ["ClassroomDesk"] = 0.01,
        ["BedroomDresser"] = 0.01,
        ["ClassroomMisc"] = 0.01,
        ["SchoolLockers"] = 0.01,
        ["OfficeDeskHome"]=0,
        ["BarCounterMisc"]=0,
        ["Hobbies"]=0.01,
        ["WardrobeChild"]=0.01,
        ["CrateRandomJunk"]=0.01,
    }
}

gameNightDistro.proceduralDistGameNight.itemsToAdd["mtgBoosterPack"] = {
    perDistFactor = {
        ["ClassroomDesk"] = 0.01,
        ["BedroomDresser"] = 0.01,
        ["ClassroomMisc"] = 0.01,
        ["SchoolLockers"] = 0.01,
        ["OfficeDeskHome"]=0,
        ["BarCounterMisc"]=0,
        ["Hobbies"]=0.01,
        ["WardrobeChild"]=0.01,
        ["CrateRandomJunk"]=0.01,
    }
}

gameNightDistro.proceduralDistGameNight.itemsToAdd["mtgCards"] = {
    perDistFactor = {
        ["Gifts"]=0,
        ["GigamartToys"]=0,
        ["HolidayStuff"]=0,
        ["SchoolLockers"] = 1.5,
        ["ClassroomDesk"] = 1.5,
    }
}
