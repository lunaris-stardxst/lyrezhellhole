SMODS.Joker{ --sushi
    key = "sushi",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'sushi',
        ['text'] = {
            [1] = 'α',
            [2] = 'α',
            [3] = 'α',
            [4] = 'α',
            [5] = 'α',
            [6] = '{C:inactive}\"us swedish have a pizza with banana and pineapple on it\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "lzh_other_people",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:set_edition("e_negative", true)
    end
}