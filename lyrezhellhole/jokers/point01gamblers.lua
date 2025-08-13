SMODS.Joker{ --0.01% of gamblers
    key = "point01gamblers",
    config = {
        extra = {
            pointgamblermult = 30,
            pointgamblerchips = 30
        }
    },
    loc_txt = {
        ['name'] = '0.01% of gamblers',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{X:blue,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = "lzh_gambling",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.pointgamblermult, card.ability.extra.pointgamblerchips}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.pointgamblermult = (card.ability.extra.pointgamblermult) + pseudorandom('pointgamblermult_c465faaf', -30, 30)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.pointgamblerchips = (card.ability.extra.pointgamblerchips) + pseudorandom('pointgamblerchips_ba2f31e9', -30, 30)
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.pointgamblermult,
                    extra = {
                        x_chips = card.ability.extra.pointgamblerchips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}