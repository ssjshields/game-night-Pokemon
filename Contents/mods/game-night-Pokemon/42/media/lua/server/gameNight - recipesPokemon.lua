require "recipecode"
require "gameNight - recipes"

function Recipe.GameNight.OpenSealedPokemonCards(craftRecipeData, character)

    local item = craftRecipeData:getAllConsumedItems():get(0)
    local result = craftRecipeData:getAllCreatedItems():get(0)

    local deckType = item:getModData()["gameNight_specialOnCardApplyDeck"]
    if deckType then
        result:getModData()["gameNight_specialOnCardApplyDeck"] = deckType
    end

    local boosterType = item:getModData()["gameNight_specialOnCardApplyBooster"]
    if boosterType then
        result:getModData()["gameNight_specialOnCardApplyBooster"] = boosterType
    end
end