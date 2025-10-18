SMODS.Consumable {
    key = 'soulyter',
    set = 'what_the',
    pos = { x = 3, y = 1 },
    loc_txt = {
        name = 'soul of a youtuber',
        text = {
        [1] = '{C:red}Destroy{} a random {C:attention}Joker{},',
        [2] = 'Create a {C:attention}Rare Tag{} and {C:attention}Negative Tag{}'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_rare")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_negative")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
    end,
    can_use = function(self, card)
        return true
    end
}