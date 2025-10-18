SMODS.Joker{ --candycane
    key = "candycane",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'candycane',
        ['text'] = {
            [1] = 'Create a {C:attention}Uncommon Tag{} when {C:attention}Blind{} selected',
            [2] = 'Create a {C:attention}Rare Tag{} when {C:attention}Boss Blind{} selected',
            [3] = '{C:inactive}\"blorble\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
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
    pools = { ["lzh_lzh_jokers"] = true }
}