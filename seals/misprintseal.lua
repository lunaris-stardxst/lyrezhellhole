SMODS.Seal {
    key = 'misprintseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_chips_min = 0,
            x_chips_max = 23
        }
    },
    badge_colour = HEX('5b406d'),
   loc_txt = {
        name = 'Misprint Seal',
        label = 'Misprint Seal',
        text = {
        [1] = '{X:blue,C:white}X0-23{} Chips'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = pseudorandom('x_chips_30dd7bdf', card.ability.seal.extra.x_chips_min, card.ability.seal.extra.x_chips_max) }
        end
    end
}