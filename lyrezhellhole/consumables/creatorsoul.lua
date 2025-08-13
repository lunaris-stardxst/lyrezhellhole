SMODS.Consumable {
    key = 'creatorsoul',
    set = 'what_the',
    pos = { x = 5, y = 1 },
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
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', rarity = 'lzh_lyre' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}