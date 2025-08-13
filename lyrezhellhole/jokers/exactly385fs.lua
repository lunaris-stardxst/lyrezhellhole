SMODS.Joker{ --exactly 385 fs
    key = "exactly385fs",
    config = {
        extra = {
            mult = 385
        }
    },
    loc_txt = {
        ['name'] = 'exactly 385 fs',
        ['text'] = {
            [1] = '{X:mult,C:white}ffffffffffffffffffffffffffffffff{}',
            [2] = '{X:mult,C:white}ffffffffffffffffffffffffffffffff{}',
            [3] = '{X:mult,C:white}ffffffffffffffffffffffffffffffff{}',
            [4] = '{X:mult,C:white}ffffffffffffffffffffffffffffffff{}',
            [5] = '{X:mult,C:white}ffffffffffffffffffffffffffffffff{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 128,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}