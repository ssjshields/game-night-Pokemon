local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

gamePieceAndBoardHandler.registerTypes({ "Base.PokemonDice" })
gamePieceAndBoardHandler.registerSpecial("Base.PokemonDice", { addTextureDir = "dice/", noRotate=true, actions = { rollDie=6, placeDieOnSide=10 }, shiftAction = "rollDie", })


local Pokemon = {}


Pokemon.Tokens = {}

Pokemon.Tokens.types = {
    Pkmn_baseCoinFlipped = {"AerodactylCoin", "ChanseyCoin", "EeveeCoin", "VileplumeCoin",},
    Pkmn_base2CoinFlipped = {"PikachuCoin", "MeowthCoin", "StarmieCoin",}
}

Pokemon.Tokens.typesToRegister = {"Base.MetalPikachuCoin","Base.PokemonStatusCoin"}
for typeID, coins in pairs(Pokemon.Tokens.types) do
    for _,coin in pairs(coins) do
        table.insert(Pokemon.Tokens.typesToRegister, "Base."..coin)
        gamePieceAndBoardHandler.registerSpecial("Base."..coin, {
            alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
            actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState=typeID, shiftAction = "coinFlip",
        })
    end
end
gamePieceAndBoardHandler.registerTypes(Pokemon.Tokens.typesToRegister)

gamePieceAndBoardHandler.registerSpecial("Base.pokemonBoosterPack", {nonGamePieceOnApplyDetails = "applyBoosterPackType"})
gamePieceAndBoardHandler.registerSpecial("Base.pokemonStarterKit", {nonGamePieceOnApplyDetails = "applyStarterKitType"})

gamePieceAndBoardHandler.registerSpecial("Base.PokemonStatusCoin", {
    alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
    actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState="PokemonStatusCoinFlipped", shiftAction = "coinFlip",
})

gamePieceAndBoardHandler.registerSpecial("Base.MetalPikachuCoin", {
    alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
    actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState="MetalPikachuCoinFlipped", shiftAction = "coinFlip",
})


Pokemon.tradingCards = {}
Pokemon.altIcons = {}
Pokemon.altNames = {}

Pokemon.cardByType = {}
Pokemon.cardByRarity = {}
Pokemon.cardSets = {}
Pokemon.cardDecks = {}
-- Grass, Fire, Water, Lightning, Fighting, Psychic, Colorless, Trainer
Pokemon.cardData = {}

function Pokemon.generatePokemonCards()
    for set,rarities in pairs(Pokemon.cardData) do
        table.insert(Pokemon.cardSets, set)
        Pokemon.cardByRarity[set] = {}
        for rarity,cards in pairs(rarities) do
            Pokemon.cardByRarity[set][rarity] = {}

            local tmpCount = 0
            for card,type in pairs(cards) do
                tmpCount = tmpCount + 1
                local cardID = card.." ("..set..")"
                Pokemon.cardByType[cardID] = type
                table.insert(Pokemon.cardByRarity[set][rarity], cardID)
                table.insert(Pokemon.tradingCards, cardID)

                Pokemon.altIcons[cardID] = set.."/"..cardID
                --Pokemon.altNames[cardID] = card
            end
        end
    end

    for deckID,cards in pairs(Pokemon.Decks) do table.insert(Pokemon.cardDecks, deckID) end

    deckActionHandler.addDeck("pokemonCards", Pokemon.tradingCards, nil, Pokemon.altIcons)

    gamePieceAndBoardHandler.registerSpecial("Base.pokemonCards", {
        actions = { examine=true}, examineScale = 0.75, applyCards = "applyCardForPokemon", textureSize = {100,140}
    })
end
Events.OnGameBoot.Add(Pokemon.generatePokemonCards)

-- Base Set
Pokemon.cardData["Base"] = {

    rareHolo = {
        ["Alakazam (Holo)"] = "Psychic", ["Blastoise (Holo)"] = "Water", ["Chansey (Holo)"] = "Colorless", ["Charizard (Holo)"] = "Fire",
        ["Clefairy (Holo)"] = "Colorless", ["Gyarados (Holo)"] = "Water", ["Hitmonchan (Holo)"] = "Fighting", ["Machamp (Holo)"] = "Fighting",
        ["Magneton (Holo)"] = "Lightning", ["Mewtwo (Holo)"] = "Psychic", ["Nidoking (Holo)"] = "Grass", ["Ninetales (Holo)"] = "Fire",
        ["Poliwrath (Holo)"] = "Water", ["Raichu (Holo)"] = "Lightning", ["Venusaur (Holo)"] = "Grass", ["Zapdos (Holo)"] = "Lightning"
    },

    rare = {
        ["Beedrill"] = "Grass", ["Dragonair"] = "Colorless", ["Dugtrio"] = "Fighting", ["Electabuzz"] = "Lightning",
        ["Electrode"] = "Lightning", ["Pidgeotto"] = "Colorless", ["Clefairy Doll"] = "Trainer",
        ["Computer Search"] = "Trainer", ["Devolution Spray"] = "Trainer", ["Impostor Professor Oak"] = "Trainer",
        ["Item Finder"] = "Trainer", ["Lass"] = "Trainer", ["Pokemon Breeder"] = "Trainer",
        ["Pokemon Trader"] = "Trainer", ["Scoop Up"] = "Trainer", ["Super Energy Removal"] = "Trainer"
    },

    uncommon = {
        ["Arcanine"] = "Fire", ["Charmeleon"] = "Fire", ["Dewgong"] = "Water", ["Dratini"] = "Colorless",
        ["Farfetch'd"] = "Colorless", ["Growlithe"] = "Fire", ["Haunter"] = "Psychic", ["Ivysaur"] = "Grass",
        ["Jynx"] = "Psychic", ["Kadabra"] = "Psychic", ["Kakuna"] = "Grass", ["Machoke"] = "Fighting",
        ["Magikarp"] = "Water", ["Magmar"] = "Fire", ["Nidorino"] = "Grass", ["Poliwhirl"] = "Water",
        ["Porygon"] = "Colorless", ["Raticate"] = "Colorless", ["Seel"] = "Water", ["Wartortle"] = "Water",
        ["Defender"] = "Trainer", ["Energy Retrieval"] = "Trainer", ["Full Heal"] = "Trainer",
        ["Maintenance"] = "Trainer", ["PlusPower"] = "Trainer", ["Pokemon Center"] = "Trainer",
        ["Pokemon Flute"] = "Trainer", ["Pokedex"] = "Trainer", ["Professor Oak"] = "Trainer",
        ["Revive"] = "Trainer", ["Super Potion"] = "Trainer"
    },

    common = {
        ["Abra"] = "Psychic", ["Bulbasaur"] = "Grass", ["Caterpie"] = "Grass", ["Charmander"] = "Fire",
        ["Diglett"] = "Fighting", ["Doduo"] = "Colorless", ["Drowzee"] = "Psychic", ["Gastly"] = "Psychic",
        ["Koffing"] = "Grass", ["Machop"] = "Fighting", ["Magnemite"] = "Lightning", ["Metapod"] = "Grass",
        ["Nidoran (Male)"] = "Grass", ["Onix"] = "Fighting", ["Pidgey"] = "Colorless", ["Pikachu"] = "Lightning",
        ["Poliwag"] = "Water", ["Ponyta"] = "Fire", ["Rattata"] = "Colorless", ["Sandshrew"] = "Fighting",
        ["Squirtle"] = "Water", ["Starmie"] = "Water", ["Staryu"] = "Water", ["Tangela"] = "Grass",
        ["Voltorb"] = "Lightning", ["Vulpix"] = "Fire", ["Weedle"] = "Grass", ["Bill"] = "Trainer",
        ["Energy Removal"] = "Trainer", ["Gust of Wind"] = "Trainer", ["Potion"] = "Trainer",
        ["Switch"] = "Trainer", ["Double Colorless Energy"] = "Colorless",
    --}, energy = {
        ["Fighting Energy"] = "Fighting", ["Fire Energy"] = "Fire", ["Grass Energy"] = "Grass",
        ["Lightning Energy"] = "Lightning", ["Psychic Energy"] = "Psychic", ["Water Energy"] = "Water"
    },
}

-- Jungle Set

Pokemon.cardData["Jungle"] = {
    rareHolo = {
        ["Clefable (Holo)"] = "Colorless", ["Electrode (Holo)"] = "Lightning", ["Flareon (Holo)"] = "Fire", ["Jolteon (Holo)"] = "Lightning",
        ["Kangaskhan (Holo)"] = "Colorless", ["Mr. Mime (Holo)"] = "Psychic", ["Nidoqueen (Holo)"] = "Grass", ["Pidgeot (Holo)"] = "Colorless",
        ["Pinsir (Holo)"] = "Grass", ["Scyther (Holo)"] = "Grass", ["Snorlax (Holo)"] = "Colorless", ["Vaporeon (Holo)"] = "Water",
        ["Venomoth (Holo)"] = "Grass", ["Victreebel (Holo)"] = "Grass", ["Vileplume (Holo)"] = "Grass", ["Wigglytuff (Holo)"] = "Colorless"
    },

    rare = {
        ["Clefable"] = "Colorless", ["Electrode"] = "Lightning", ["Flareon"] = "Fire", ["Jolteon"] = "Lightning",
        ["Kangaskhan"] = "Colorless", ["Mr. Mime"] = "Psychic", ["Nidoqueen"] = "Grass", ["Pidgeot"] = "Colorless",
        ["Pinsir"] = "Grass", ["Scyther"] = "Grass", ["Snorlax"] = "Colorless", ["Vaporeon"] = "Water",
        ["Venomoth"] = "Grass", ["Victreebel"] = "Grass", ["Vileplume"] = "Grass", ["Wigglytuff"] = "Colorless"
    },

    uncommon = {
        ["Butterfree"] = "Grass", ["Dodrio"] = "Colorless", ["Exeggutor"] = "Grass", ["Fearow"] = "Colorless",
        ["Gloom"] = "Grass", ["Lickitung"] = "Colorless", ["Marowak"] = "Fighting", ["Nidorina"] = "Grass",
        ["Parasect"] = "Grass", ["Persian"] = "Colorless", ["Primeape"] = "Fighting", ["Rapidash"] = "Fire",
        ["Rhydon"] = "Fighting", ["Seaking"] = "Water", ["Tauros"] = "Colorless", ["Weepinbell"] = "Grass"
    },

    common = {
        ["Bellsprout"] = "Grass", ["Cubone"] = "Fighting", ["Eevee"] = "Colorless", ["Exeggcute"] = "Grass",
        ["Goldeen"] = "Water", ["Jigglypuff"] = "Colorless", ["Mankey"] = "Fighting", ["Meowth"] = "Colorless",
        ["Nidoran (Female)"] = "Grass", ["Oddish"] = "Grass", ["Paras"] = "Grass", ["Pikachu"] = "Lightning",
        ["Rhyhorn"] = "Fighting", ["Spearow"] = "Colorless", ["Venonat"] = "Grass", ["Poke Ball"] = "Trainer"
    },
}

-- Fossil Set
Pokemon.cardData["Fossil"] = {
    rareHolo = {
        ["Aerodactyl (Holo)"] = "Fighting", ["Articuno (Holo)"] = "Water", ["Ditto (Holo)"] = "Colorless", ["Dragonite (Holo)"] = "Colorless",
        ["Gengar (Holo)"] = "Psychic", ["Haunter (Holo)"] = "Psychic", ["Hitmonlee (Holo)"] = "Fighting", ["Hypno (Holo)"] = "Psychic",
        ["Kabutops (Holo)"] = "Fighting", ["Lapras (Holo)"] = "Water", ["Magneton (Holo)"] = "Lightning", ["Moltres (Holo)"] = "Fire",
        ["Muk (Holo)"] = "Grass", ["Raichu (Holo)"] = "Lightning", ["Zapdos (Holo)"] = "Lightning",
    },

    rare = {
        ["Aerodactyl"] = "Fighting", ["Articuno"] = "Water", ["Ditto"] = "Colorless", ["Dragonite"] = "Colorless",
        ["Gengar"] = "Psychic", ["Haunter"] = "Psychic", ["Hitmonlee"] = "Fighting", ["Hypno"] = "Psychic",
        ["Kabutops"] = "Fighting", ["Lapras"] = "Water", ["Magneton"] = "Lightning", ["Moltres"] = "Fire",
        ["Muk"] = "Grass", ["Raichu"] = "Lightning", ["Zapdos"] = "Lightning",
    },

    uncommon = {
        ["Arbok"] = "Grass", ["Cloyster"] = "Water", ["Gastly"] = "Psychic", ["Golbat"] = "Grass",
        ["Golduck"] = "Water", ["Golem"] = "Fighting", ["Graveler"] = "Fighting", ["Kingler"] = "Water",
        ["Magmar"] = "Fire", ["Omastar"] = "Water", ["Sandslash"] = "Fighting", ["Seadra"] = "Water",
        ["Slowbro"] = "Psychic", ["Tentacruel"] = "Water", ["Weezing"] = "Grass", ["Mr. Fuji"] = "Trainer",
    },

    common = {
        ["Ekans"] = "Grass", ["Geodude"] = "Fighting", ["Grimer"] = "Grass", ["Horsea"] = "Water",
        ["Kabuto"] = "Fighting", ["Krabby"] = "Water", ["Omanyte"] = "Water", ["Psyduck"] = "Water",
        ["Shellder"] = "Water", ["Slowpoke"] = "Psychic", ["Tentacool"] = "Water", ["Zubat"] = "Grass",
        ["Energy Search"] = "Trainer", ["Gambler"] = "Trainer", ["Mysterious Fossil"] = "Trainer",
        ["Recycle"] = "Trainer",
    },

}


Pokemon.cardData["Rocket"] = {

    rareHolo = {
        ["Dark Alakazam (Holo)"] = "Psychic", ["Dark Arbok (Holo)"] = "Grass", ["Dark Blastoise (Holo)"] = "Water",
        ["Dark Charizard (Holo)"] = "Fire", ["Dark Dragonite (Holo)"] = "Colorless", ["Dark Dugtrio (Holo)"] = "Fighting",
        ["Dark Golbat (Holo)"] = "Grass", ["Dark Gyarados (Holo)"] = "Water", ["Dark Hypno (Holo)"] = "Psychic",
        ["Dark Machamp (Holo)"] = "Fighting", ["Dark Magneton (Holo)"] = "Lightning", ["Dark Slowbro (Holo)"] = "Psychic",
        ["Dark Vileplume (Holo)"] = "Grass", ["Dark Weezing (Holo)"] = "Grass", ["Here Comes Team Rocket! (Holo)"] = "Trainer",
        ["Rocket's Sneak Attack (Holo)"] = "Trainer", ["Rainbow Energy (Holo)"] = "Rainbow", ["Dark Raichu (Holo)"] = "Lightning",
    },

    rare = {
        ["Rainbow Energy"] = "Rainbow", ["Rocket's Sneak Attack"] = "Trainer",
        ["Dark Alakazam"] = "Psychic", ["Dark Arbok"] = "Grass", ["Dark Blastoise"] = "Water",
        ["Dark Charizard"] = "Fire", ["Dark Dragonite"] = "Colorless", ["Dark Dugtrio"] = "Fighting",
        ["Dark Golbat"] = "Grass", ["Dark Gyarados"] = "Water", ["Dark Hypno"] = "Psychic",
        ["Dark Machamp"] = "Fighting", ["Dark Magneton"] = "Lightning", ["Dark Slowbro"] = "Psychic",
        ["Dark Vileplume"] = "Grass", ["Dark Weezing"] = "Grass", ["Here Comes Team Rocket!"] = "Trainer",
    },

    uncommon = {
        ["The Boss's Way"] = "Trainer", ["Imposter Oak's Revenge"] = "Trainer",
        ["Dark Charmeleon"] = "Fire", ["Dark Dragonair"] = "Colorless", ["Dark Electrode"] = "Lightning",
        ["Dark Flareon"] = "Fire", ["Dark Gloom"] = "Grass", ["Dark Golduck"] = "Water",
        ["Dark Jolteon"] = "Lightning", ["Dark Kadabra"] = "Psychic", ["Dark Machoke"] = "Fighting",
        ["Dark Muk"] = "Grass", ["Dark Persian"] = "Colorless", ["Dark Primeape"] = "Fighting",
        ["Dark Rapidash"] = "Fire", ["Dark Vaporeon"] = "Water", ["Dark Wartortle"] = "Water",
        ["Magikarp"] = "Water", ["Porygon"] = "Colorless", ["Digger"] = "Trainer", ["Challenge!"] = "Trainer",
        ["Potion Energy"] = "Colorless", ["Full Heal Energy"] = "Colorless", ["Nightly Garbage Run"] = "Trainer",
    },

    common = {
        ["Sleep!"] = "Trainer", ["Goop Gas Attack"] = "Trainer",
        ["Abra"] = "Psychic", ["Charmander"] = "Fire", ["Dark Raticate"] = "Colorless", ["Diglett"] = "Fighting",
        ["Dratini"] = "Colorless", ["Drowzee"] = "Psychic", ["Eevee"] = "Colorless", ["Ekans"] = "Grass",
        ["Grimer"] = "Grass", ["Koffing"] = "Grass", ["Machop"] = "Fighting", ["Magnemite"] = "Lightning",
        ["Mankey"] = "Fighting", ["Meowth"] = "Colorless", ["Oddish"] = "Grass", ["Ponyta"] = "Fire",
        ["Psyduck"] = "Water", ["Rattata"] = "Colorless", ["Slowpoke"] = "Psychic", ["Squirtle"] = "Water",
        ["Voltorb"] = "Lightning", ["Zubat"] = "Grass",
    },
}


Pokemon.cardData["Base 2"] = {
    rareHolo = {
        ["Alakazam (Holo)"] = "Psychic", ["Blastoise (Holo)"] = "Water", ["Chansey (Holo)"] = "Colorless", ["Charizard (Holo)"] = "Fire",
        ["Clefable (Holo)"] = "Colorless", ["Clefairy (Holo)"] = "Colorless", ["Gyarados (Holo)"] = "Water", ["Hitmonchan (Holo)"] = "Fighting",
        ["Magneton (Holo)"] = "Lightning", ["Mewtwo (Holo)"] = "Psychic", ["Nidoking (Holo)"] = "Grass", ["Nidoqueen (Holo)"] = "Grass",
        ["Ninetales (Holo)"] = "Fire", ["Pidgeot (Holo)"] = "Colorless", ["Poliwrath (Holo)"] = "Water", ["Raichu (Holo)"] = "Lightning",
        ["Scyther (Holo)"] = "Grass", ["Venusaur (Holo)"] = "Grass", ["Wigglytuff (Holo)"] = "Colorless", ["Zapdos (Holo)"] = "Lightning"
    },

    rare = {
        ["Beedrill"] = "Grass", ["Dragonair"] = "Colorless", ["Dugtrio"] = "Fighting", ["Electabuzz"] = "Lightning",
        ["Electrode"] = "Lightning", ["Kangaskhan"] = "Colorless", ["Mr. Mime"] = "Psychic", ["Pidgeotto"] = "Colorless",
        ["Pinsir"] = "Grass", ["Snorlax"] = "Colorless", ["Venomoth"] = "Grass", ["Victreebel"] = "Grass",
        ["Computer Search"] = "Trainer", ["Imposter Professor Oak"] = "Trainer", ["Item Finder"] = "Trainer",
        ["Lass"] = "Trainer", ["Pokemon Breeder"] = "Trainer", ["Pokemon Trader"] = "Trainer",
        ["Scoop Up"] = "Trainer", ["Super Energy Removal"] = "Trainer"
    },

    uncommon = {
        ["Arcanine"] = "Fire", ["Butterfree"] = "Grass", ["Charmeleon"] = "Fire", ["Dewgong"] = "Water",
        ["Dodrio"] = "Colorless", ["Dratini"] = "Colorless", ["Exeggutor"] = "Grass", ["Farfetch'd"] = "Colorless",
        ["Fearow"] = "Colorless", ["Growlithe"] = "Fire", ["Haunter"] = "Psychic", ["Ivysaur"] = "Grass",
        ["Jynx"] = "Psychic", ["Kadabra"] = "Psychic", ["Kakuna"] = "Grass", ["Lickitung"] = "Colorless",
        ["Machoke"] = "Fighting", ["Magikarp"] = "Water", ["Magmar"] = "Fire", ["Marowak"] = "Fighting",
        ["Nidorina"] = "Grass", ["Nidorino"] = "Grass", ["Parasect"] = "Grass", ["Persian"] = "Colorless",
        ["Poliwhirl"] = "Water", ["Raticate"] = "Colorless", ["Rhydon"] = "Fighting", ["Seaking"] = "Water",
        ["Seel"] = "Water", ["Tauros"] = "Colorless", ["Wartortle"] = "Water", ["Weepinbell"] = "Grass",
        ["Defender"] = "Trainer", ["Energy Retrieval"] = "Trainer", ["Full Heal"] = "Trainer",
        ["Maintenance"] = "Trainer", ["PlusPower"] = "Trainer", ["Pokemon Center"] = "Trainer",
        ["Pokedex"] = "Trainer", ["Professor Oak"] = "Trainer", ["Super Potion"] = "Trainer"
    },

    common = {
        ["Abra"] = "Psychic", ["Bellsprout"] = "Grass", ["Bulbasaur"] = "Grass", ["Caterpie"] = "Grass",
        ["Charmander"] = "Fire", ["Cubone"] = "Fighting", ["Diglett"] = "Fighting", ["Doduo"] = "Colorless",
        ["Drowzee"] = "Psychic", ["Exeggcute"] = "Grass", ["Gastly"] = "Psychic", ["Goldeen"] = "Water",
        ["Jigglypuff"] = "Colorless", ["Machop"] = "Fighting", ["Magnemite"] = "Lightning", ["Meowth"] = "Colorless",
        ["Metapod"] = "Grass", ["Nidoran (Female)"] = "Grass", ["Nidoran (Male)"] = "Grass", ["Onix"] = "Fighting",
        ["Paras"] = "Grass", ["Pidgey"] = "Colorless", ["Pikachu"] = "Lightning", ["Poliwag"] = "Water",
        ["Rattata"] = "Colorless", ["Rhyhorn"] = "Fighting", ["Sandshrew"] = "Fighting", ["Spearow"] = "Colorless",
        ["Squirtle"] = "Water", ["Starmie"] = "Water", ["Staryu"] = "Water", ["Tangela"] = "Grass",
        ["Venonat"] = "Grass", ["Voltorb"] = "Lightning", ["Vulpix"] = "Fire", ["Weedle"] = "Grass",
        ["Bill"] = "Trainer", ["Energy Removal"] = "Trainer", ["Gust of Wind"] = "Trainer", ["Poke Ball"] = "Trainer",
        ["Potion"] = "Trainer", ["Switch"] = "Trainer",
    --}, energy = {
        ["Double Colorless Energy"] = "Colorless", ["Fighting Energy"] = "Fighting",
        ["Fire Energy"] = "Fire", ["Grass Energy"] = "Grass", ["Lightning Energy"] = "Lightning",
        ["Psychic Energy"] = "Psychic", ["Water Energy"] = "Water"
    },
}


Pokemon.cardData["Gym Challenge"] = {
    rareHolo = {
        ["Blaine's Arcanine (Holo)"] = "Fire", ["Blaine's Charizard (Holo)"] = "Fire", ["Brock's Ninetales (Holo)"] = "Fire",
        ["Erika's Venusaur (Holo)"] = "Grass", ["Giovanni's Gyarados (Holo)"] = "Water", ["Giovanni's Machamp (Holo)"] = "Fighting",
        ["Giovanni's Nidoking (Holo)"] = "Grass", ["Giovanni's Persian (Holo)"] = "Colorless", ["Koga's Beedrill (Holo)"] = "Grass",
        ["Koga's Ditto (Holo)"] = "Colorless", ["Lt. Surge's Raichu (Holo)"] = "Lightning", ["Misty's Golduck (Holo)"] = "Water",
        ["Misty's Gyarados (Holo)"] = "Water", ["Rocket's Mewtwo (Holo)"] = "Psychic", ["Rocket's Zapdos (Holo)"] = "Lightning",
        ["Sabrina's Alakazam (Holo)"] = "Psychic", ["Blaine (Holo)"] = "Trainer", ["Giovanni (Holo)"] = "Trainer", ["Koga (Holo)"] = "Trainer",
        ["Sabrina (Holo)"] = "Trainer",
    },
    rare = {
        ["Blaine's Ninetales"] = "Fire", ["Brock's Dugtrio"] = "Fighting", ["Giovanni's Nidoqueen"] = "Grass",
        ["Giovanni's Pinsir"] = "Grass", ["Koga's Arbok"] = "Grass", ["Koga's Muk"] = "Grass", ["Koga's Pidgeotto"] = "Colorless",
        ["Lt. Surge's Jolteon"] = "Lightning", ["Sabrina's Gengar"] = "Psychic", ["Sabrina's Golduck"] = "Water",
        ["Blaine"] = "Trainer", ["Brock's Protection"] = "Trainer", ["Chaos Gym"] = "Trainer", ["Erika's Kindness"] = "Trainer",
        ["Giovanni"] = "Trainer", ["Giovanni's Last Resort"] = "Trainer", ["Koga"] = "Trainer", ["Lt. Surge's Secret Plan"] = "Trainer",
        ["Misty's Wish"] = "Trainer", ["Resistance Gym"] = "Trainer", ["Sabrina"] = "Trainer",
    },
    uncommon = {
        ["Blaine's Charmeleon"] = "Fire", ["Blaine's Dodrio"] = "Colorless", ["Blaine's Rapidash"] = "Fire",
        ["Brock's Graveler"] = "Fighting", ["Brock's Primeape"] = "Fighting", ["Brock's Sandslash"] = "Fighting",
        ["Brock's Vulpix"] = "Fire", ["Erika's Bellsprout"] = "Grass", ["Erika's Bulbasaur"] = "Grass",
        ["Erika's Clefairy"] = "Colorless", ["Erika's Ivysaur"] = "Grass", ["Giovanni's Machoke"] = "Fighting",
        ["Giovanni's Meowth 1"] = "Colorless", ["Giovanni's Nidorina"] = "Grass", ["Giovanni's Nidorino"] = "Grass",
        ["Koga's Golbat"] = "Grass", ["Koga's Kakuna"] = "Grass", ["Koga's Koffing 1"] = "Grass", ["Koga's Pidgey"] = "Colorless",
        ["Koga's Weezing"] = "Grass", ["Lt. Surge's Eevee"] = "Colorless", ["Lt. Surge's Electrode"] = "Lightning",
        ["Lt. Surge's Raticate"] = "Colorless", ["Misty's Dewgong"] = "Water", ["Sabrina's Haunter"] = "Psychic",
        ["Sabrina's Hypno"] = "Psychic", ["Sabrina's Jynx"] = "Psychic", ["Sabrina's Kadabra"] = "Psychic",
        ["Sabrina's Mr. Mime"] = "Psychic", ["Blaine's Quiz #2"] = "Trainer", ["Blaine's Quiz #3"] = "Trainer",
        ["Cinnabar City Gym"] = "Trainer", ["Fuchsia City Gym"] = "Trainer", ["Koga's Ninja Trick"] = "Trainer", ["Master Ball"] = "Trainer",
        ["Max Revive"] = "Trainer", ["Misty's Tears"] = "Trainer", ["Rocket's Minefield Gym"] = "Trainer", ["Rocket's Secret Experiment"] = "Trainer",
        ["Sabrina's Psychic Control"] = "Trainer", ["Saffron City Gym"] = "Trainer", ["Viridian City Gym"] = "Trainer",
    },
    common = {
        ["Blaine's Charmander"] = "Fire", ["Blaine's Doduo"] = "Colorless", ["Blaine's Growlithe"] = "Fire",
        ["Blaine's Mankey"] = "Fighting", ["Blaine's Ponyta"] = "Fire", ["Blaine's Rhyhorn"] = "Fighting",
        ["Blaine's Vulpix"] = "Fire", ["Brock's Diglett"] = "Fighting", ["Brock's Geodude"] = "Fighting",
        ["Erika's Jigglypuff"] = "Colorless", ["Erika's Oddish"] = "Grass", ["Erika's Paras"] = "Grass",
        ["Giovanni's Machop"] = "Fighting", ["Giovanni's Magikarp"] = "Water", ["Giovanni's Meowth 2"] = "Colorless",
        ["Giovanni's Nidoran (Female)"] = "Grass", ["Giovanni's Nidoran (Male)"] = "Grass", ["Koga's Ekans"] = "Grass",
        ["Koga's Grimer"] = "Grass", ["Koga's Koffing 2"] = "Grass", ["Koga's Pidgey"] = "Colorless", ["Koga's Tangela"] = "Grass",
        ["Koga's Weedle"] = "Grass", ["Koga's Zubat"] = "Grass", ["Lt. Surge's Pikachu"] = "Lightning",
        ["Lt. Surge's Rattata"] = "Colorless", ["Lt. Surge's Voltorb"] = "Lightning", ["Misty's Horsea"] = "Water",
        ["Misty's Magikarp"] = "Water", ["Misty's Poliwag"] = "Water", ["Misty's Psyduck"] = "Water", ["Misty's Seel"] = "Water",
        ["Misty's Staryu"] = "Water", ["Sabrina's Abra 1"] = "Psychic", ["Sabrina's Abra 2"] = "Psychic", ["Sabrina's Drowzee"] = "Psychic",
        ["Sabrina's Gastly 1"] = "Psychic", ["Sabrina's Gastly 2"] = "Psychic", ["Sabrina's Porygon"] = "Colorless",
        ["Sabrina's Psyduck"] = "Water", ["Fervor"] = "Trainer", ["Transparent Walls"] = "Trainer",
        ["Warp Point"] = "Trainer", ["Fighting Energy"] = "Fighting", ["Fire Energy"] = "Fire", ["Grass Energy"] = "Grass",
        ["Lightning Energy"] = "Lightning", ["Psychic Energy"] = "Psychic", ["Water Energy"] = "Water",
    }
}


Pokemon.cardData["Gym Heroes"] = {

    rareHolo = {
        ["Blaine's Moltres (Holo)"] = "Fire", ["Brock's Rhydon (Holo)"] = "Fighting", ["Erika's Clefable (Holo)"] = "Colorless",
        ["Erika's Dragonair (Holo)"] = "Colorless", ["Erika's Vileplume (Holo)"] = "Grass",
        ["Lt. Surge's Electabuzz (Holo)"] = "Lightning", ["Lt. Surge's Fearow (Holo)"] = "Colorless",
        ["Lt. Surge's Magneton (Holo)"] = "Lightning", ["Misty's Seadra (Holo)"] = "Water", ["Misty's Tentacruel (Holo)"] = "Water",
        ["Rocket's Hitmonchan (Holo)"] = "Fighting", ["Rocket's Moltres (Holo)"] = "Fire", ["Rocket's Scyther (Holo)"] = "Grass",
        ["Sabrina's Gengar (Holo)"] = "Psychic", ["Erika (Holo)"] = "Trainer", ["Lt. Surge (Holo)"] = "Trainer",
        ["Misty (Holo)"] = "Trainer", ["The Rocket's Trap (Holo)"] = "Trainer", ["Brock (Holo)"] = "Trainer",
    },

    rare = {
        ["Brock's Golem"] = "Fighting", ["Brock's Onix 1"] = "Fighting", ["Brock's Rhyhorn 1"] = "Fighting",
        ["Brock's Sandslash"] = "Fighting", ["Brock's Zubat 1"] = "Grass", ["Erika's Clefairy"] = "Colorless",
        ["Erika's Victreebel"] = "Grass", ["Lt. Surge's Raichu"] = "Lightning", ["Lt. Surge's Electabuzz"] = "Lightning",
        ["Misty's Cloyster"] = "Water", ["Misty's Goldeen 1"] = "Water",
        ["Misty's Poliwrath"] = "Water", ["Misty's Tentacool 1"] = "Water",
        ["Rocket's Snorlax"] = "Colorless", ["Sabrina's Venomoth"] = "Grass", ["Blaine's Quiz #1"] = "Trainer",
        ["Brock"] = "Trainer", ["Charity"] = "Trainer", ["Erika"] = "Trainer", ["Lt. Surge"] = "Trainer",
        ["Misty"] = "Trainer", ["No Removal Gym"] = "Trainer", ["The Rocket's Training Gym"] = "Trainer"
    },

    uncommon = {
        ["Blaine's Growlithe 1"] = "Fire", ["Blaine's Kangaskhan"] = "Colorless", ["Blaine's Magmar"] = "Fire",
        ["Brock's Geodude 1"] = "Fighting", ["Brock's Golbat"] = "Grass", ["Brock's Graveler"] = "Fighting",
        ["Brock's Lickitung"] = "Colorless", ["Erika's Dratini"] = "Colorless", ["Erika's Exeggcute 1"] = "Grass",
        ["Erika's Exeggutor"] = "Grass", ["Erika's Gloom 1"] = "Grass", ["Erika's Gloom 2"] = "Grass", ["Erika's Oddish 1"] = "Grass",
        ["Erika's Weepinbell 1"] = "Grass", ["Erika's Weepinbell 2"] = "Grass", ["Lt. Surge's Raticate"] = "Colorless",
        ["Lt. Surge's Spearow 1"] = "Colorless", ["Misty's Poliwhirl"] = "Water", ["Misty's Psyduck"] = "Water",
        ["Misty's Seaking"] = "Water", ["Misty's Starmie"] = "Water", ["Sabrina's Haunter"] = "Psychic",
        ["Sabrina's Jynx"] = "Psychic", ["Sabrina's Slowbro"] = "Psychic", ["Blaine's Last Resort"] = "Trainer",
        ["Brock's Training Method"] = "Trainer", ["Celadon City Gym"] = "Trainer", ["Cerulean City Gym"] = "Trainer",
        ["Erika's Maids"] = "Trainer", ["Erika's Perfume"] = "Trainer", ["Good Manners"] = "Trainer",
        ["Lt. Surge's Treaty"] = "Trainer", ["Minion of Team Rocket"] = "Trainer", ["Misty's Wrath"] = "Trainer",
        ["Pewter City Gym"] = "Trainer", ["Recall"] = "Trainer", ["Sabrina's ESP"] = "Trainer",
        ["Secret Mission"] = "Trainer", ["Tickling Machine"] = "Trainer", ["Vermilion City Gym"] = "Trainer",
        ["Misty's Tentacool 2"] = "Water", ["Lt. Surge's Magnemite 1"] = "Lightning",
    },

    common = {
        ["Blaine's Charmander"] = "Fire", ["Blaine's Growlithe 2"] = "Fire", ["Blaine's Ponyta"] = "Fire",
        ["Blaine's Tauros"] = "Colorless", ["Blaine's Vulpix"] = "Fire", ["Brock's Geodude 2"] = "Fighting",
        ["Brock's Mankey 1"] = "Fighting", ["Brock's Mankey 2"] = "Fighting", ["Brock's Onix 2"] = "Fighting",
        ["Brock's Rhyhorn 2"] = "Fighting", ["Brock's Sandshrew 1"] = "Fighting", ["Brock's Sandshrew 2"] = "Fighting",
        ["Brock's Vulpix"] = "Fire", ["Brock's Zubat 2"] = "Grass", ["Erika's Bellsprout 1"] = "Grass",
        ["Erika's Bellsprout 2"] = "Grass", ["Erika's Oddish 2"] = "Grass", ["Erika's Exeggcute 2"] = "Grass",
        ["Erika's Tangela"] = "Grass", ["Lt. Surge's Magnemite 2"] = "Lightning", ["Lt. Surge's Pikachu"] = "Lightning",
        ["Lt. Surge's Rattata"] = "Colorless", ["Lt. Surge's Spearow 2"] = "Colorless",
        ["Lt. Surge's Voltorb"] = "Lightning", ["Misty's Goldeen 2"] = "Water",
        ["Misty's Horsea"] = "Water", ["Misty's Poliwag"] = "Water", ["Misty's Seel"] = "Water", 
        ["Misty's Shellder"] = "Water", ["Misty's Staryu"] = "Water", ["Sabrina's Abra"] = "Psychic", 
        ["Sabrina's Drowzee"] = "Psychic", ["Sabrina's Gastly"] = "Psychic", ["Sabrina's Mr. Mime"] = "Psychic",
        ["Sabrina's Slowpoke"] = "Psychic", ["Sabrina's Venonat"] = "Grass", ["Blaine's Gamble"] = "Trainer",
        ["Energy Flow"] = "Trainer", ["Misty's Duel"] = "Trainer", ["Narrow Gym"] = "Trainer",
        ["Sabrina's Gaze"] = "Trainer", ["Trash Exchange"] = "Trainer",
    --, energy = {
        ["Fighting Energy"] = "Fighting", ["Fire Energy"] = "Fire", ["Grass Energy"] = "Grass",
        ["Lightning Energy"] = "Lightning", ["Psychic Energy"] = "Psychic", ["Water Energy"] = "Water"
    },
}

-- 1:3 packs are holo
-- 1 Rare card (which could be a Rare Holo or a non-foil Rare)
-- 3 Uncommon cards
-- 7 Common cards


applyItemDetails.pokemon = {}

function applyItemDetails.pokemon.rollCard(setID, rarity)
    if rarity == "rare" and ZombRand(3)==0 then rarity = "rareHolo" end

    local set = Pokemon.cardByRarity[setID]
    --if not set then return end
    local cards = set[rarity]
    if not cards and rarity == "rareHolo" then cards = Pokemon.cardByRarity[setID]["rare"] end
    if not cards then return end

    local card = cards[ZombRand(#cards)+1]
    if not card then return end

    return card
end



function applyItemDetails.pokemon.weighedProbability(outcomesAndWeights)
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


function applyItemDetails.pokemon.spawnRandomCard(zombie)
    local rare = zombie and 1 or 2
    local common = zombie and 7 or 5
    local rarity = applyItemDetails.pokemon.weighedProbability({ common=common, uncommon=3, rare=rare})
    local setID = Pokemon.cardSets[ZombRand(#Pokemon.cardSets)+1]
    local card = applyItemDetails.pokemon.rollCard(setID, rarity)
    return card
end


function applyItemDetails.pokemon.unpackBooster(setID)
    local cards = {}
    for i=1, 7 do
        local card = applyItemDetails.pokemon.rollCard(setID, "common")
        table.insert(cards, card)
    end

    for i=1, 3 do
        local card = applyItemDetails.pokemon.rollCard(setID, "uncommon")
        table.insert(cards, card)
    end

    for i=1, 1 do
        local card = applyItemDetails.pokemon.rollCard(setID, "rare")
        table.insert(cards, card)
    end

    return cards
end


---@param item InventoryItem
function applyItemDetails.applyBoosterPackType(item)
    local typeOf = item:getModData()["gameNight_specialOnCardApplyBooster"]
    if typeOf then return end
    local set = Pokemon.cardSets[ZombRand(#Pokemon.cardSets)+1]
    item:getModData()["gameNight_specialOnCardApplyBooster"] = set
    item:setName(item:getDisplayName().." ("..set..")")
end

function applyItemDetails.applyStarterKitType(item)
    local typeOf = item:getModData()["gameNight_specialOnCardApplyDeck"]
    if typeOf then return end
    local set = Pokemon.cardDecks[ZombRand(#Pokemon.cardDecks)+1]
    item:getModData()["gameNight_specialOnCardApplyDeck"] = set
    item:setName(item:getDisplayName().." ("..set..")")
end


function applyItemDetails.applyBoostersToPokemonCards(item, setID)
    setID = setID
    local cards = applyItemDetails.pokemon.unpackBooster(setID)
    item:getModData()["gameNight_cardDeck"] = cards
    item:getModData()["gameNight_cardFlipped"] = {}
    for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
end


function applyItemDetails.applyCardForPokemon(item)
    if not item:getModData()["gameNight_cardDeck"] then

        local applyBoosters = item:getModData()["gameNight_specialOnCardApplyBooster"] --or Pokemon.cardSets[ZombRand(#Pokemon.cardSets)+1]
        if applyBoosters then
            applyItemDetails.applyBoostersToPokemonCards(item, applyBoosters)
            item:getModData()["gameNight_specialOnCardApplyBooster"] = nil
            return
        end

        local wildDeck = false
        local applyDeck = item:getModData()["gameNight_specialOnCardApplyDeck"]

        if not applyDeck then
            local itemCont = item:getContainer()
            local zombie = itemCont and (itemCont:getType() == "inventorymale" or itemCont:getType() == "inventoryfemale")
            if (ZombRand(10) < 1) or zombie then
                local card = applyItemDetails.pokemon.spawnRandomCard(true)
                item:getModData()["gameNight_cardDeck"] = { card }
                item:getModData()["gameNight_cardFlipped"] = { true }
                item:getModData()["gameNight_specialOnCardApplyDeck"] = nil
            else
                wildDeck = true
                applyDeck = Pokemon.cardDecks[ZombRand(#Pokemon.cardDecks)+1]
            end
        end

        if applyDeck then

            local cards, coinType = Pokemon.buildDeck(applyDeck)
            if cards then
                item:getModData()["gameNight_cardDeck"] = cards
                item:getModData()["gameNight_cardFlipped"] = {}
                for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
            end
            item:getModData()["gameNight_specialOnCardApplyDeck"] = nil

            local container = item:getContainer()
            local worldItem = item:getWorldItem()
            local worldItemSq = worldItem and worldItem:getSquare()

            if wildDeck then
                for n=1, 4 do
                    local damageDice = InventoryItemFactory.CreateItem("Base.PokemonDice")
                    if damageDice and container then container:AddItem(damageDice) end
                    if damageDice and worldItemSq then worldItemSq:AddWorldInventoryItem(damageDice, 0, 0, 0) end

                    local statusCoin = InventoryItemFactory.CreateItem("Base.PokemonStatusCoin")
                    if statusCoin and container then container:AddItem(statusCoin) end
                    if statusCoin and worldItemSq then worldItemSq:AddWorldInventoryItem(statusCoin, 0, 0, 0) end
                end
            end

            local coin = coinType and InventoryItemFactory.CreateItem("Base."..coinType)
            if coin then
                if container then container:AddItem(coin) end
                if worldItemSq then worldItemSq:AddWorldInventoryItem(coin, 0, 0, 0) end
            end
        end

        gamePieceAndBoardHandler.refreshInventory(getPlayer())
    end
end


function Pokemon.buildDeck(deckID)
    local cards = {}
    local deckData = Pokemon.Decks[deckID]
    if not deckData then return end

    local set = deckData.set

    local cardIDs = deckData.cards
    if cardIDs then
        for card,numberOf in pairs(cardIDs) do
            local cardID = card.." ("..set..")"
            for n=1, numberOf do table.insert(cards, cardID) end
        end
    end

    --`outliers` are cards included in a deck from another set - only seems to be once case of this.
    ---See: Thunderstorm
    local outlierCards = deckData.outliers
    if outlierCards then
        for cardID,numberOf in pairs(outlierCards) do
            for n=1, numberOf do table.insert(cards, cardID) end
        end
    end

    local coinType = deckData.coin and "Base."..deckData.coin.."Coin"

    return cards, coinType
end


Pokemon.Decks = {

    ["2-Player Base Starter"] = {
        set = "Base",
        coin = "Eevee",
        cards = {
            ["Machamp (Holo)"] = 1, ["Diglett"] = 3, ["Machop"] = 4, ["Machoke"] = 2, ["Ponyta"] = 4,
            ["Charmander"] = 4, ["Charmeleon"] = 2, ["Growlithe"] = 1, ["Rattata"] = 2, ["Dratini"] = 1, ["Bill"] = 1,
            ["Energy Removal"] = 1, ["Energy Retrieval"] = 1, ["Gust of Wind"] = 1, ["Pokedex"] = 1, ["Potion"] = 2,
            ["Switch"] = 2, ["Fighting Energy"] = 14, ["Fire Energy"] = 14
        },
    },

    --Chansey Coin
    ["Blackout"] = {
        set = "Base",
        coin = "Chansey",
        cards = {
            ["Hitmonchan (Holo)"] = 1, ["Farfetch'd"] = 2, ["Wartortle"] = 2, ["Squirtle"] = 4, ["Staryu"] = 3,
            ["Onix"] = 3, ["Sandshrew"] = 3, ["Machoke"] = 2, ["Machop"] = 4, ["Super Energy Removal"] = 1,
            ["PlusPower"] = 1, ["Professor Oak"] = 1, ["Gust of Wind"] = 1, ["Energy Removal"] = 4,
            ["Fighting Energy"] = 16, ["Water Energy"] = 12
        }
    },

    ["Brushfire"] = {
        set = "Base",
        coin = "Chansey",
        cards = {
            ["Ninetales (Holo)"] = 1, ["Weedle"] = 4, ["Tangela"] = 2, ["Nidoran (Male)"] = 4, ["Arcanine"] = 1,
            ["Growlithe"] = 2, ["Charmeleon"] = 2, ["Vulpix"] = 2, ["Charmander"] = 4, ["Lass"] = 1, ["PlusPower"] = 1,
            ["Energy Retrieval"] = 2, ["Switch"] = 1, ["Potion"] = 3, ["Gust of Wind"] = 1, ["Energy Removal"] = 1,
            ["Grass Energy"] = 10, ["Fire Energy"] = 18
        }
    },

    ["Overgrowth"] = {
        set = "Base",
        coin = "Chansey",
        cards = {
            ["Gyarados (Holo)"] = 1, ["Magikarp"] = 2, ["Starmie"] = 3, ["Staryu"] = 4, ["Beedrill"] = 1,
            ["Kakuna"] = 2, ["Ivysaur"] = 2, ["Weedle"] = 4, ["Bulbasaur"] = 4, ["Potion"] = 1, ["Bill"] = 2,
            ["Super Potion"] = 2, ["Switch"] = 2, ["Gust of Wind"] = 2, ["Water Energy"] = 12, ["Grass Energy"] = 16,
        },

    },

    ["Zap!"] = {
        set = "Base",
        coin = "Chansey",
        cards = {
            ["Mewtwo (Holo)"] = 1, ["Kadabra"] = 1, ["Jynx"] = 2, ["Haunter"] = 2, ["Gastly"] = 3, ["Drowzee"] = 2,
            ["Abra"] = 3, ["Pikachu"] = 4, ["Magnemite"] = 3, ["Computer Search"] = 1, ["Defender"] = 1,
            ["Super Potion"] = 1, ["Professor Oak"] = 1, ["Switch"] = 2, ["Potion"] = 1, ["Gust of Wind"] = 2,
            ["Bill"] = 2, ["Lightning Energy"] = 12, ["Psychic Energy"] = 16
        },
    },

    --Vileplume Coin
    ["Power Reserve"] = {
        set = "Jungle",
        coin = "Vileplume",
        cards = {
            ["Kangaskhan (Holo)"] = 1, ["Oddish"] = 2, ["Nidoran (Female)"] = 4, ["Bellsprout"] = 4, ["Weepinbell"] = 2,
            ["Nidorina"] = 2, ["Gloom"] = 1,
        },

        outliers = {
            ["Abra (Base)"] = 4, ["Kadabra (Base)"] = 2, ["Jynx (Base)"] = 1, ["Switch (Base)"] = 1,
            ["Potion (Base)"] = 3, ["Gust of Wind (Base)"] = 2, ["Bill (Base)"] = 2, ["Pokedex (Base)"] = 1,
            ["Psychic Energy (Base)"] = 11, ["Grass Energy (Base)"] = 17
        }
    },


    ["Water Blast"] = {
        set = "Jungle",
        coin = "Vileplume",
        cards = {
            ["Vaporeon (Holo)"] = 1, ["Rhyhorn"] = 3, ["Meowth"] = 4, ["Eevee"] = 4, ["Rhydon"] = 1, ["Persian"] = 2,
        },

        outliers = {
            ["Poliwag (Base)"] = 4, ["Machop (Base)"] = 2, ["Seel (Base)"] = 1, ["Poliwhirl (Base)"] = 2,
            ["Switch (Base)"] = 1, ["Potion (Base)"] = 2, ["Gust of Wind (Base)"] = 2, ["Super Potion (Base)"] = 2,
            ["Professor Oak (Base)"] = 1, ["Water Energy (Base)"] = 14, ["Fighting Energy (Base)"] = 14
        }
    },


    --Aerodactyl Coin
    ["BodyGuard"] = {
        set = "Fossil",
        coin = "Aerodactyl",
        cards = {
            ["Muk (Holo)"] = 1, ["Geodude"] = 3, ["Graveler"] = 2, ["Grimer"] = 4, ["Zubat"] = 4, ["Golbat"] = 2,
        },

        outliers = {
            ["Onix (Base)"] = 1, ["Bulbasaur (Base)"] = 2, ["Koffing (Base)"] = 4, ["Potion (Base)"] = 4,
            ["Professor Oak (Base)"] = 2, ["Pokemon Center (Base)"] = 1, ["Super Potion (Base)"] = 2,
            ["Grass Energy (Base)"] = 16, ["Fighting Energy (Base)"] = 12
        }
    },

    ["LockDown"] = {
        set = "Fossil",
        coin = "Aerodactyl",
        cards = {
            ["Lapras (Holo)"] = 1, ["Magmar"] = 2, ["Horsea"] = 4, ["Seadra"] = 2, ["Krabby"] = 4, ["Kingler"] = 2,
            ["Gambler"] = 1, ["Energy Search"] = 1,
        },

        outliers = {
            ["Vulpix (Base)"] = 3, ["Ponyta (Base)"] = 3, ["Bill (Base)"] = 2, ["Switch (Base)"] = 2,
            ["Potion (Base)"] = 2, ["Super Potion (Base)"] = 2, ["Full Heal (Base)"] = 1,
            ["Fire Energy (Base)"] = 14, ["Water Energy (Base)"] = 14
        }
    },


    ["2-Player Base 2 Starter"] = {
        set = "Base 2",
        coin = "Eevee",
        cards = {
            ["Diglett"] = 3, ["Machop"] = 3, ["Machoke"] = 2, ["Seel"] = 2, ["Goldeen"] = 4,
            ["Seaking"] = 2, ["Staryu"] = 3, ["Meowth"] = 2, ["Doduo"] = 2, ["Dratini"] = 1, ["Bill"] = 1,
            ["Energy Removal"] = 2, ["Gust of Wind"] = 1, ["Poke Ball"] = 2, ["Pokedex"] = 1, ["Switch"] = 1,
            ["Fighting Energy"] = 14, ["Water Energy"] = 14
        },

        outliers = { ["Machamp (Holo) (Base)"] = 1, }
    },


    --Pikachu Coin
    ["Grass Chopper"] = {
        set = "Base 2",
        coin = "Pikachu",
        cards = {
            ["Clefairy (Holo)"] = 1, ["Nidoran (Male)"] = 2, ["Nidorina"] = 1, ["Nidoran (Female)"] = 3, ["Weepinbell"] = 2,
            ["Bellsprout"] = 4, ["Sandshrew"] = 4, ["Machoke"] = 2, ["Machop"] = 4, ["Energy Removal"] = 1,
            ["Super Energy Removal (Holo)"] = 1, ["Super Potion"] = 1, ["PlusPower"] = 2, ["Gust of Wind"] = 1,
            ["Potion"] = 3, ["Fighting Energy"] = 14, ["Grass Energy"] = 14
        }
    },

    ["Hot Water"] = {
        set = "Base 2",
        coin = "Pikachu",
        cards = {
            ["Poliwrath (Holo)"] = 1, ["Dodrio"] = 1, ["Doduo"] = 3, ["Magmar"] = 2, ["Charmeleon"] = 1,
            ["Charmander"] = 3, ["Goldeen"] = 3, ["Poliwhirl"] = 2, ["Poliwag"] = 4, ["Pokemon Trader"] = 1,
            ["Energy Retrieval"] = 2, ["Potion"] = 3, ["Poke Ball"] = 2, ["Energy Removal"] = 3, ["Gust of Wind"] = 1,
            ["Water Energy"] = 15, ["Fire Energy"] = 13
        }
    },

    ["Lightning Bug"] = {
        set = "Base 2",
        coin = "Pikachu",
        cards = {
            ["Chansey (Holo)"] = 1, ["Magnemite"] = 3, ["Pikachu"] = 4, ["Beedrill"] = 1, ["Kakuna"] = 2,
            ["Weedle"] = 4, ["Metapod"] = 1, ["Caterpie"] = 4, ["Pokedex"] = 1, ["PlusPower"] = 1, ["Defender"] = 2,
            ["Energy Retrieval"] = 2, ["Switch"] = 1, ["Gust of Wind"] = 2, ["Bill"] = 3, ["Grass Energy"] = 16,
            ["Lightning Energy"] = 12
        }
    },

    ["Psych Out"] = {
        set = "Base 2",
        coin = "Pikachu",
        cards = {
            ["Wigglytuff (Holo)"] = 1, ["Jigglypuff"] = 3, ["Jynx"] = 2, ["Drowzee"] = 2, ["Kadabra"] = 1, ["Abra"] = 3,
            ["Wartortle"] = 1, ["Squirtle"] = 4, ["Seel"] = 1, ["Starmie"] = 1, ["Staryu"] = 3, ["Computer Search"] = 1,
            ["Super Potion"] = 1, ["Potion"] = 1, ["Switch"] = 2, ["Defender"] = 2, ["Gust of Wind"] = 3,
            ["Water Energy"] = 15, ["Psychic Energy"] = 13
        }
    },


    --Meowth Coin
    ["Trouble"] = {
        set = "Rocket",
        coin = "Meowth",
        cards = {
            ["Dark Arbok (Holo)"] = 1, ["Meowth"] = 2, ["Ekans"] = 4, ["Drowzee"] = 3, ["Abra"] = 2,
            ["Dark Kadabra"] = 2, ["The Boss's Way"] = 1, ["Full Heal Energy"] = 1,
        },

        outliers = {
            ["Farfetch'd (Base)"] = 2, ["Weedle (Base)"] = 2, ["Kadabra (Base)"] = 1, ["Jynx (Base)"] = 1,
            ["Haunter (Base)"] = 1, ["Gastly (Base)"] = 2, ["Abra (Base)"] = 2, ["Switch (Base)"] = 1,
            ["Potion (Base)"] = 2, ["Gust of Wind (Base)"] = 1, ["Bill (Base)"] = 1, ["Grass Energy (Base)"] = 10,
            ["Psychic Energy (Base)"] = 18
        }
    },

    ["Devastation"] = {
        set = "Rocket",
        coin = "Meowth",
        cards = {
            ["Dark Weezing (Holo)"] = 1, ["Eevee"] = 3, ["Dark Wartortle"] = 1, ["Dark Vaporeon"] = 2,
            ["Oddish"] = 3, ["Koffing"] = 4, ["Dark Gloom"] = 1, ["Imposter Oak's Revenge"] = 1,

        },

        outliers = {
            ["Wartortle (Base)"] = 1, ["Squirtle (Base)"] = 3, ["Magikarp (Base)"] = 1, ["Weedle (Base)"] = 3,
            ["Tangela (Base)"] = 3, ["Super Potion (Base)"] = 1, ["Potion (Base)"] = 2, ["Gust of Wind (Base)"] = 1,
            ["Full Heal (Base)"] = 1, ["Water Energy (Base)"] = 10, ["Grass Energy (Base)"] = 18
        }
    },


    --Metal Pikachu Coin
    ["Thunderstorm"] = {
        set = "Base",
        coin = "MetalPikachu",
        cards = {
            ["Electabuzz"] = 1, ["Farfetch'd"] = 1, ["Doduo"] = 1, ["Magnemite"] = 2, ["Defender"] = 1,
            ["Energy Retrieval"] = 2, ["Professor Oak"] = 1, ["Super Potion"] = 1, ["Bill"] = 2, ["Potion"] = 1,
            ["Double Colorless Energy"] = 2, ["Lightning Energy"] = 16, ["Water Energy"] = 8,
        },

        outliers = {--Gym Heroes
            ["Lt. Surge's Voltorb (Gym Heroes)"] = 1, ["Misty's Wrath (Gym Heroes)"] = 1, ["Misty's Poliwag (Gym Heroes)"] = 1,
            ["Zapdos (Holo) (Fossil)"] = 1, ["Raichu (Holo) (Fossil)"] = 1, ["Golduck  (Fossil)"] = 1, ["Psyduck (Fossil)"] = 2, ["Energy Search (Fossil)"] = 2,
            ["Fearow (Jungle)"] = 1, ["Pikachu (Jungle)"] = 4, ["Spearow (Jungle)"] = 2,  ["Poke Ball (Jungle)"] = 1,
            ["Psyduck (Rocket)"] = 1, ["Full Heal Energy (Rocket)"] = 1, ["Potion Energy (Rocket)"] = 1,
        }
    },

    --Metal Pikachu Coin
    ["Tempest"] = {
        set = "Base",
        coin = "MetalPikachu",
        cards = {
            ["Electabuzz (Holo)"] = 1, ["Farfetch'd"] = 1,
            ["Doduo"] = 1, ["Magnemite"] = 2, ["Pidgey"] = 1, ["Defender"] = 1, ["Energy Retrieval"] = 2,
            ["Professor Oak"] = 1, ["Super Potion"] = 2, ["Bill"] = 2, ["Energy Removal"] = 1, ["Potion"] = 1,
            ["Double Colorless Energy"] = 2, ["Lightning Energy"] = 16, ["Water Energy"] = 8
        },

        outliers = {
            ["Zapdos (Holo) (Fossil)"] = 1, ["Raichu (Holo) (Fossil)"] = 1, ["Golduck (Fossil)"] = 1,  ["Psyduck (Fossil)"] = 3, ["Energy Search (Fossil)"] = 2,
            ["Fearow (Jungle)"] = 2, ["Pikachu (Jungle)"] = 4, ["Spearow (Jungle)"] = 4,
        }
    },


    --Starmie Coin
    ["Brock"] = {
        set = "Gym Heroes",
        coin = "Starmie",
        cards = {
            ["Brock's Rhydon (Holo)"] = 1, ["Brock's Sandshrew 2"] = 1, ["Brock's Sandshrew 1"] = 2, ["Brock's Rhyhorn 2"] = 3, ["Brock's Onix 2"] = 4,
            ["Brock's Mankey 1"] = 1, ["Brock's Mankey 2"] = 2, ["Brock's Geodude 2"] = 3, ["Brock's Lickitung"] = 1,
            ["Brock's Graveler"] = 1, ["Brock"] = 1, ["Brock's Training Method"] = 2, ["Pewter City Gym"] = 1, ["Fighting Energy"] = 28
        },
        outliers = {
            ["Bill (Base 2)"] = 1, ["Full Heal (Base 2)"] = 1, ["Potion (Base 2)"] = 3,
            ["Energy Retrieval (Base 2)"] = 2, ["Switch (Base 2)"] = 2,
        }
    },

    ["Misty"] = {
        set = "Gym Heroes",
        coin = "Starmie",
        cards = {
            ["Misty's Tentacruel (Holo)"] = 1, ["Misty's Psyduck"] = 2, ["Misty's Staryu"] = 4,
            ["Misty's Poliwag"] = 3, ["Misty's Horsea"] = 4, ["Misty's Tentacool 2"] = 2, ["Misty's Goldeen 2"] = 3,
            ["Misty's Starmie"] = 2, ["Misty's Poliwhirl"] = 1, ["Misty"] = 1, ["Cerulean City Gym"] = 1,
            ["Water Energy"] = 28
        },

        outliers = {
            ["Energy Removal (Base 2)"] = 2, ["Switch (Base 2)"] = 1,
            ["Potion (Base 2)"] = 2, ["Poke Ball (Base 2)"] = 3,
        }
    },

    ["Lt. Surge"] = {
        set = "Gym Heroes",
        coin = "Starmie",
        cards = {
            ["Lt. Surge's Magneton (Holo)"] = 1, ["Lt. Surge's Voltorb"] = 3, ["Lt. Surge's Magnemite 1"] = 2,
            ["Lt. Surge's Magnemite 2"] = 2, ["Lt. Surge's Rattata"] = 4, ["Lt. Surge's Raticate"] = 2,
            ["Lt. Surge's Spearow 1"] = 2, ["Lt. Surge's Spearow 2"] = 2, ["Lt. Surge's Pikachu"] = 4,
            ["Lt. Surge"] = 1, ["Vermilion City Gym"] = 1, ["Secret Mission"] = 2, ["Lightning Energy"] = 28
        },

        outliers = {
            ["Energy Removal (Base 2)"] = 1, ["Potion (Base 2)"] = 2,
            ["PlusPower (Base 2)"] = 1, ["Gust of Wind (Base 2)"] = 2,
        }
    },

    ["Erika"] = {
        set = "Gym Heroes",
        coin = "Starmie",
        cards = {
            ["Erika's Vileplume (Holo)"] = 1, ["Erika's Tangela"] = 4, ["Erika's Oddish 1"] = 2, ["Erika's Oddish 2"] = 2,
            ["Erika's Exeggcute 1"] = 1, ["Erika's Exeggcute 2"] = 2, ["Erika's Dratini"] = 1, ["Erika's Weepinbell 2"] = 1,
            ["Erika's Weepinbell 2"] = 1, ["Erika's Bellsprout 1"] = 2, ["Erika's Bellsprout 2"] = 2,
            ["Erika's Gloom 1"] = 1, ["Erika's Gloom 2"] = 1, ["Erika's Exeggutor"] = 1, ["Erika"] = 1,
            ["Erika's Perfume"] = 1, ["Celadon City Gym"] = 1, ["Grass Energy"] = 22, ["Psychic Energy"] = 6
        },

        outliers = {
            ["Potion (Base 2)"] = 2, ["Poke Ball (Base 2)"] = 2, ["Switch (Base 2)"] = 3,
        }
    },

    ["Sabrina"] = {
        set = "Gym Challenge",
        coin = "Starmie",
        cards = {
            ["Sabrina's Alakazam (Holo)"] = 1, ["Sabrina's Porygon"] = 3, ["Sabrina's Drowzee"] = 3,
            ["Sabrina's Gastly"] = 4, ["Sabrina's Kadabra"] = 2, ["Sabrina's Abra"] = 4, ["Sabrina's Jynx"] = 2,
            ["Sabrina's Haunter"] = 2, ["Sabrina"] = 1, ["Potion"] = 2, ["Sabrina's Gaze"] = 2,
            ["Sabrina's Psychic Control"] = 1, ["Saffron City Gym"] = 1, ["Psychic Energy"] = 28
        },

        outliers = {
            ["Bill (Base 2)"] = 2, ["Switch (Base 2)"] = 2,
        }
    },

    ["Koga"] = {
        set = "Gym Challenge",
        coin = "Starmie",
        cards = {
            ["Koga's Beedrill (Holo)"] = 1, ["Koga's Ekans"] = 3, ["Koga's Pidgey"] = 3, ["Koga's Weezing"] = 2,
            ["Koga's Kakuna"] = 2, ["Koga's Koffing 1"] = 1, ["Koga's Koffing 2"] = 3, ["Koga's Weedle"] = 4, ["Koga's Grimer"] = 3, ["Koga"] = 1,
            ["Fuchsia City Gym"] = 1, ["Grass Energy"] = 28
        },

        outliers = {
            ["Energy Removal (Base 2)"] = 1, ["Gust of Wind (Base 2)"] = 2, ["Potion (Base 2)"] = 3,
            ["Full Heal (Base 2)"] = 1, ["PlusPower (Base 2)"] = 1,
        }
    },

    ["Blaine"] = {
        set = "Gym Challenge",
        coin = "Starmie",
        cards = {
            ["Blaine's Arcanine (Holo)"] = 1, ["Blaine's Growlithe"] = 2, ["Blaine's Charmeleon"] = 2,
            ["Blaine's Doduo"] = 2, ["Blaine's Ponyta"] = 4, ["Blaine's Charmander"] = 3, ["Blaine's Vulpix"] = 2,
            ["Blaine's Dodrio"] = 1, ["Blaine's Rapidash"] = 2, ["Blaine"] = 1, ["Fervor"] = 2,
            ["Cinnabar City Gym"] = 1, ["Fire Energy"] = 28, ["Max Revive"] = 1,
        },

        outliers = {
            ["Bill (Base 2)"] = 2, ["Potion (Base 2)"] = 2, ["Super Potion (Base 2)"] = 1,
            ["Blaine's Gamble (Gym Heroes)"] = 1, ["Blaine's Growlithe 2 (Gym Heroes)"] = 2,
        }
    },

    ["Giovanni"] = {
        set = "Gym Challenge",
        coin = "Starmie",
        cards = {
            ["Giovanni's Persian (Holo)"] = 1, ["Giovanni's Nidoran (Female)"] = 3, ["Giovanni's Nidorina"] = 1,
            ["Giovanni's Meowth 1"] = 1, ["Giovanni's Nidoran (Male)"] = 4, ["Giovanni's Machop"] = 4,
            ["Giovanni's Nidorino"] = 2, ["Giovanni's Machoke"] = 2, ["Giovanni"] = 1, ["Warp Point"] = 2,
            ["Viridian City Gym"] = 1, ["Giovanni's Meowth 2"] = 3,
            ["Fighting Energy"] = 8, ["Grass Energy"] = 20
        },

        outliers = {
            ["Energy Removal (Base 2)"] = 2, ["Bill (Base 2)"] = 2, ["Potion (Base 2)"] = 2, ["Full Heal (Base 2)"] = 1,
        }
    },
}