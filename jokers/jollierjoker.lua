SMODS.Joker{ --jollier joker
    key = "jollierjoker",
    config = {
        extra = {
            pairlevel = 0
        }
    },
    loc_txt = {
        ['name'] = 'jollier joker',
        ['text'] = {
            [1] = '{C:red}+8{} Mult for every level in {C:attention}Pair{}',
            [2] = 'if played hand is a {C:attention}Pair{}',
            [3] = '{C:inactive}\"jollyest joker from lunazbasement died of heat stroke.\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["lzh_lzh_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Pair"]) then
                return {
                    mult = (G.GAME.hands['Pair'].level) * 8
                }
            end
        end
    end
}