SMODS.Joker{ --Oddly specific Joker
    key = "oddlyspecificjoker",
    config = {
        extra = {
            oddlyspecificmult = 3,
            increaseoddly = 1
        }
    },
    loc_txt = {
        ['name'] = 'Oddly specific Joker',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if:',
            [2] = '-Hand contains a {C:attention}3{}',
            [3] = '-Hand is a {C:clubs}Clubs{} {C:attention}Flush{}',
            [4] = '-You own a {C:rare}Rare{} {C:attention}Joker{}',
            [5] = '-This is the first hand of round',
            [6] = '-Hand contains a {C:attention}Gold Seal{}',
            [7] = '-You have {C:attention}0{} Discards',
            [8] = '-Played hand has a {C:dark_edition}Misprinted{} Card',
            [9] = '-Played hand contains a {C:enhanced}Square{} Card',
            [10] = '-You have more than {C:attention}3{} Jokers',
            [11] = '-You are NOT playing on {C:attention}Mac{}',
            [12] = '-This Joker is {C:legendary}Eternal{}',
            [13] = '-You have less than {C:money}$4{}',
            [14] = 'Increases by {X:red,C:white}X#2#{} when this {C:attention}Joker{} triggers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.oddlyspecificmult, card.ability.extra.increaseoddly}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 3 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and next(context.poker_hands["Flush"]) and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 4
end)() and (function()
    local count = 0
    for _, joker_owned in pairs(G.jokers.cards or {}) do
        if joker_owned.config.center.rarity == 3 then
            count = count + 1
        end
    end
    return count >= 1
end)() and #G.jokers.cards >= 3 and not (love.system.getOS() == "iOS") and (function()
    local count = 0
    for _, playing_card in pairs(context.full_hand or {}) do
        if playing_card.seal == "Gold" then
            count = count + 1
        end
    end
    return count >= 1
end)() and G.GAME.current_round.discards_left == 0 and (function()
    local count = 0
    for _, playing_card in pairs(context.full_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_lzh_squarecard"] == true then
            count = count + 1
        end
    end
    return count >= 1
end)() and (function()
    local count = 0
    for _, playing_card in pairs(context.full_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_lzh_misprinted"] == true then
            count = count + 1
        end
    end
    return count >= 1
end)() and G.GAME.dollars < to_big(4)) then
                local oddlyspecificmult_value = card.ability.extra.oddlyspecificmult
                card.ability.extra.oddlyspecificmult = (card.ability.extra.oddlyspecificmult) + card.ability.extra.increaseoddly
                return {
                    Xmult = oddlyspecificmult_value
                }
            end
        end
    end
}