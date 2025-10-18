SMODS.Joker{ --Matterless
    key = "matterless",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Matterless',
        ['text'] = {
            [1] = '{C:dark_edition}+2{} Joker Slots for every',
            [2] = '{C:attention}Joker{} owned',
            [3] = '{C:inactive}(Currently{}{C:dark_edition} +#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "lzh_flomp",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 2}}
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + (#(G.jokers and G.jokers.cards or {})) * 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - (#(G.jokers and G.jokers.cards or {})) * 2
    end
}