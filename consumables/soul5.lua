SMODS.Consumable {
    key = 'soul5',
    set = 'what_the',
    pos = { x = 8, y = 1 },
    loc_txt = {
        name = 'soul of soul of soul of soul of soul',
        text = {
        [1] = 'Create {C:attention}3 soul of soul of soul{} cards'
    }
    },
    cost = 36,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(3, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
  
            play_sound('timpani')
            SMODS.add_card({ set = 'what_the', key = 'c_lzh_soulofsoulofsoul'})                            
            used_card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                      if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
    end,
    can_use = function(self, card)
        return true
    end
}