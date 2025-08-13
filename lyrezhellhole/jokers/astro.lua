SMODS.Joker{ --Astro
    key = "astro",
    config = {
        extra = {
            astromult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Astro',
        ['text'] = {
            [1] = '{X:darkedition,C:white}^#1#{} Mult and Chips, increased when the',
            [2] = '{C:inactive}\"i hate you all\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 5,
    rarity = "lzh_other_people",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.astromult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.astromult,
                    extra = {
                        e_mult = card.ability.extra.astromult,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.ending_shop  then
                return {
                    func = function()
                    card.ability.extra.astromult = (card.ability.extra.astromult) * 1.5
                    return true
                end
                }
        end
        if context.buying_card  then
                return {
                    func = function()
                    card.ability.extra.astromult = (card.ability.extra.astromult) * 1.5
                    return true
                end
                }
        end
        if context.reroll_shop  then
                return {
                    func = function()
                    card.ability.extra.astromult = (card.ability.extra.astromult) / 1.5
                    return true
                end
                }
        end
    end
}