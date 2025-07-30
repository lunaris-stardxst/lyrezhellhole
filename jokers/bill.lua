SMODS.Joker{ --the billionare
    name = "the billionare",
    key = "bill",
    config = {
        extra = {
            dollars = 8
        }
    },
    loc_txt = {
        ['name'] = 'the billionare',
        ['text'] = {
            [1] = '{C:money}+$5{} every time a card is scored.',
            [2] = '{X:money,C:white}=$8{} at end of round.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 5,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}