SMODS.Consumable {
    key = 'soulof',
    set = 'what_the',
    pos = { x = 0, y = 1 },
    loc_txt = {
        name = 'soul of',
        text = {
        [1] = 'create a {C:attention}jimbo{}'
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