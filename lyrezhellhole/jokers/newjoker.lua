SMODS.Joker{ --New Joker
    key = "newjoker",
    config = {
        extra = {
            chips = 6,
            mult = 6
        }
    },
    loc_txt = {
        ['name'] = 'New Joker',
        ['text'] = {
            [1] = 'A {C:blue}custom{} joker with {C:red}unique{} effects.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
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

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
    end
}