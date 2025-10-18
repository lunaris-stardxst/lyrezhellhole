SMODS.Consumable {
    key = 'soulbillionare',
    set = 'what_the',
    pos = { x = 1, y = 1 },
    config = { extra = {
        currentmoney = 0
    } },
    loc_txt = {
        name = 'soul of a billionare',
        text = {
        [1] = '{C:attention}Quadruples{} money. creates {C:attention}the billionare{}.'
    }
    },
    cost = 3,
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
                    local current_dollars = G.GAME.dollars
                    local target_dollars = (G.GAME.dollars) * 2
                    local difference = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring((G.GAME.dollars) * 2), colour = G.C.MONEY})
                    ease_dollars(difference, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_lzh_bill' })
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