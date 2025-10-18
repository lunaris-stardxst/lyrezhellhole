SMODS.Joker{ --banan
    key = "banan",
    config = {
        extra = {
            potassum = 3,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'banan',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult',
            [2] = '{C:green}1 in 6{} chance to overdose on potassiun',
            [3] = '{C:inactive}\"potassum\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
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
            if true then
                return {
                    Xmult = card.ability.extra.potassum
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_ac96245a', 1, card.ability.extra.odds, 'j_lzh_banan', false) then
              SMODS.calculate_effect({func = function()
                
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
            end}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}