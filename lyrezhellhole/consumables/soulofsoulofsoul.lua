SMODS.Consumable {
    key = 'soulofsoulofsoul',
    set = 'what_the',
    pos = { x = 2, y = 1 },
    config = { extra = {
        consumable_count = 1
    } },
    loc_txt = {
        name = 'soul of soul of soul',
        text = {
        [1] = 'Create {C:attention}2 soul of soul{} cards'
    }
    },
    cost = 12,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ key = 'c_lzh_soulofsoul' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}