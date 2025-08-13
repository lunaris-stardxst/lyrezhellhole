SMODS.Joker{ --comically large backpack
    key = "comicallylargebackpack",
    config = {
        extra = {
            slot_change = 3
        }
    },
    loc_txt = {
        ['name'] = 'comically large backpack',
        ['text'] = {
            [1] = '{C:attention}+3{} Consumable slots',
            [2] = '{C:attention}-1{} Joker slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot_change
            return true
        end }))
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot_change
            return true
        end }))
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}