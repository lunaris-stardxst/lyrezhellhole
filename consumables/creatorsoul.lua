SMODS.Consumable {
    key = 'creatorsoul',
    set = 'what_the',
    pos = { x = 0, y = 2 },
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
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'lzh_lyre' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
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