SMODS.Joker{ --sebastian
    key = "sebastian",
    config = {
        extra = {
            chips = 3
        }
    },
    loc_txt = {
        ['name'] = 'sebastian',
        ['text'] = {
            [1] = '{C:blue}+3{} Chips',
            [2] = '{C:inactive}\"sebastian loves his mcnuggies\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}