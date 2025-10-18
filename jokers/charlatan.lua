SMODS.Joker{ --Charlatan
    key = "charlatan",
    config = {
        extra = {
            xchips = 2,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Charlatan',
        ['text'] = {
            [1] = '{X:tarot,C:white}X2{} Chult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}