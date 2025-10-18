SMODS.Joker{ --John Print
    key = "johnprint",
    config = {
        extra = {
            Xmult = 1.5,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'John Print',
        ['text'] = {
            [1] = 'When Blind selected,',
            [2] = 'Create a {C:attention}Misprint{}',
            [3] = 'Add a random {C:enhanced}Misprinted{} {C:attention}Misprint Seal{} Card to deck',
            [4] = '{X:red,C:white}X1.5{} Mult every time a {C:enhanced}Misprinted{} Card scores',
            [5] = '{C:inactive}\"he invented the printing press\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "lzh_missed_print",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                
      local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = 
    G.P_CENTERS.m_lzh_misprinted
                }, G.discard, true, false, nil, true)
      new_card:set_seal("lzh_misprintseal", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "Added Card to Hand!",
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_misprint' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lzh_misprinted"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}