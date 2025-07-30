SMODS.Joker{ --hambgurger.jpeg
    name = "hambgurger.jpeg",
    key = "hambgurger",
    config = {
        extra = {
            hamburgroundleft = 4.327,
            j_joker = 0,
            constant = 0
        }
    },
    loc_txt = {
        ['name'] = 'hambgurger.jpeg',
        ['text'] = {
            [1] = 'creeit a rnadom {C:attention}jokre{} when blind slecetd',
            [2] = '{C:hearts}destoid{}after {C:attention}#1#{} ronds'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 5,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.hamburgroundleft}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if (card.ability.extra.hamburgroundleft or 0) <= 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            else
                return {
                    func = function()
                    card.ability.extra.hamburgroundleft = math.max(0, (card.ability.extra.hamburgroundleft) - 1)
                    return true
                end,
                    message = "mmph... hambgurgre..."
                }
            end
        end
        if context.setting_blind and not context.blueprint then
                local target_card = context.other_card
      local function juice_card_until_(card, eval_func, first, delay) -- balatro function doesn't allow for custom scale and rotation
          G.E_MANAGER:add_event(Event({
              trigger = 'after',delay = delay or 0.1, blocking = false, blockable = false, timer = 'REAL',
              func = (function() if eval_func(card) then if not first or first then card:juice_up(card.ability.extra.hamburgroundleft, card.ability.extra.hamburgroundleft) end;juice_card_until_(card, eval_func, nil, 0.8) end return true end)
          }))
      end
                return {
                    func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "hambgryg", colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
                        local eval = function() return not G.RESET_JIGGLES end
                        juice_card_until_(card, eval, true)
                        return true
                    end,
                        colour = G.C.WHITE
                        }
                }
        end
    end
}