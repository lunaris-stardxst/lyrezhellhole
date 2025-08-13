SMODS.Consumable {
    key = 'souleng',
    set = 'what_the',
    pos = { x = 9, y = 0 },
    config = { extra = {
        destroy_count = 5
    } },
    loc_txt = {
        name = 'soul of an english teacher',
        text = {
        [1] = '{C:red}Destroys{} all jokers, creates a {C:attention}Coulibiac{} Joker.'
    }
    },
    cost = 21,
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
                      SMODS.add_card({ set = 'Joker', rarity = 'lzh_coulibiac' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            local destroyed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, 5 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            SMODS.destroy_cards(destroyed_cards)

            delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}