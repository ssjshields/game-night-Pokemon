local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

local Pokemon = {}

Pokemon.catalogue = {}
Pokemon.altNames = {}

--- Maybe the sets can be compiled using their rarity tables, rather than listing the same names twice?

Pokemon.tradingCards = {

    ["Base"] = {
        "Abra", "Alakazam", "Arcanine", "Beedrill", "Bill", "Blastoise", "Bulbasaur", "Caterpie", "Chansey", "Charizard",
        "Charmander", "Charmeleon", "Clefairy Doll", "Clefairy", "Computer Search", "Defender", "Devolution Spray",
        "Dewgong", "Diglett", "Doduo", "Double Colorless Energy", "Dragonair", "Dratini", "Drowzee", "Dugtrio",
        "Electabuzz", "Electrode", "Energy Removal", "Energy Retrieval", "Farfetchd", "Fighting Energy", "Fire Energy",
        "Full Heal", "Gastly", "Grass Energy", "Growlithe", "Gust Of Wind", "Gyarados", "Haunter", "Hitmonchan",
        "Impostor Professor Oak", "Item Finder", "Ivysaur", "Jynx", "Kadabra", "Kakuna", "Koffing", "Lass",
        "Lightning Energy", "Machamp", "Machoke", "Machop", "Magikarp", "Magmar", "Magnemite", "Magneton", "Maintenance",
        "Metapod", "Mewtwo", "Nidoking", "Nidoran (Male)", "Nidorino", "Ninetales", "Onix", "Pidgeotto", "Pidgey",
        "Pikachu", "Pluspower", "Pokedex", "Pokemon Breeder", "Pokemon Center", "Pokemon Flute", "Pokemon Trader",
        "Poliwag", "Poliwhirl", "Poliwrath", "Ponyta", "Porygon", "Potion", "Professor Oak", "Psychic Energy", "Raichu",
        "Raticate", "Rattata", "Revive", "Sandshrew", "Scoop Up", "Seel", "Squirtle", "Starmie", "Staryu",
        "Super Energy Removal", "Super Potion", "Switch", "Tangela", "Venusaur", "Voltorb", "Vulpix", "Wartortle",
        "Water Energy", "Weedle", "Zapdos"
    },

    ["Jungle"] = {
        "Bellsprout", "Butterfree", "Clefable (Alt)", "Clefable", "Cubone", "Dodrio", "Eevee", "Electrode (Alt)",
        "Electrode", "Exeggcute", "Exeggutor", "Fearow", "Flareon (Alt)", "Flareon", "Gloom", "Goldeen", "Jigglypuff",
        "Jolteon (Alt)", "Jolteon", "Kangaskhan (Alt)", "Kangaskhan", "Lickitung", "Mankey", "Marowak", "Meowth",
        "Mr Mime", "Mr. Mime (Alt)", "Nidoqueen (Alt)", "Nidoqueen", "Nidoran (Female)", "Nidorina", "Oddish", "Paras",
        "Parasect", "Persian", "Pidgeot (Alt)", "Pidgeot", "Pikachu", "Pinsir (Alt)", "Pinsir", "Poke Ball", "Primeape",
        "Rapidash", "Rhydon", "Rhyhorn", "Scyther (Alt)", "Scyther", "Seaking", "Snorlax (Alt)", "Snorlax", "Spearow",
        "Tauros", "Vaporeon (Alt)", "Vaporeon", "Venomoth (Alt)", "Venomoth", "Venonat", "Victreebel (Alt)", "Victreebel",
        "Vileplume (Alt)", "Vileplume", "Weepinbell", "Wigglytuff (Alt)", "Wigglytuff"
    },

    ["Fossil"] = {
        "Aerodactyl (Alt)", "Aerodactyl", "Arbok", "Articuno (Alt)", "Articuno", "Cloyster", "Ditto (Alt)", "Ditto",
        "Dragonite (Alt)", "Dragonite", "Ekans", "Energy Search", "Gambler", "Gastly", "Gengar (Alt)", "Gengar",
        "Geodude", "Golbat", "Golduck", "Golem", "Graveler", "Grimer", "Haunter (Alt)", "Haunter", "Hitmonlee (Alt)",
        "Hitmonlee", "Horsea", "Hypno (Alt)", "Hypno", "Kabuto", "Kabutops (Alt)", "Kabutops", "Kingler", "Krabby",
        "Lapras (Alt)", "Lapras", "Magmar", "Magneton (Alt)", "Magneton", "Moltres (Alt)", "Moltres", "Mr. Fuji",
        "Muk (Alt)", "Muk", "Mysterious Fossil", "Omanyte", "Omastar", "Psyduck", "Raichu (Alt)", "Raichu", "Recycle",
        "Sandslash", "Seadra", "Shellder", "Slowbro", "Slowpoke", "Tentacool", "Tentacruel", "Weezing", "Zapdos (Alt)",
        "Zapdos", "Zubat" },

    ["Rocket"] = {
        "Challenge", "Charmander", "Dark Alakazam (Alt)", "Dark Alakazam", "Dark Arbok (Alt)", "Dark Arbok",
        "Dark Blastoise (Alt)", "Dark Blastoise", "Dark Charizard (Alt)", "Dark Charizard", "Dark Charmeleon",
        "Dark Dragonair", "Dark Dragonite (Alt)", "Dark Dragonite", "Dark Dugtrio (Alt)", "Dark Dugtrio",
        "Dark Electrode", "Dark Flareon", "Dark Gloom", "Dark Golbat (Alt)", "Dark Golbat", "Dark Golduck",
        "Dark Gyarados (Alt)", "Dark Gyarados", "Dark Hypno (Alt)", "Dark Hypno", "Dark Jolteon", "Dark Kadabra",
        "Dark Machamp (Alt)", "Dark Machamp", "Dark Machoke", "Dark Magneton (Alt)", "Dark Magneton", "Dark Muk",
        "Dark Persian", "Dark Primeape", "Dark Raichu", "Dark Rapidash", "Dark Raticate", "Dark Slowbro (Alt)",
        "Dark Slowbro", "Dark Vaporeon", "Dark Vileplume (Alt)", "Dark Vileplume", "Dark Wartortle",
        "Dark Weezing (Alt)", "Dark Weezing", "Digger", "Diglett", "Dratini", "Drowzee", "Eevee", "Ekans",
        "filename", "Full Heal Energy", "Goop Gas Attack", "Grimer", "Here Comes Team Rocket (Alt)",
        "Here Comes Team Rocket", "Imposter Oaks Revenge", "Koffing", "Machop", "Magikarp", "Magnemite", "Mankey",
        "Meowth", "Nightly Garbage Run", "Oddish", "Ponyta", "Porygon", "Potion Energy", "Psyduck",
        "Rainbow Energy (Alt)", "Rainbow Energy", "Rattata", "Rockets Sneak Attack (Alt)", "Rockets Sneak Attack",
        "Sleep", "Slowpoke", "Squirtle", "The Bosss Way", "Voltorb", "Zubat" },

}

--Pokemon.tradingCards = {}
Pokemon.cardByType = {}
Pokemon.cardByRarity = {}
Pokemon.cardSets = {}
-- Grass, Fire, Water, Lightning, Fighting, Psychic, Colorless, Trainer
Pokemon.cardData = {}

function Pokemon.generatePokemonCards()
    for set,rarities in pairs(Pokemon.cardData) do
        Pokemon.cardSets[set] = {}
        for rarity,cards in pairs(rarities) do
            for card,type in pairs(cards) do
                local cardID = set.." "..card
                table.insert(Pokemon.cardSets[set], cardID)
                Pokemon.cardByType[cardID] = type
                Pokemon.cardByRarity[cardID] = rarity
            end
        end
    end
end
Events.OnGameBoot.Add(Pokemon.generatePokemonCards)

-- Base Set
Pokemon.cardData["Base"] = {
    rare = {
        ["Alakazam"]="Psychic", ["Beedrill"]="Grass", ["Blastoise"]="Water", ["Chansey"]="Colorless", 
        ["Charizard"]="Fire", ["Clefairy Doll"]="Trainer", ["Clefairy"]="Fairy", ["Computer Search"]="Trainer",
        ["Devolution Spray"]="Trainer", ["Dragonair"]="Dragon", ["Dugtrio"]="Fighting", ["Electabuzz"]="Lightning", 
        ["Electrode"]="Lightning", ["Gyarados"]="Water", ["Hitmonchan"]="Fighting", ["Impostor Professor Oak"]="Trainer", 
        ["Item Finder"]="Trainer", ["Lass"]="Trainer", ["Machamp"]="Fighting", ["Magneton"]="Metal", ["Mewtwo"]="Psychic", 
        ["Nidoking"]="Grass", ["Ninetales"]="Fire", ["Pidgeotto"]="Colorless", ["Pokemon Breeder"]="Trainer", 
        ["Pokemon Trader"]="Trainer", ["Poliwrath"]="Water", ["Raichu"]="Lightning", ["Scoop Up"]="Trainer", 
        ["Super Energy Removal"]="Trainer", ["Venusaur"]="Grass", ["Zapdos"]="Lightning",
    },

    uncommon = {
        ["Arcanine"]="Fire", ["Charmeleon"]="Fire", ["Defender"]="Trainer", ["Dewgong"]="Water", 
        ["Double Colorless Energy"]="Colorless", ["Dratini"]="Dragon", ["Energy Retrieval"]="Trainer", ["Farfetchd"]="Colorless", 
        ["Full Heal"]="Trainer", ["Growlithe"]="Fire", ["Haunter"]="Psychic", ["Ivysaur"]="Grass", ["Jynx"]="Psychic", 
        ["Kadabra"]="Psychic", ["Kakuna"]="Grass", ["Machoke"]="Fighting", ["Magikarp"]="Water", ["Magmar"]="Fire", 
        ["Maintenance"]="Trainer", ["Nidorino"]="Grass", ["Pluspower"]="Trainer", ["Pokedex"]="Trainer", 
        ["Pokemon Center"]="Trainer", ["Pokemon Flute"]="Trainer", ["Poliwhirl"]="Water", ["Porygon"]="Colorless", 
        ["Professor Oak"]="Trainer", ["Raticate"]="Colorless", ["Revive"]="Trainer", ["Seel"]="Water", 
        ["Super Potion"]="Trainer", ["Wartortle"]="Water",
    },

    common = {
        ["Abra"]="Psychic", ["Bill"]="Trainer", ["Bulbasaur"]="Grass", ["Caterpie"]="Grass", ["Diglett"]="Ground", 
        ["Doduo"]="Colorless", ["Drowzee"]="Psychic", ["Energy Removal"]="Trainer", ["Gastly"]="Psychic",
        ["Gust Of Wind"]="Trainer", ["Koffing"]="Grass", ["Machop"]="Fighting", ["Magnemite"]="Metal", ["Metapod"]="Grass", 
        ["Nidoran (Male)"]="Grass", ["Onix"]="Fighting", ["Pidgey"]="Colorless", ["Pikachu"]="Lightning", ["Poliwag"]="Water", 
        ["Ponyta"]="Fire", ["Potion"]="Trainer", ["Rattata"]="Colorless", ["Sandshrew"]="Fighting", ["Squirtle"]="Water", 
        ["Starmie"]="Water", ["Staryu"]="Water", ["Tangela"]="Grass", ["Voltorb"]="Lightning", ["Vulpix"]="Fire", ["Weedle"]="Grass",
    },

    energy = {
        ["Fighting Energy"]="Fighting", ["Fire Energy"]="Fire", ["Grass Energy"]="Grass", 
        ["Lightning Energy"]="Lightning", ["Psychic Energy"]="Psychic", ["Water Energy"]="Water",
    },
}


-- Jungle Set
Pokemon.cardData["Jungle"] = {
    rare = {
    },

    uncommon = {
    },

    common = {
    },

    energy = {
    },
}

-- Fossil Set
Pokemon.cardData["Fossil"] = {
    rare = {
    },

    uncommon = {
    },

    common = {
    },

    energy = {
    },
}




--[[

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

    local colorString = ""
    for i,c in ipairs(colors) do colorString = colorString..c..((#colors>1 and i~=#colors) and "/" or "") end
    local rarities = {Common=0, Uncommon = 0, Rare =0}
    --avg goal of 6 artifacts
    --11 instead of 10 skews the average lower
    local artifactGoal = math.floor(deckSize/11)+ZombRand(3) -- 0 to 2 additional
    for i=1, artifactGoal do
        local rarity = applyItemDetails.MTG.weighedProbability({ Uncommon = 3, Rare = 1})
        rarities[rarity] = rarities[rarity]+1
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
        rarities[rarity] = rarities[rarity]+1
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

--]]
