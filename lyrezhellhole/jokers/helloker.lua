SMODS.Joker{ --the hell joker
    key = "helloker",
    config = {
        extra = {
            odds = 4,
            odds2 = 13,
            odds3 = 33,
            odds4 = 300,
            what_the = 0,
            coulibiac = 0,
            ignore = 0,
            gambling = 0,
            lyre = 0
        }
    },
    loc_txt = {
        ['name'] = 'the hell joker',
        ['text'] = {
            [1] = 'When hand played:',
            [2] = '{C:green}1 in 4{} chance to create a {C:attention}what the fucking{} card.',
            [3] = '{C:green}1 in 13{} chance to create a {C:attention}Coulibiliac{} Joker.',
            [4] = '{C:green}3 in 33{} chance to create a {C:clubs}gambling{} Joker.',
            [5] = '{C:green}26 in 300{} chance to create {X:legendary,C:white}Lyre{}.',
            [6] = '{C:inactive}\"holy [[SH1FT]] its the mod tag\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 13,
    rarity = "lzh_here",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_87f780ed', 1, card.ability.extra.odds, 'j_lzh_helloker') then
                      local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'what_the', key = nil, key_append = 'joker_forge_what_the'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_consumable') or nil, colour = G.C.PURPLE})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_1f9bd34d', 1, card.ability.extra.odds2, 'j_lzh_helloker') then
                      local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'lzh_coulibiac' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_b351dd06', 3, card.ability.extra.odds3, 'j_lzh_helloker') then
                      local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'lzh_gambling' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_691cdee0', 26, card.ability.extra.odds4, 'j_lzh_helloker') then
                      local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'lzh_lyre' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                  end
            end
        end
    end
}