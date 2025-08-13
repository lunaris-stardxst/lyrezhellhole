SMODS.Enhancement {
    key = 'squarecard',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            x_mult = 4
        }
    },
    loc_txt = {
        name = 'square card',
        text = {
        [1] = 'If you have {X:attention,C:white}4{} jokers, {X:red,C:white}X4{} Mult'
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
        if context.main_scoring and context.cardarea == G.play and #G.jokers.cards == 4 then
            return { x_mult = card.ability.extra.x_mult }
        end
    end
}