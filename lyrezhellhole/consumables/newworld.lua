SMODS.Consumable {
    key = 'newworld',
    set = 'Planet',
    pos = { x = 3, y = 0 },
    config = { extra = {
        hand_type = "Two Pair",
        levels = 4
    } },
    loc_txt = {
        name = 'New World',
        text = {
        [1] = 'Level up {C:attention}Two Pair{} {C:planet}4 levels{},',
        [2] = 'Make {C:attention}2{} selected cards {C:edition}Square Cards{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Two Pair', 'poker_hands'), 
                  chips = G.GAME.hands['Two Pair'].chips, 
                  mult = G.GAME.hands['Two Pair'].mult, 
                  level = G.GAME.hands['Two Pair'].level })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(4) })
            delay(1.3)
            level_up_hand(card, "Two Pair", true, 4)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Two Pair', 'poker_hands'), 
                 chips = G.GAME.hands['Two Pair'].chips, 
                 mult = G.GAME.hands['Two Pair'].mult, 
                 level=G.GAME.hands['Two Pair'].level})
            delay(1.3)
        if #G.hand.highlighted <= 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_lzh_squarecard'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted <= 2)
    end
}