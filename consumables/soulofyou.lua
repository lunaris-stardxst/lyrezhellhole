SMODS.Consumable {
    key = 'soulofyou',
    set = 'what_the',
    pos = { x = 3, y = 0 },
    config = { extra = {
        hand_size_value = 6,
        hands_value = 1,
        discards_value = 1
    } },
    loc_txt = {
        name = 'soul of you',
        text = {
        [1] = 'A {C:red}Calamity{} beyond all {C:attention}Jimbo{}.'
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
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(6).." Hand Size", colour = G.C.BLUE})
                    G.hand:change_size(6)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                    G.GAME.current_round.hands_left = 1
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Discards", colour = G.C.BLUE})
                    G.GAME.current_round.discards_left = 1
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}