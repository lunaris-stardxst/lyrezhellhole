SMODS.Enhancement {
    key = 'bald',
    pos = { x = 0, y = 0 },
    config = {
        bonus = -50,
        extra = {
            x_mult = 3
        }
    },
    loc_txt = {
        name = 'bald.',
        text = {
        [1] = 'No Suit or Rank, {X:mult,C:white}X3{} Mult and {C:blue}-50{} Chips',
        [2] = '{C:inactive}\"a little off the top please\"{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.extra.x_mult }
        end
    end
}