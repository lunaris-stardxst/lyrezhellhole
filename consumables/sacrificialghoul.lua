SMODS.Consumable {
    key = 'sacrificialghoul',
    set = 'spirit',
    pos = { x = 9, y = 0 },
    loc_txt = {
        name = 'Sacrificial Ghoul',
        text = {
        [1] = '{C:red}Destroy{} two random Jokers,',
        [2] = 'gain {C:money}$20{}.'
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