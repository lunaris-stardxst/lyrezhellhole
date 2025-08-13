SMODS.Joker{ --joker shifted by exactly 2 pixels
    key = "jokershiftedbyexactly2pixels",
    config = {
        extra = {
            shiftchips = -2,
            shiftmult = 2,
            shiftamount = 2
        }
    },
    loc_txt = {
        ['name'] = 'joker shifted by exactly 2 pixels',
        ['text'] = {
            [1] = '{C:blue}-#1#{} Chips',
            [2] = '{C:red}+#2#{} Mult',
            [3] = 'Number shifts by {C:attention}#3#{} when hand played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.shiftchips, card.ability.extra.shiftmult, card.ability.extra.shiftamount}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local shiftchips_value = card.ability.extra.shiftchips
                local shiftmult_value = card.ability.extra.shiftmult
                card.ability.extra.shiftchips = math.max(0, (card.ability.extra.shiftchips) - card.ability.extra.shiftamount)
                card.ability.extra.shiftmult = (card.ability.extra.shiftmult) + card.ability.extra.shiftamount
                return {
                    chips = shiftchips_value,
                    extra = {
                        mult = shiftmult_value
                        }
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                    card.ability.extra.shiftamount = (card.ability.extra.shiftamount) + card.ability.extra.shiftamount
                    return true
                end
                }
        end
    end
}