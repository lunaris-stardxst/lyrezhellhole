SMODS.Consumable {
    key = 'soulofacollector',
    set = 'what_the',
    pos = { x = 2, y = 1 },
    loc_txt = {
        name = 'soul of a collector',
        text = {
        [1] = 'Create a {C:dark_edition}Misprint{} {C:attention}Misprint{} and a',
        [2] = '{C:enhanced}Misprinted{} {C:dark_edition}Misprint{} {C:attention}Misprint Seal{} Ace of {C:spades}Spades{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}