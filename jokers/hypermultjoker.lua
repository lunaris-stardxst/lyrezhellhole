SMODS.Joker{ --obligatory hypermult joker
    name = "obligatory hypermult joker",
    key = "hypermultjoker",
    config = {
        extra = {
            hypermultmult = 10,
            hypermultemult = 10
        }
    },
    loc_txt = {
        ['name'] = 'obligatory hypermult joker',
        ['text'] = {
            [1] = 'Gains {X:darkedition,C:white}^10{} Mult and Chips',
            [2] = 'and {X:red,C:white}X10{} Mult every card scored',
            [3] = '{C:inactive}(currently {X:red,C:white}X#1#{C:inactive} Mult and {X:darkedition,C:white}^#2#{C:inactive} Mult and Chips)'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 333,
    rarity = "lzh_flomp",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.hypermultmult, card.ability.extra.hypermultemult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                card.ability.extra.hypermultmult = (card.ability.extra.hypermultmult) + 20
                card.ability.extra.hypermultemult = (card.ability.extra.hypermultemult) + 10
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    e_chips = card.ability.extra.hypermultemult,
                    extra = {
                        e_mult = card.ability.extra.hypermultemult,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = card.ability.extra.hypermultmult
                        }
                        }
                }
        end
    end
}