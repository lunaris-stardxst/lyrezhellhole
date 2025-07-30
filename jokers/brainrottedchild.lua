SMODS.Joker{ --Brainrotted Child
    name = "Brainrotted Child",
    key = "brainrottedchild",
    config = {
        extra = {
            Xmult = 6.9,
            j_lzh_brainrottedchild = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brainrotted Child',
        ['text'] = {
            [1] = '{C:attention}sigma.{}',
            [2] = '{C:inactive}(must have room){}'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 4,
    rarity = "lzh_sigmagreek",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 6 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 7 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 1
end)()) then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker', key = 'j_lzh_brainrottedchild' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        message = created_joker and localize('k_plus_joker') or nil,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}