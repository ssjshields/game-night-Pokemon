require "recipecode"
require "gameNight - recipes"

--[Recipe.GetItemTypes.pokemonKit]
function Recipe.GetItemTypes.pokemonKit(scriptItems) scriptItems:addAll(getScriptManager():getItemsTag("pokemonKit")) end
---@param items ArrayList
---@param result InventoryItem|InventoryContainer
---@param player IsoPlayer
function Recipe.GameNight.OpenKitPokemon(items, result, player)
    local package = items:get(0)
    local cardTypes = package:getModData()["gameNight_specialOnCardApplyDeck"]
    result:getModData()["gameNight_specialOnCardApplyDeck"] = cardTypes
end


--[Recipe.GetItemTypes.pokemonBooster]
function Recipe.GetItemTypes.pokemonBooster(scriptItems) scriptItems:addAll(getScriptManager():getItemsTag("pokemonBooster")) end
---@param items ArrayList
---@param result InventoryItem|InventoryContainer
---@param player IsoPlayer
function Recipe.GameNight.OpenBoosterPokemon(items, result, player)
    local package = items:get(0)
    local cardTypes = package:getModData()["gameNight_specialOnCardApplyBooster"]
    result:getModData()["gameNight_specialOnCardApplyBooster"] = cardTypes
end