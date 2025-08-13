SMODS.Consumable {
    key = 'sacrificialghoul',
    set = 'Spectral',
    pos = { x = 6, y = 0 },
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
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}