SMODS.Enhancement {
    key = 'misprinted',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            mult_min = 0,
            mult_max = 23
        }
    },
    loc_txt = {
        name = 'Misprinted',
        text = {
        [1] = '{C:red}+0-23{} Mult'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1.25,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = pseudorandom('mult_452be1f2', card.ability.extra.mult_min, card.ability.extra.mult_max) }
        end
    end
}