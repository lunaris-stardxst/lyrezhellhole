SMODS.Joker{ --@everyone
    name = "@everyone",
    key = "everyone",
    config = {
        extra = {
            Xmult = 10
        }
    },
    loc_txt = {
        ['name'] = '@everyone',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X1{} Mult for every custom',
            [2] = '{C:attention}Joker{} in this mod',
            [3] = '{C:inactive}Currently {X:mult,C:white}X16 {C:inactive} Mult'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 5,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}