SMODS.Joker{ --the billionare
    key = "bill",
    config = {
        extra = {
            dollars = 5,
            dollars2 = 8
        }
    },
    loc_txt = {
        ['name'] = 'the billionare',
        ['text'] = {
            [1] = '{C:money}+$5{} every time a card is scored.',
            [2] = '{X:money,C:white}=$8{} at end of round.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    local target_amount = card.ability.extra.dollars2
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars2), colour = G.C.MONEY})
                    return true
                end
                }
        end
    end
}