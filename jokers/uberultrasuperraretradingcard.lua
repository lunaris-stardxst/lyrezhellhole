SMODS.Joker{ --Uber Ultra Super Rare Trading Card
    key = "uberultrasuperraretradingcard",
    config = {
        extra = {
            monoly = 33,
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Uber Ultra Super Rare Trading Card',
        ['text'] = {
            [1] = 'If {C:attention}first discard{} of round only has {C:attention}1{}',
            [2] = 'card, destroy it and earn {X:money,C:white}X$33{}',
            [3] = '{C:inactive}\"see, the top left sigil and the r are slightly different.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10000,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    calculate = function(self, card, context)
        if context.pre_discard  then
            if (#context.full_hand == 1 and G.GAME.current_round.discards_used <= 0) then
                return {
                    func = function()
                    local target_amount = (G.GAME.dollars) * 3
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring((G.GAME.dollars) * 3), colour = G.C.MONEY})
                    return true
                end
                }
            end
        end
    end
}