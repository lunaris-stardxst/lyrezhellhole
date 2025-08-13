SMODS.Joker{
    key = "bigestbackpack",
    config = {
        extra = {
            slot_change = 3.333333333333333e+122,
            coupon = 0
        }
    },
    loc_txt = {
        ['name'] = '[[BIGEST]] BACKPACK',
        ['text'] = {
            [1] = '{C:attention}+naneinf{} Consumable slots',
            [2] = 'Create a {C:attention}Coupon Tag{} at end of round',
            [3] = '{C:inactive}\"THE [[Strings]] OF THE [[Fun-Time Experience]] LIMIT ME\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = "lzh_flomp",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_coupon")
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
                    return true
                end,
                    message = "Created Tag!"
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot_change
            return true
        end }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot_change
            return true
        end }))
    end
}