SMODS.Joker{ --Uber Rare Trading Card
    key = "uberrarecard",
    config = {
        extra = {
            moneezgain = 3,
            money÷5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Uber Rare Trading Card',
        ['text'] = {
            [1] = 'If {C:attention}first discard{} of round only has {C:attention}1{}',
            [2] = 'card, destroy it and earn {X:money,C:white}X$3{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 200,
    rarity = "lzh_here",
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
                local moneezgain_value = card.ability.extra.moneezgain
                return {
                    func = function()
                    card.ability.extra.moneezgain = (card.ability.extra.moneezgain) * (math.floor(lenient_bignum(G.GAME.dollars / 5))) * 5
                    return true
                end,
                    extra = {
                        func = function()
                    local target_amount = moneezgain_value
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(moneezgain_value), colour = G.C.MONEY})
                    return true
                end,
                        colour = G.C.MONEY,
                        extra = {
                            func = function()
                    card.ability.extra.moneezgain = 3
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
            end
        end
    end
}