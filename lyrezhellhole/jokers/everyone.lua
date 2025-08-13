SMODS.Joker{ --@everyone
    key = "everyone",
    config = {
        extra = {
            alllzhjokers = 25
        }
    },
    loc_txt = {
        ['name'] = '@everyone',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X1{} Mult for every custom',
            [2] = '{C:attention}Joker{} in this mod',
            [3] = '{C:inactive}Currently {X:mult,C:white}X#1# {C:inactive} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 5,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.alllzhjokers}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.alllzhjokers
                }
        end
    end
}