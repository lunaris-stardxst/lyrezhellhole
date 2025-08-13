SMODS.Joker{ --EVEN [[BIGGER]] BACKPACK
    key = "evenbiggerbackpack",
    config = {
        extra = {
            slot_change = 30,
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'EVEN [[BIGGER]] BACKPACK',
        ['text'] = {
            [1] = '{C:attention}+30{} Consumable slots',
            [2] = '{C:money}-$2{} when hand played',
            [3] = '{C:inactive}\"yours for only [[19.99]] get today!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 19,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    dollars = -card.ability.extra.dollars
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