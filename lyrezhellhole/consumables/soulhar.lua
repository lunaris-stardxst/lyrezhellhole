SMODS.Consumable {
    key = 'soulhar',
    set = 'what_the',
    pos = { x = 0, y = 0 },
    config = { extra = {
        discards_value = 0,
        hands_value = 1
    } },
    loc_txt = {
        name = 'dying soul of harrison',
        text = {
        [1] = 'summons {X:attention,C:white}harrison{}, for a {C:red}price{}.'
    }
    },
    cost = 333,
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
                      SMODS.add_card({ set = 'Joker', key = 'j_lzh_harrison' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            local mod = 0 - G.GAME.round_resets.discards
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(0).." Discards", colour = G.C.BLUE})
                    
        G.GAME.round_resets.discards = 0
        ease_discard(0 - G.GAME.current_round.discards_left)
        
                    return true
                end
            }))
            delay(0.6)
            local mod = 1 - G.GAME.round_resets.hands
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                    
        G.GAME.round_resets.hands = 1
        ease_hands_played(1 - G.GAME.current_round.hands_left)
        
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}