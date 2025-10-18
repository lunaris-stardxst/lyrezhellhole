SMODS.Consumable {
    key = 'the',
    set = 'card',
    pos = { x = 2, y = 2 },
    loc_txt = {
        name = 'The',
        text = {
        [1] = 'Create {C:attention}1{} to {C:attention}7{} {C:tarot}Tarot{} Cards'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(RANGE:1|7, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
  
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', })                            
            used_card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                      if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
    end,
    can_use = function(self, card)
        return true
    end
}