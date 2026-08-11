local applyItemDetails = require("gameNight-applyItemDetails.lua")
local deckActionHandler = applyItemDetails.deckActionHandler
local gamePieceHandler = applyItemDetails.gamePieceHandler
local Pokemon = require("gameNight-cardDataPokemon.lua")

gamePieceHandler.registerTypes({ "Base.PokemonDice" })
gamePieceHandler.registerSpecial("Base.PokemonDice", { addTextureDir = "dice/", noRotate=true, actions = { rollDie=6, placeDieOnSide=true }, shiftAction = "rollDie", })


local Tokens = {}

Tokens.types = {
    Pkmn_baseCoinFlipped = {"AerodactylCoin", "ChanseyCoin", "EeveeCoin", "VileplumeCoin",},
    Pkmn_base2CoinFlipped = {"PikachuCoin", "MeowthCoin", "StarmieCoin",}
}

Tokens.typesToRegister = {"Base.MetalPikachuCoin","Base.PokemonStatusCoin"}
for typeID, coins in pairs(Tokens.types) do
    for _,coin in pairs(coins) do
        table.insert(Tokens.typesToRegister, "Base."..coin)
        gamePieceHandler.registerSpecial("Base."..coin, {
            alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
            actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState=typeID, shiftAction = "coinFlip",
        })
    end
end
gamePieceHandler.registerTypes(Tokens.typesToRegister)

gamePieceHandler.registerSpecial("Base.pokemonBoosterPack", { hideUI = true })
gamePieceHandler.registerSpecial("Base.pokemonStarterKit", { hideUI = true })

gamePieceHandler.registerSpecial("Base.PokemonStatusCoin", {
    alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
    actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState="PokemonStatusCoinFlipped", shiftAction = "coinFlip",
})

gamePieceHandler.registerSpecial("Base.MetalPikachuCoin", {
    alternateStackRendering = {func="DrawTextureRoundFace", rgb = {0.55, 0.44, 0.33}}, addTextureDir = "PokeTokens/",
    actions = { flipPiece=true, coinFlip=true, examine=true }, textureSize = {64,64}, altState="MetalPikachuCoinFlipped", shiftAction = "coinFlip",
})


function Pokemon.registerPokemonCardsUI()
    deckActionHandler.addDeck("pokemonCards", Pokemon.tradingCards, nil, Pokemon.altIcons)

    gamePieceHandler.registerSpecial("Base.pokemonCards", {
        actions = { examine=true}, examineScale = 1, applyCards = "applyCardForPokemon", textureSize = {100,140}
    })
end
Events.OnGameBoot.Add(Pokemon.registerPokemonCardsUI)


-- 1:3 packs are holo
-- 1 Rare card (which could be a Rare Holo or a non-foil Rare)
-- 3 Uncommon cards
-- 7 Common cards


-- Loose pokemonCards items can spawn directly in the world (see gameNight-DistributionsPokemon.lua) with no
-- booster/starter-kit origin at all. Those still need a deck rolled the first time they're seen in an inventory.
-- Cards produced by unsealing a Base.pokemonBoosterPack or Base.pokemonStarterKit are now built server-side, at
-- craft time, in gameNight-recipesPokemon.lua's OpenSealedPokemonCards - by the time this function runs on such
-- an item, gameNight_cardDeck is already set and this whole block is skipped.
function applyItemDetails.applyCardForPokemon(item)
    if not item:getModData()["gameNight_cardDeck"] then

        local itemCont = item:getContainer()
        local zombie = itemCont and (itemCont:getType() == "inventorymale" or itemCont:getType() == "inventoryfemale")

        local applyDeck
        local wildDeck = false

        if (ZombRand(10) < 1) or zombie then
            local card = Pokemon.spawnRandomCard(true)
            item:getModData()["gameNight_cardDeck"] = { card }
            item:getModData()["gameNight_cardFlipped"] = { true }
        else
            wildDeck = true
            applyDeck = Pokemon.cardDecks[ZombRand(#Pokemon.cardDecks)+1]
        end

        if applyDeck then

            local cards, coinType = Pokemon.buildDeck(applyDeck)
            if cards then
                item:getModData()["gameNight_cardDeck"] = cards
                item:getModData()["gameNight_cardFlipped"] = {}
                for i=1, #cards do item:getModData()["gameNight_cardFlipped"][i] = true end
            end

            local container = item:getContainer()
            local worldItem = item:getWorldItem()
            local worldItemSq = worldItem and worldItem:getSquare()

            if wildDeck then
                for n=1, 4 do
                    local damageDice = instanceItem("Base.PokemonDice")
                    if damageDice and container then container:AddItem(damageDice) end
                    if damageDice and worldItemSq then worldItemSq:AddWorldInventoryItem(damageDice, 0, 0, 0) end

                    local statusCoin = instanceItem("Base.PokemonStatusCoin")
                    if statusCoin and container then container:AddItem(statusCoin) end
                    if statusCoin and worldItemSq then worldItemSq:AddWorldInventoryItem(statusCoin, 0, 0, 0) end
                end
            end

            local coin = coinType and instanceItem(coinType)
            if coin then
                if container then container:AddItem(coin) end
                if worldItemSq then worldItemSq:AddWorldInventoryItem(coin, 0, 0, 0) end
            end
        end

        gamePieceHandler.refreshInventory(getPlayer())
    end
end
