local applyItemDetails = require "gameNight - applyItemDetails"
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceAndBoardHandler = applyItemDetails.gamePieceAndBoardHandler

local Pokemon = {}

Pokemon.catalogue = {}
Pokemon.altNames = {}

Pokemon.tradingCards = {}
Pokemon.altIcons = {}
Pokemon.altNames = {}

Pokemon.cardByType = {}
Pokemon.cardByRarity = {}
Pokemon.cardSets = {}
-- Grass, Fire, Water, Lightning, Fighting, Psychic, Colorless, Trainer
Pokemon.cardData = {}

function Pokemon.generatePokemonCards()
    for set,rarities in pairs(Pokemon.cardData) do
        table.insert(Pokemon.cardSets, set)
        Pokemon.cardByRarity[set] = {}
        for rarity,cards in pairs(rarities) do
            Pokemon.cardByRarity[set][rarity] = {}
            for card,type in pairs(cards) do
                local cardID = card.." ("..set..")"
                Pokemon.cardByType[cardID] = type
                table.insert(Pokemon.cardByRarity[set][rarity], cardID)
                table.insert(Pokemon.tradingCards, cardID)

                Pokemon.altIcons[cardID] = set.."/"..cardID
                --Pokemon.altNames[cardID] = card
            end
        end
    end

    deckActionHandler.addDeck("pokemonCards", Pokemon.tradingCards, nil, Pokemon.altIcons)

    gamePieceAndBoardHandler.registerSpecial("Base.pokemonCards", {
        actions = { examineCard=true}, examineScale = 0.75, applyCards = "applyCardForPokemon", textureSize = {100,140}
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
        ["Computer Search"] = "Trainer", ["Devolution Spray"] = "Trainer", ["Imposter Professor Oak"] = "Trainer",
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
        ["Slowbro"] = "Psychic", ["Tentacruel"] = "Water", ["Weezing"] = "Grass",
    },

    common = {
        ["Ekans"] = "Grass", ["Geodude"] = "Fighting", ["Grimer"] = "Grass", ["Horsea"] = "Water",
        ["Kabuto"] = "Fighting", ["Krabby"] = "Water", ["Omanyte"] = "Water", ["Psyduck"] = "Water",
        ["Shellder"] = "Water", ["Slowpoke"] = "Psychic", ["Tentacool"] = "Water", ["Zubat"] = "Grass",
    },

}


Pokemon.cardData["Rocket"] = {

    rareHolo = {
        ["Rainbow Energy (Holo)"] = "Rainbow",
        ["Dark Alakazam (Holo)"] = "Psychic", ["Dark Arbok (Holo)"] = "Grass", ["Dark Blastoise (Holo)"] = "Water",
        ["Dark Charizard (Holo)"] = "Fire", ["Dark Dragonite (Holo)"] = "Colorless", ["Dark Dugtrio (Holo)"] = "Fighting",
        ["Dark Golbat (Holo)"] = "Grass", ["Dark Gyarados (Holo)"] = "Water", ["Dark Hypno (Holo)"] = "Psychic",
        ["Dark Machamp (Holo)"] = "Fighting", ["Dark Magneton (Holo)"] = "Lightning", ["Dark Slowbro (Holo)"] = "Psychic",
        ["Dark Vileplume (Holo)"] = "Grass", ["Dark Weezing (Holo)"] = "Grass", ["Here Comes Team Rocket! (Holo)"] = "Trainer",
        ["Rocket's Sneak Attack (Holo)"] = "Trainer", ["Rainbow Energy (Holo)"] = "Rainbow",
    },

    rare = {
        ["Rainbow Energy"] = "Rainbow",
        ["Dark Alakazam"] = "Psychic", ["Dark Arbok"] = "Grass", ["Dark Blastoise"] = "Water",
        ["Dark Charizard"] = "Fire", ["Dark Dragonite"] = "Colorless", ["Dark Dugtrio"] = "Fighting",
        ["Dark Golbat"] = "Grass", ["Dark Gyarados"] = "Water", ["Dark Hypno"] = "Psychic",
        ["Dark Machamp"] = "Fighting", ["Dark Magneton"] = "Lightning", ["Dark Slowbro"] = "Psychic",
        ["Dark Vileplume"] = "Grass", ["Dark Weezing"] = "Grass",
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
        ["Sabrina (Holo)"] = "Trainer"
    },
    rare = {
        ["Blaine"] = "Trainer", ["Brock's Protection"] = "Trainer", ["Chaos Gym"] = "Trainer",
        ["Erika's Kindness"] = "Trainer", ["Giovanni"] = "Trainer", ["Giovanni's Last Resort"] = "Trainer",
        ["Koga"] = "Trainer", ["Lt. Surge's Secret Plan"] = "Trainer", ["Misty's Wish"] = "Trainer",
        ["Resistance Gym"] = "Trainer", ["Sabrina"] = "Trainer"
    },
    uncommon = {
        ["Blaine's Quiz #2"] = "Trainer", ["Blaine's Quiz #3"] = "Trainer", ["Cinnabar City Gym"] = "Trainer",
        ["Fuchsia City Gym"] = "Trainer", ["Koga's Ninja Trick"] = "Trainer", ["Master Ball"] = "Trainer",
        ["Max Revive"] = "Trainer", ["Misty's Tears"] = "Trainer", ["Rocket's Minefield Gym"] = "Trainer",
        ["Rocket's Secret Experiment"] = "Trainer", ["Sabrina's Psychic Control"] = "Trainer",
        ["Saffron City Gym"] = "Trainer", ["Viridian City Gym"] = "Trainer"
    },
    common = {
        ["Blaine's Arcanine"] = "Fire", ["Blaine's Charizard"] = "Fire", ["Brock's Ninetales"] = "Fire",
        ["Erika's Venusaur"] = "Grass", ["Giovanni's Gyarados"] = "Water", ["Giovanni's Machamp"] = "Fighting",
        ["Giovanni's Nidoking"] = "Grass", ["Giovanni's Persian"] = "Colorless", ["Koga's Beedrill"] = "Grass",
        ["Koga's Ditto"] = "Colorless", ["Lt. Surge's Raichu"] = "Lightning", ["Misty's Golduck"] = "Water",
        ["Misty's Gyarados"] = "Water", ["Rocket's Mewtwo"] = "Psychic", ["Rocket's Zapdos"] = "Lightning",
        ["Sabrina's Alakazam"] = "Psychic", ["Blaine's Quiz #2"] = "Trainer", ["Blaine's Quiz #3"] = "Trainer",
        ["Cinnabar City Gym"] = "Trainer", ["Fuchsia City Gym"] = "Trainer", ["Koga's Ninja Trick"] = "Trainer",
        ["Master Ball"] = "Trainer", ["Max Revive"] = "Trainer", ["Misty's Tears"] = "Trainer",
        ["Rocket's Minefield Gym"] = "Trainer", ["Rocket's Secret Experiment"] = "Trainer",
        ["Sabrina's Psychic Control"] = "Trainer", ["Saffron City Gym"] = "Trainer", ["Viridian City Gym"] = "Trainer",
        ["Fervor"] = "Trainer", ["Transparent Walls"] = "Trainer", ["Warp Point"] = "Trainer",
        ["Fighting Energy"] = "Fighting", ["Fire Energy"] = "Fire", ["Grass Energy"] = "Grass",
        ["Lightning Energy"] = "Lightning", ["Psychic Energy"] = "Psychic", ["Water Energy"] = "Water"
    }
}


Pokemon.cardData["Gym Heroes"] = {

    rareHolo = {
        ["Blaine's Moltres (Holo)"] = "Fire", ["Brock's Rhydon (Holo)"] = "Fighting", ["Erika's Clefable (Holo)"] = "Colorless",
        ["Erika's Dragonair (Holo)"] = "Colorless", ["Erika's Vileplume (Holo)"] = "Grass",
        ["Lt. Surge's Electabuzz 2 (Holo)"] = "Lightning", ["Lt. Surge's Fearow (Holo)"] = "Colorless",
        ["Lt. Surge's Magneton (Holo)"] = "Lightning", ["Misty's Seadra (Holo)"] = "Water", ["Misty's Tentacruel (Holo)"] = "Water",
        ["Rocket's Hitmonchan (Holo)"] = "Fighting", ["Rocket's Moltres (Holo)"] = "Fire", ["Rocket's Scyther (Holo)"] = "Grass",
        ["Sabrina's Gengar (Holo)"] = "Psychic", ["Blaine (Holo)"] = "Trainer", ["Erika (Holo)"] = "Trainer", ["Lt. Surge (Holo)"] = "Trainer",
        ["Misty (Holo)"] = "Trainer", ["The Rocket's Trap (Holo)"] = "Trainer", ["Brock (Holo)"] = "Trainer",
    },

    rare = {
        ["Brock's Golem"] = "Fighting", ["Brock's Onix 1"] = "Fighting", ["Brock's Rhyhorn 1"] = "Fighting",
        ["Brock's Sandslash"] = "Fighting", ["Brock's Zubat 1"] = "Grass", ["Erika's Clefairy"] = "Colorless",
        ["Erika's Victreebel"] = "Grass", ["Lt. Surge's Raichu"] = "Lightning", ["Lt. Surge's Electabuzz 1"] = "Lightning",
        ["Lt. Surge's Magnemite 1"] = "Lightning", ["Misty's Cloyster"] = "Water", ["Misty's Goldeen 1"] = "Water",
        ["Misty's Poliwrath"] = "Water", ["Misty's Tentacool 1"] = "Water",
        ["Rocket's Snorlax"] = "Colorless", ["Sabrina's Venomoth"] = "Grass", ["Blaine's Quiz #1"] = "Trainer",
        ["Brock"] = "Trainer", ["Charity"] = "Trainer", ["Erika"] = "Trainer", ["Lt. Surge"] = "Trainer",
        ["Misty"] = "Trainer", ["No Removal Gym"] = "Trainer", ["The Rocket's Training Gym"] = "Trainer"
    },

    uncommon = {
        ["Blaine's Growlithe 1"] = "Fire", ["Blaine's Kangaskhan"] = "Colorless", ["Blaine's Magmar"] = "Fire",
        ["Brock's Geodude"] = "Fighting", ["Brock's Golbat"] = "Grass", ["Brock's Graveler"] = "Fighting",
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
        ["Misty's Tentacool 2"] = "Water",
    },

    common = {
        ["Blaine's Charmander"] = "Fire", ["Blaine's Growlithe 2"] = "Fire", ["Blaine's Ponyta"] = "Fire",
        ["Blaine's Tauros"] = "Colorless", ["Blaine's Vulpix"] = "Fire", ["Brock's Geodude"] = "Fighting",
        ["Brock's Mankey"] = "Fighting", ["Brock's Onix 2"] = "Fighting", ["Brock's Rhyhorn 2"] = "Fighting",
        ["Brock's Sandshrew 1"] = "Fighting", ["Brock's Sandshrew 2"] = "Fighting", ["Brock's Vulpix"] = "Fire",
        ["Brock's Zubat 2"] = "Grass", ["Erika's Bellsprout 1"] = "Grass", ["Erika's Bellsprout 2"] = "Grass", 
        ["Erika's Oddish 2"] = "Grass", ["Erika's Exeggcute 2"] = "Grass", ["Erika's Tangela"] = "Grass",
        ["Lt. Surge's Magnemite 2"] = "Lightning", ["Lt. Surge's Pikachu"] = "Lightning",
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

    --if not cards then return end
    local card = cards[ZombRand(#cards)+1]
    --if not card then return end

    return card
end


function applyItemDetails.pokemon.unpackBooster(setID, cards)
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


function applyItemDetails.applyBoostersToPokemonCards(item, n, setID)
    local cards = {}
    n = n or 1

    setID = setID or Pokemon.cardSets[ZombRand(#Pokemon.cardSets)+1]

    for i=1, n do applyItemDetails.pokemon.unpackBooster(setID, cards) end
    item:getModData()["gameNight_cardDeck"] = cards
    item:getModData()["gameNight_cardFlipped"] = {}
    for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
end


function applyItemDetails.applyCardForPokemon(item)
    local applyBoosters = item:getModData()["gameNight_specialOnCardApplyBoosters"]
    ---TEMPORARY
    applyBoosters = applyBoosters or 1
    if applyBoosters then
        item:getModData()["gameNight_specialOnCardApplyBoosters"] = nil
        applyItemDetails.applyBoostersToPokemonCards(item, applyBoosters)
        return
    end

    --[[
    if not item:getModData()["gameNight_cardDeck"] then
        local cards = Pokemon.buildDeck()
        item:getModData()["gameNight_cardDeck"] = cards
        item:getModData()["gameNight_cardFlipped"] = {}
        for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
    end
    --]]
end



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
