SMODS.Joker{ --very evil mc evilton
    key = "veryevilmcevilton",
    config = {
        extra = {
            chips = 4
        }
    },
    loc_txt = {
        ['name'] = 'very evil mc evilton',
        ['text'] = {
            [1] = '{C:red}-1{} Joker slots',
            [2] = '{C:blue}+4{} Evil Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}