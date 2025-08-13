SMODS.Joker{ --Transcendent Touch
    key = "transcendenttouch",
    config = {
        extra = {
            reduction_value = translesscards,
            translesscards = 1,
            transreduce = 1,
            translimit = 6,
            lesscardsreset = -4
        }
    },
    loc_txt = {
        ['name'] = 'Transcendent Touch',
        ['text'] = {
            [1] = 'Straights and Flushes can be made with {C:attention}#1#{} less card(s),',
            [2] = 'At end of round, increase number by {C:attention}#2#{}',
            [3] = 'If number is more than {C:attention}#3#{}, reset all values.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 5,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.translesscards, card.ability.extra.transreduce, card.ability.extra.translimit}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.translesscards = (card.ability.extra.translesscards) + card.ability.extra.transreduce
                    return true
                end
                }
        end
        if context.starting_shop  then
            if card.ability.extra.translesscards > card.ability.extra.translimit then
                local lesscardsreset_value = card.ability.extra.lesscardsreset
                return {
                    func = function()
                    card.ability.extra.transreduce = (card.ability.extra.transreduce) + 1
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.translimit = (card.ability.extra.translimit) + 5
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.translesscards = card.ability.extra.lesscardsreset
                    return true
                end,
                            colour = G.C.BLUE,
                        extra = {
                            func = function()
                    card.ability.extra.lesscardsreset = math.max(0, (card.ability.extra.lesscardsreset) - 5)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                        }
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements reduced by translesscards
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements restored
    end
}


local smods_four_fingers_ref = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card("j_lzh_transcendenttouch")) then
        return NaN
    end
    return smods_four_fingers_ref()
end