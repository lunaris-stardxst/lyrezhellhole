SMODS.Joker{ --X2 EXP ON WEEJENDS!
    key = "x2exponweejends",
    config = {
        extra = {
            currentweekday = 0,
            currentmonth = 0,
            currentmoney = 0,
            currentday = 0,
            xchips = 2,
            hypermult_n = 5,
            hypermult_arrows = 3
        }
    },
    loc_txt = {
        ['name'] = 'X2 EXP ON WEEJENDS!',
        ['text'] = {
            [1] = '{X:blue,C:white}X2{} Chips if it is the weekend or Friday',
            [2] = '{X:money,C:white}X$2{} if it is summer vacation',
            [3] = '{X:dark_edition,C:red}^^^5{} Mult if it is Christmas'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (os.date("*t", os.time()).wday >= 6 or os.date("*t", os.time()).wday == 1) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            elseif (os.date("*t", os.time()).month >= 6 and os.date("*t", os.time()).month <= 9) then
                return {
                    func = function()
                    local target_amount = (G.GAME.dollars) * 2
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring((G.GAME.dollars) * 2), colour = G.C.MONEY})
                    return true
                end
                }
            elseif (os.date("*t", os.time()).day == 25 and os.date("*t", os.time()).month == 12) then
                return {
                    hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.hypermult_n
}
                }
            end
        end
    end
}