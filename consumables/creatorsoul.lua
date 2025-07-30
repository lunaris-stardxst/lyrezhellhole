SMODS.Consumable {
    key = 'creatorsoul',
    set = 'what_the',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'soul of the creator',
        text = {
        [1] = 'Creates {X:tarot,C:white}Lyre{} with no downside for rn',
        [2] = 'im tired ok i only work on this mod',
        [3] = 'in the middle of the night'
    }
    },
    cost = 926,
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