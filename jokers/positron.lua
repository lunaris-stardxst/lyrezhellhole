SMODS.Joker{ --Positron
    key = "positron",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Positron',
        ['text'] = {
            [1] = '{C:dark_edition}+0.5{} Joker Slots for every',
            [2] = '{C:attention}Joker{} owned',
            [3] = '{C:inactive}(Currently #1#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 0.5}}
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + (#(G.jokers and G.jokers.cards or {})) * 0.5
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - (#(G.jokers and G.jokers.cards or {})) * 0.5
    end
}