SMODS.Joker{ --Everyone Is Here
    key = "everyoneishere",
    config = {
        extra = {
            eiheemult = 1.75,
            hypermult_arrows = 2
        }
    },
    loc_txt = {
        ['name'] = 'Everyone Is Here',
        ['text'] = {
            [1] = '{X:dark_edition,C:red}^^0.01{} Mult for EVERY',
            [2] = 'item in {X:legendary,C:white}lyrezhellhole{}',
            [3] = '{C:inactive}(Currently {X:dark_edition,C:red}^^#1#{} {C:inactive}Mult){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
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
        
        return {vars = {card.ability.extra.eiheemult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.eiheemult
}
                }
        end
    end
}