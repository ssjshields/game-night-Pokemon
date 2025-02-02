require "Items/SuburbsDistributions"

local gameNightDistro = require "gameNight - Distributions"

gameNightDistro.proceduralDistGameNight.itemsToAdd["pokemonStarterKit"] = {
    rolls = 6,
    perDistFactor = {
        ["Gifts"] = 1,
        ["GigamartToys"] = 1,
        ["HolidayStuff"] = 1,
        ["ClassroomDesk"] = 0.01,
        ["BedroomDresser"] = 0.01,
        ["ClassroomMisc"] = 0.01,
        ["SchoolLockers"] = 0.01,
        ["OfficeDeskHome"] = 0,
        ["BarCounterMisc"] = 0,
        ["Hobbies"] = 0.01,
        ["WardrobeChild"] = 0.01,
        ["CrateRandomJunk"] = 0.01,
    }
}

gameNightDistro.proceduralDistGameNight.itemsToAdd["pokemonBoosterPack"] = {
    rolls = 12,
    perDistFactor = {
        ["Gifts"] = 1,
        ["GigamartToys"] = 1,
        ["HolidayStuff"] = 1,
        ["ClassroomDesk"] = 0.015,
        ["BedroomDresser"] = 0.01,
        ["ClassroomMisc"] = 0.01,
        ["SchoolLockers"] = 0.015,
        ["OfficeDeskHome"] = 0,
        ["BarCounterMisc"] = 0,
        ["Hobbies"] = 0.01,
        ["WardrobeChild"] = 0.01,
        ["CrateRandomJunk"] = 0.01,
    }
}

gameNightDistro.proceduralDistGameNight.itemsToAdd["pokemonCards"] = {
    rolls = 2,
    perDistFactor = {
        ["Gifts"] = 0,
        ["GigamartToys"] = 0,
        ["HolidayStuff"] = 0,
        ["SchoolLockers"] = 1.75,
        ["ClassroomDesk"] = 1.75,
    }
}
