SMODS.Joker{ --0.1% of gamblers
    name = "0.1% of gamblers",
    key = "_01ofgamblers",
    config = {
        extra = {
            gamblermult = 300,
            gamblerchips = 300
        }
    },
    loc_txt = {
        ['name'] = '0.1% of gamblers',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult',
            [2] = '{C:blue}+#2# {}Chips'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    cost = 5,
    rarity = "lzh_gambling",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.gamblermult, card.ability.extra.gamblerchips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.gamblerchips,
                    extra = {
                        mult = card.ability.extra.gamblermult
                        }
                }
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.gamblermult = (card.ability.extra.gamblermult) + pseudorandom('gamblermult_6b340885', -300, 300)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.gamblerchips = (card.ability.extra.gamblerchips) + pseudorandom('gamblerchips_6d8dad4e', -300, 300)
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
    end
}