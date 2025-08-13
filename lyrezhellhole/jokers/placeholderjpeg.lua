SMODS.Joker{ --placeholder.jpeg
    key = "placeholderjpeg",
    config = {
        extra = {
            chips = 2,
            Xmult = 10,
            emult = 300
        }
    },
    loc_txt = {
        ['name'] = 'placeholder.jpeg',
        ['text'] = {
            [1] = '+2 Chips',
            [2] = '-7 hand size',
            [3] = '^nhbhbjhggc mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 5,
    rarity = "lzh_flomp",
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
                        Xmult = card.ability.extra.Xmult,
                        extra = {
                            e_mult = card.ability.extra.emult,
                            message = "sdfjknsfjfsnkj",
                            colour = G.C.DARK_EDITION
                        }
                        }
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-7)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(7)
    end
}