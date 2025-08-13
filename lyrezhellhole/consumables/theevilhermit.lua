SMODS.Consumable {
    key = 'theevilhermit',
    set = 'evil_cards',
    pos = { x = 0, y = 2 },
    config = { extra = {
        double_limit = 1.0000000000000003e+21,
        dollars_value = 20
    } },
    loc_txt = {
        name = 'The EVIL Hermit',
        text = {
        [1] = '{C:attention}Doubles{} money, then {C:money}-$20{}'
    }
    },
    cost = 0,
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
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 1.0000000000000003e+21)
                    ease_dollars(double_amount, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(20).." $", colour = G.C.RED})
                    ease_dollars(-math.min(G.GAME.dollars, 20), true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}