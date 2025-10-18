SMODS.Joker{ --harrison
    key = "harrison",
    config = {
        extra = {
            harrisonmult = 426
        }
    },
    loc_txt = {
        ['name'] = 'harrison',
        ['text'] = {
            [1] = '{X:darkedition,C:white}^426{} Chips amd Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 426,
    rarity = "lzh_flomp",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.harrisonmult,
                    extra = {
                        e_mult = card.ability.extra.harrisonmult,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}