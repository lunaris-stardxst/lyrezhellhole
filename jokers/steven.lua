SMODS.Joker{ --septinviginqiutrillion steven
    name = "septinviginqiutrillion steven",
    key = "steven",
    config = {
        extra = {
            mult = 723,
            Xmult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'septinviginqiutrillion steven',
        ['text'] = {
            [1] = '{X:mult,C:white}(723)1.1{} Mult',
            [2] = '{C:inactive}\"holy shit steven from Cryptposting\"{}'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 5,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}