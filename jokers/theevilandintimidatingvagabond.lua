SMODS.Joker{ --the evil and intimidating vagabond
    name = "the evil and intimidating vagabond",
    key = "theevilandintimidatingvagabond",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'the evil and intimidating vagabond',
        ['text'] = {
            [1] = 'does something if more than $4'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if G.GAME.dollars > 4 then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "lmao", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
            end
        end
    end
}