local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

local Pokemon = {}

Pokemon.tradingCards = {

    ["Base"] = {
        "Abra", "Alakazam", "Arcanine", "Beedrill", "Bill", "Blastoise",
        "Bulbasaur", "Caterpie", "Chansey", "Charizard", "Charmander", "Charmeleon",
        "Clefairy Doll", "Clefairy", "Computer Search", "Defender", "Devolution Spray", "Dewgong",
        "Diglett", "Doduo", "Double Colorless Energy", "Dragonair", "Dratini", "Drowzee", 
        "Dugtrio", "Electabuzz", "Electrode", "Energy Removal", "Energy Retrieval", "Farfetchd", 
        "Fighting Energy", "Fire Energy", "Full Heal", "Gastly", "Grass Energy", 
        "Growlithe", "Gust Of Wind", "Gyarados", "Haunter", "Hitmonchan", 
        "Impostor Professor Oak", "Item Finder", "Ivysaur", "Jynx", "Kadabra", 
        "Kakuna", "Koffing", "Lass", "Lightning Energy", "Machamp", 
        "Machoke", "Machop", "Magikarp", "Magmar", "Magnemite", 
        "Magneton", "Maintenance", "Metapod", "Mewtwo", "Nidoking", 
        "Nidoran (Male)", "Nidorino", "Ninetales", "Onix", "Pidgeotto", 
        "Pidgey", "Pikachu", "Pluspower", "Pokedex", "Pokemon Breeder", 
        "Pokemon Center", "Pokemon Flute", "Pokemon Trader", "Poliwag", "Poliwhirl", 
        "Poliwrath", "Ponyta", "Porygon", "Potion", "Professor Oak", 
        "Psychic Energy", "Raichu", "Raticate", "Rattata", "Revive", 
        "Sandshrew", "Scoop Up", "Seel", "Squirtle", "Starmie", 
        "Staryu", "Super Energy Removal", "Super Potion", "Switch", "Tangela", 
        "Venusaur", "Voltorb", "Vulpix", "Wartortle", "Water Energy", 
        "Weedle", "Zapdos"
    }

    ["Jungle"] = {

    },

    ["Fossil"] = {

    },

    ["Rocket"] = {

    },

    ["Energy"] = {

    },

    ["Trainer"] = {

    },

    ["Item"] = {

    },
}

--[[
MTG.catalogue = {}
MTG.altNames = {}

MTG.alphaRare = {
    "Artifacts 2", "Artifacts 5", "Artifacts 8", "Artifacts 11", "Artifacts 16", "Artifacts 17", "Artifacts 18",
    "Artifacts 19", "Artifacts 20", "Artifacts 22", "Artifacts 23", "Artifacts 28", "Artifacts 29", "Artifacts 35",
    "Artifacts 36", "Artifacts 37", "Artifacts 38", "Artifacts 44", "Artifacts 45", "Black 2", "Black 3", "Black 6",
    "Black 18", "Black 19", "Black 20", "Black 21", "Black 26", "Black 36", "Black Blue Land 1", "Black Green Land 1",
    "Blue Red Land 1", "Blue 4", "Blue 7", "Blue 10", "Blue 12", "Blue 15", "Blue 16", "Blue 18", "Blue 25", "Blue 26",
    "Blue 33", "Blue 34", "Blue 37", "Blue 46", "Blue White Land 1", "Green 5", "Green 16", "Green 20", "Green 23",
    "Green 25", "Green 27", "Green 31", "Green 37", "Green 39", "Green 41", "Green 45", "Green Blue Land 1",
    "Green Red Land 1", "Red 1", "Red 2", "Red 5", "Red 6", "Red 22", "Red 24", "Red 31", "Red 32", "Red 33",
    "Red 34", "Red 35", "Red 39", "Red Black Land 1", "Red White Land 1", "White 3", "White 12", "White 13",
    "White 14", "White 15", "White 20", "White 22", "White 27", "White 31", "White Black Land 1", "White Green Land 1",
}

MTG.alphaUncommon = {
    "Artifacts 1", "Artifacts 6", "Artifacts 7", "Artifacts 8", "Artifacts 9", "Artifacts 12", "Artifacts 13",
    "Artifacts 14", "Artifacts 15", "Artifacts 21", "Artifacts 25", "Artifacts 26", "Artifacts 27", "Artifacts 30",
    "Artifacts 33", "Artifacts 34", "Artifacts 39", "Artifacts 40", "Artifacts 41", "Artifacts 43", "Black 9",
    "Black 11", "Black 14", "Black 16", "Black 17", "Black 23", "Black 24", "Black 25", "Black 29", "Black 32",
    "Black 34", "Black 38", "Black 40", "Black 43", "Black 45", "Blue 2", "Blue 8", "Blue 9", "Blue 17", "Blue 19",
    "Blue 22", "Blue 23", "Blue 27", "Blue 29", "Blue 32", "Blue 42", "Blue 43", "Blue 44", "Blue 45", "Green 3",
    "Green 4", "Green 6", "Green 7", "Green 11", "Green 14", "Green 17", "Green 21", "Green 26", "Green 28",
    "Green 35", "Green 38", "Green 40", "Green 43", "Green 44", "Red 3", "Red 4", "Red 7", "Red 12", "Red 13",
    "Red 15", "Red 17", "Red 18", "Red 19", "Red 21", "Red 30", "Red 37", "Red 42", "Red 44", "Red 46", "White 2",
    "White 8", "White 9", "White 11", "White 18", "White 21", "White 24", "White 28", "White 32", "White 33",
    "White 34", "White 35", "White 39", "White 41", "White 42",
}

MTG.alphaCommon = {
    "Black 4", "Black 5", "Black 7", "Black 8", "Black 10", "Black 12", "Black 15", "Black 22", "Black 30",
    "Black 37", "Black 41", "Black 42", "Black 44", "Black 46", "Blue 1", "Blue 3", "Blue 5", "Blue 11",
    "Blue 13", "Blue 14", "Blue 20", "Blue 21", "Blue 28", "Blue 31", "Blue 35", "Blue 38", "Blue 39",
    "Blue 40", "Blue 41", "Green 2", "Green 8", "Green 9", "Green 10", "Green 13", "Green 15", "Green 18",
    "Green 19", "Green 22", "Green 30", "Green 32", "Green 33", "Green 34", "Green 42", "Red 8", "Red 9",
    "Red 10", "Red 11", "Red 16", "Red 20", "Red 23", "Red 25", "Red 26", "Red 27", "Red 36", "Red 38",
    "Red 40", "Red 43", "Red 45", "White 1", "White 4", "White 5", "White 7", "White 17", "White 19",
    "White 25", "White 26", "White 29", "White 38", "White 40", "White 43", "White 44",
}

MTG.alphaLand = {
    "Red Land 1", "Red Land 2", "Red Land 3", "Blue Land 1", "Blue Land 2", "Blue Land 3",
    "Green Land 1", "Green Land 2", "Green Land 3", "White Land 1", "White Land 2", "White Land 3",
    "Black Land 1", "Black Land 2", "Black Land 3",
}
]]


MTG.colorCodedRarity = {Land={}, Common={}, Uncommon={}, Rare={}}

--- Build entire catalogue as a deck
for set,cards in pairs(Pokemon.tradingCards) do
    for i,card in pairs(cards) do
        local cardID = "MTG Alpha "..set.." "..i
        MTG.altNames[cardID] = card

        local keyed = false
        for rarity,data in pairs(MTG.colorCodedRarity) do
            if not keyed then
                for n,c in pairs(MTG["alpha"..rarity]) do
                    if c == (set.." "..i) then
                        MTG.colorCodedRarity[rarity][set] = MTG.colorCodedRarity[rarity][set] or {}
                        table.insert(MTG.colorCodedRarity[rarity][set], c)
                        keyed = true
                    end
                end
            end
        end

        table.insert(MTG.catalogue, cardID)
    end
end
deckActionHandler.addDeck("mtgCards", MTG.catalogue, MTG.altNames)


applyItemDetails.MTG = {}

function applyItemDetails.MTG.rollLand(rarity)
    --The chance of getting a basic land instead of another card is approximately:
    -- 4.13% for rares, 21.5% for uncommon and 38.84% for commons.
    local chance = rarity and (rarity == "Rare" and 4.13 or rarity == "Uncommon" and 21.5 or rarity == "Common" and 38.84)
    if chance then
        return (ZombRandFloat(0.0,100.0) < chance)
    end
    return false
end


function applyItemDetails.MTG.weighedProbability(outcomesAndWeights)
    local totalWeight = 0
    for outcome, weight in pairs(outcomesAndWeights) do totalWeight = totalWeight + weight end
    local randomNumber = ZombRand(totalWeight)+1
    local cumulativeWeight = 0
    for outcome, weight in pairs(outcomesAndWeights) do
        cumulativeWeight = cumulativeWeight + weight
        if randomNumber <= cumulativeWeight then
            return outcome
        end
    end
end


function applyItemDetails.MTG.rollCardOfParticularColor(rarity, set)
    local cardPool = MTG.colorCodedRarity[rarity][set]
    return ("MTG Alpha "..cardPool[ZombRand(#cardPool)+1])
end


function applyItemDetails.MTG.rollCard(rarity)
    --roll for land first
    local rollLand = applyItemDetails.MTG.rollLand(rarity)
    if rollLand then
        if rarity == "Rare" then
            -- The only lands on the rare sheets were five copies of Island.
            return ("MTG Alpha Blue Land "..ZombRand(3)+1)
        else
            return ("MTG Alpha "..MTG.alphaLand[ZombRand(#MTG.alphaLand)+1])
        end
    end

    local cardPool = MTG["alpha"..rarity]
    return ("MTG Alpha "..cardPool[ZombRand(#cardPool)+1])
end



function applyItemDetails.MTG.unpackBooster(cards)
    -- 11 common, 3 uncommon, 1 rare -- 15

    for i=1, 11 do
        local card = applyItemDetails.MTG.rollCard("Common")
        table.insert(cards, card)
    end

    for i=1, 3 do
        local card = applyItemDetails.MTG.rollCard("Uncommon")
        table.insert(cards, card)
    end

    for i=1, 1 do
        local card = applyItemDetails.MTG.rollCard("Rare")
        table.insert(cards, card)
    end

    return cards
end


function applyItemDetails.applyBoostersToCards(item, n)
    item:getModData()["gameNight_cardAltNames"] = nil
    local cards = {}
    n = n or 1
    for i=1, n do applyItemDetails.MTG.unpackBooster(cards) end
    item:getModData()["gameNight_cardDeck"] = cards
    item:getModData()["gameNight_cardFlipped"] = {}
    for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
end


function applyItemDetails.applyCardForMTG(item)
    local applyBoosters = item:getModData()["gameNight_specialOnCardApplyBoosters"]
    --- recipe sets this modData to the resulting item, 1 booster = 15 cards, 4 = 60.
    if applyBoosters then
        item:getModData()["gameNight_specialOnCardApplyBoosters"] = nil
        applyItemDetails.applyBoostersToCards(item, applyBoosters)
        return
    end

    item:getModData()["gameNight_cardAltNames"] = nil
    if not item:getModData()["gameNight_cardDeck"] then
        local cards = MTG.buildDeck()
        item:getModData()["gameNight_cardDeck"] = cards
        item:getModData()["gameNight_cardFlipped"] = {}
        for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
    end
end


gamePieceAndBoardHandler.registerSpecial("Base.mtgCards", { shiftAction = {"tapCard"}, actions = { tapCard=true, examineCard=true}, examineScale = 0.75, applyCards = "applyCardForMTG", textureSize = {100,140} })


function deckActionHandler.tapCard_isValid(deckItem, player) if deckItem and deckItem:getWorldItem() then return true end end
function deckActionHandler.tapCard(deckItem, player)
    local current = deckItem:getModData()["gameNight_rotation"] or 0
    local state = current == 90 and 0 or 90

    gamePieceAndBoardHandler.playSound(deckItem, player)
    gamePieceAndBoardHandler.pickupAndPlaceGamePiece(player, deckItem, {gamePieceAndBoardHandler.setModDataValue, deckItem, "gameNight_rotation", state})
end


MTG.deckArchetypesList = {
    --- 5 mono decks
    White = {"White"},
    Black = {"Black"},
    Green = {"Green"},
    Blue = {"Blue"},
    Red = {"Red"},

    --- 10 duo decks
    Azorius = {"White", "Blue"},
    Dimir = {"Blue", "Black"},
    Rakdos = {"Black", "Red"},
    Gruul = {"Red", "Green"},
    Selesnya = {"White", "Green"},
    Orzhov = {"White", "Black"},
    Izzet = {"Blue", "Red"},
    Golgari = {"Black", "Green"},
    Boros = {"Red", "White"},
    Simic = {"Blue", "Green"},

    --- 10 trio decks
    Bant = {"White", "Blue", "Green"},
    Esper = {"White", "Blue", "Black"},
    Grixis = {"Blue", "Black", "Red"},
    Jund = {"Black", "Red", "Green"},
    Naya = {"White", "Red", "Green"},
    Abzan = {"White", "Black", "Green"},
    Jeskai = {"White", "Blue", "Red"},
    Sultai = {"Blue", "Black", "Green"},
    Mardu = {"White", "Black", "Red"},
    Temur = {"Blue", "Red", "Green"}

}

function MTG.buildDeck(archetype)

    local cards = {}

    archetype = archetype or applyItemDetails.MTG.weighedProbability(
            {White=4, Black=4, Green=4, Blue=4, Red=4,
             Azorius=8, Dimir=8, Rakdos=8, Gruul=8, Selesnya=8, Orzhov=8, Izzet=8, Golgari=8, Boros=8, Simic=8,
             Bant = 1, Esper = 1, Grixis = 1, Jund = 1, Naya = 1, Abzan = 1, Jeskai = 1, Sultai = 1, Mardu = 1, Temur = 1
            })

    local deckSize = ZombRand(55,66)

    local colors = MTG.deckArchetypesList[archetype]

    --[[DEBUG]] local colorString = ""
    for i,c in ipairs(colors) do colorString = colorString..c..((#colors>1 and i~=#colors) and "/" or "") end
    --[[DEBUG]] local rarities = {Common=0, Uncommon = 0, Rare =0}
    --avg goal of 6 artifacts
    --11 instead of 10 skews the average lower
    local artifactGoal = math.floor(deckSize/11)+ZombRand(3) -- 0 to 2 additional
    for i=1, artifactGoal do
        local rarity = applyItemDetails.MTG.weighedProbability({ Uncommon = 3, Rare = 1})
        --[[DEBUG]] rarities[rarity] = rarities[rarity]+1
        local card = applyItemDetails.MTG.rollCardOfParticularColor(rarity, "Artifacts")
        table.insert(cards, card)
    end

    --avg goal of 24 land
    local landGoal = math.floor(deckSize/2.5)+ZombRand(4) --0 to 3
    for i=1, landGoal do
        local color = colors[ZombRand(#colors)+1]
        local card = applyItemDetails.MTG.rollCardOfParticularColor("Land", color.." Land")
        table.insert(cards, card)
    end

    local remainingCount = deckSize - #cards
    for i=1, remainingCount do
        local color = colors[ZombRand(#colors)+1]
        local rarity = applyItemDetails.MTG.weighedProbability({ Common = 11, Uncommon = 3, Rare = 1})
        --[[DEBUG]] rarities[rarity] = rarities[rarity]+1
        local card = applyItemDetails.MTG.rollCardOfParticularColor(rarity, color)
        table.insert(cards, card)
    end

    if getDebug() then
        print("DECK BUILT: ", " c:"..#cards, " +a:"..artifactGoal, " +l:"..landGoal, " +o:"..remainingCount,
                "=("..remainingCount+landGoal+artifactGoal..")",
                " (r:"..rarities.Rare," u:"..rarities.Uncommon," c:"..rarities.Common..")",
                "  ["..colorString.."]")
    end

    return cards
end
