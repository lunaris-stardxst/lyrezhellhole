SMODS.Enhancement {
    key = 'blue',
    pos = { x = 1, y = 0 },
    config = {
        bonus = 23,
        extra = {
            x_chips = 1.23
        }
    },
    loc_txt = {
        name = 'blue',
        text = {
        [1] = 'human, {C:blue}fucking{} {X:blue,C:white}BLUE{}.'
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
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.extra.x_chips }
        end
    end
}