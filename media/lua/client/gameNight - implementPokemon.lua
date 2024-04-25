local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

local Pokemon = {}

Pokemon.tradingCards = {

    ["Base"] = {
    "Base Abra",
    "Base Alakazam",
    "Base Arcanine",
    "Base Beedrill",
    "Base Bill",
    "Base Blastoise",
    "Base Bulbasaur",
    "Base Caterpie",
    "Base Chansey",
    "Base Charizard",
    "Base Charmander",
    "Base Charmeleon",
    "Base Clefairy Doll",
    "Base Clefairy",
    "Base Computer Search",
    "Base Defender",
    "Base Devolution Spray",
    "Base Dewgong",
    "Base Diglett",
    "Base Doduo",
    "Base Double Colorless Energy",
    "Base Dragonair",
    "Base Dratini",
    "Base Drowzee",
    "Base Dugtrio",
    "Base Electabuzz",
    "Base Electrode",
    "Base Energy Removal",
    "Base Energy Retrieval",
    "Base Farfetchd",
    "Base Fighting Energy",
    "Base Fire Energy",
    "Base Full Heal",
    "Base Gastly",
    "Base Grass Energy",
    "Base Growlithe",
    "Base Gust Of Wind",
    "Base Gyarados",
    "Base Haunter",
    "Base Hitmonchan",
    "Base Impostor Professor Oak",
    "Base Item Finder",
    "Base Ivysaur",
    "Base Jynx",
    "Base Kadabra",
    "Base Kakuna",
    "Base Koffing",
    "Base Lass",
    "Base Lightning Energy",
    "Base Machamp",
    "Base Machoke",
    "Base Machop",
    "Base Magikarp",
    "Base Magmar",
    "Base Magnemite",
    "Base Magneton",
    "Base Maintenance",
    "Base Metapod",
    "Base Mewtwo",
    "Base Nidoking",
    "Base Nidoran (Male)",
    "Base Nidorino",
    "Base Ninetales",
    "Base Onix",
    "Base Pidgeotto",
    "Base Pidgey",
    "Base Pikachu",
    "Base Pluspower",
    "Base Pokedex",
    "Base Pokemon Breeder",
    "Base Pokemon Center",
    "Base Pokemon Flute",
    "Base Pokemon Trader",
    "Base Poliwag",
    "Base Poliwhirl",
    "Base Poliwrath",
    "Base Ponyta",
    "Base Porygon",
    "Base Potion",
    "Base Professor Oak",
    "Base Psychic Energy",
    "Base Raichu",
    "Base Raticate",
    "Base Rattata",
    "Base Revive",
    "Base Sandshrew",
    "Base Scoop Up",
    "Base Seel",
    "Base Squirtle",
    "Base Starmie",
    "Base Staryu",
    "Base Super Energy Removal",
    "Base Super Potion",
    "Base Switch",
    "Base Tangela",
    "Base Venusaur",
    "Base Voltorb",
    "Base Vulpix",
    "Base Wartortle",
    "Base Water Energy",
    "Base Weedle",
    "Base Zapdos"
    },

    ["Jungle"] = {
   "Jungle Bellsprout",
   "Jungle Butterfree",
   "Jungle Clefable (Alt)",
   "Jungle Clefable",
   "Jungle Cubone",
   "Jungle Dodrio",
   "Jungle Eevee",
   "Jungle Electrode (Alt)",
   "Jungle Electrode",
   "Jungle Exeggcute",
   "Jungle Exeggutor",
   "Jungle Fearow",
   "Jungle Flareon (Alt)",
   "Jungle Flareon",
   "Jungle Gloom",
   "Jungle Goldeen",
   "Jungle Jigglypuff",
   "Jungle Jolteon (Alt)",
   "Jungle Jolteon",
   "Jungle Kangaskhan (Alt)",
   "Jungle Kangaskhan",
   "Jungle Lickitung",
   "Jungle Mankey",
   "Jungle Marowak",
   "Jungle Meowth",
   "Jungle Mr Mime",
   "Jungle Mr. Mime (Alt)",
   "Jungle Nidoqueen (Alt)",
   "Jungle Nidoqueen",
   "Jungle Nidoran (Female)",
   "Jungle Nidorina",
   "Jungle Oddish",
   "Jungle Paras",
   "Jungle Parasect",
   "Jungle Persian",
   "Jungle Pidgeot (Alt)",
   "Jungle Pidgeot",
   "Jungle Pikachu",
   "Jungle Pinsir (Alt)",
   "Jungle Pinsir",
   "Jungle Poke Ball",
   "Jungle Primeape",
   "Jungle Rapidash",
   "Jungle Rhydon",
   "Jungle Rhyhorn",
   "Jungle Scyther (Alt)",
   "Jungle Scyther",
   "Jungle Seaking",
   "Jungle Snorlax (Alt)",
   "Jungle Snorlax",
   "Jungle Spearow",
   "Jungle Tauros",
   "Jungle Vaporeon (Alt)",
   "Jungle Vaporeon",
   "Jungle Venomoth (Alt)",
   "Jungle Venomoth",
   "Jungle Venonat",
   "Jungle Victreebel (Alt)",
   "Jungle Victreebel",
   "Jungle Vileplume (Alt)",
   "Jungle Vileplume",
   "Jungle Weepinbell",
   "Jungle Wigglytuff (Alt)",
   "Jungle Wigglytuff"
    },

    ["Fossil"] = {
    "Fossil Aerodactyl (Alt)",
    "Fossil Aerodactyl",
    "Fossil Arbok",
    "Fossil Articuno (Alt)",
    "Fossil Articuno",
    "Fossil Cloyster",
    "Fossil Ditto (Alt)",
    "Fossil Ditto",
    "Fossil Dragonite (Alt)",
    "Fossil Dragonite",
    "Fossil Ekans",
    "Fossil Energy Search",
    "Fossil Gambler",
    "Fossil Gastly",
    "Fossil Gengar (Alt)",
    "Fossil Gengar",
    "Fossil Geodude",
    "Fossil Golbat",
    "Fossil Golduck",
    "Fossil Golem",
    "Fossil Graveler",
    "Fossil Grimer",
    "Fossil Haunter (Alt)",
    "Fossil Haunter",
    "Fossil Hitmonlee (Alt)",
    "Fossil Hitmonlee",
    "Fossil Horsea",
    "Fossil Hypno (Alt)",
    "Fossil Hypno",
    "Fossil Kabuto",
    "Fossil Kabutops (Alt)",
    "Fossil Kabutops",
    "Fossil Kingler",
    "Fossil Krabby",
    "Fossil Lapras (Alt)",
    "Fossil Lapras",
    "Fossil Magmar",
    "Fossil Magneton (Alt)",
    "Fossil Magneton",
    "Fossil Moltres (Alt)",
    "Fossil Moltres",
    "Fossil Mr. Fuji",
    "Fossil Muk (Alt)",
    "Fossil Muk",
    "Fossil Mysterious Fossil",
    "Fossil Omanyte",
    "Fossil Omastar",
    "Fossil Psyduck",
    "Fossil Raichu (Alt)",
    "Fossil Raichu",
    "Fossil Recycle",
    "Fossil Sandslash",
    "Fossil Seadra",
    "Fossil Shellder",
    "Fossil Slowbro",
    "Fossil Slowpoke",
    "Fossil Tentacool",
    "Fossil Tentacruel",
    "Fossil Weezing",
    "Fossil Zapdos (Alt)",
    "Fossil Zapdos",
    "Fossil Zubat"
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
Pokemon.catalogue = {}
Pokemon.altNames = {}

-- Base Set
Pokemon.baseRare = {
    
}

Pokemon.baseUncommon = {
   
}

Pokemon.baseCommon = {
    
}

Pokemon.baseEnergy = {
    
}

-- Jungle Set
Pokemon.jungleRare = {
    
}

Pokemon.jungleUncommon = {
    
}

Pokemon.jungleCommon = {
    
}

Pokemon.jungleEnergy = {
    
}

-- Fossil Set
Pokemon.fossilRare = {
    
}

Pokemon.fossilUncommon = {
    
}

Pokemon.fossilCommon = {
    
}

Pokemon.fossilEnergy = {
    
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
