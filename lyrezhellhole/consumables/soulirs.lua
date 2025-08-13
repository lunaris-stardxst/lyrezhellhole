SMODS.Consumable {
    key = 'soulirs',
    set = 'what_the',
    pos = { x = 0, y = 1 },
    loc_txt = {
        name = 'soul of an irs worker',
        text = {
        [1] = 'Creates a random Joker, costs {C:money}$10{}.'
    }
    },
    cost = 7,
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
                      SMODS.add_card({ set = 'Joker' })
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