--require "recipecode"
require("gameNight-recipes.lua")
local Pokemon = require("gameNight-cardDataPokemon.lua")

function Recipe.GameNight.OpenSealedPokemonCards(craftRecipeData, character)

    local item = craftRecipeData:getAllConsumedItems():get(0)
    local result = craftRecipeData:getAllCreatedItems():get(0)
    if not item or not result then return end

    if item:getFullType() == "Base.pokemonStarterKit" then

        local deckID = Pokemon.cardDecks[ZombRand(#Pokemon.cardDecks)+1]
        local cards, coinType = Pokemon.buildDeck(deckID)
        if cards then
            result:getModData()["gameNight_cardDeck"] = cards
            result:getModData()["gameNight_cardFlipped"] = {}
            for i=1, #cards do result:getModData()["gameNight_cardFlipped"][i] = true end
        end

        local coin = coinType and instanceItem(coinType)
        if coin and character then character:getInventory():AddItem(coin) end

    else
        local setID = Pokemon.cardSets[ZombRand(#Pokemon.cardSets)+1]
        local cards = Pokemon.unpackBooster(setID)
        result:getModData()["gameNight_cardDeck"] = cards
        result:getModData()["gameNight_cardFlipped"] = {}
        for i=1, #cards do result:getModData()["gameNight_cardFlipped"][i] = true end
    end
end
