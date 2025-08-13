SMODS.Consumable {
    key = 'theevilfool',
    set = 'evil_cards',
    pos = { x = 9, y = 1 },
    config = { extra = {
        consumable_count = 1,
        joker_slots_value = 1
    } },
    loc_txt = {
        name = 'The EVIL Fool',
        text = {
        [1] = 'Creates a random {C:rare}what the fucking{} card,',
        [2] = '{C:attention}-1{} Joker Slot'
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
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'what_the' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Joker Slot", colour = G.C.RED})
                    G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}