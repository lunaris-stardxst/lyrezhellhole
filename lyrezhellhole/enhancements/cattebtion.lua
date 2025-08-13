SMODS.Enhancement {
    key = 'cattebtion',
    pos = { x = 2, y = 0 },
    config = {
        bonus = 25,
        mult = 5,
        p_dollars = 7,
        h_chips = 30,
        h_mult = 4,
        h_dollars = 5,
        extra = {
            x_chips = 1.5,
            x_mult = 1.5,
            retrigger_times = 2,
            x_chips = 3,
            x_mult = 1.3,
            levels = 5,
            dollars = 3
        }
    },
    loc_txt = {
        name = 'C:Attebtion',
        text = {
        [1] = 'If scored;',
        [2] = '{C:blue}+25{} Chips',
        [3] = '{X:blue,C:white}X1.5{} Chips',
        [4] = '{C:red}+5{} Mult',
        [5] = '{X:red,C:white}X1.5{} Mult',
        [6] = '{C:attention}Retrigger{} this card {C:attention}2{} times',
        [7] = '{C:money}+$7{}',
        [8] = 'Creates a random {C:planet}Planet{} card',
        [9] = 'Copies a random {C:attention}Joker{}',
        [10] = 'If held in hand;',
        [11] = '{C:blue}+30{} Chips',
        [12] = '{X:blue,C:white}X3{} Chips',
        [13] = '{C:red}+4{} Mult',
        [14] = '{X:red,C:white}X1.3{} Mult',
        [15] = '{C:money}+$5{}',
        [16] = '{C:planet}+5 Levels{} to played hand',
        [17] = 'If discarded;',
        [18] = '{C:money}+$3{}',
        [19] = 'Creates a {C:tarot}Tarot{}, {C:planet}Planet{}, {C:spectral}Spectral{},',
        [20] = 'and a {C:attention}what the fucking{} card,',
        [21] = 'Creates a random {C:dark_edition}here{} Joker'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.extra.retrigger_times = 2
            local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Planet', key_append = 'enhanced_card_planet'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
            local available_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    table.insert(available_jokers, joker)
                end
                local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker_enhanced')) or nil
                
                if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                        G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            SMODS.calculate_effect({x_chips = card.ability.extra.x_chips}, card)
            SMODS.calculate_effect({x_mult = card.ability.extra.x_mult}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and "+1 Consumable!" or nil, colour = G.C.SECONDARY_SET.Planet})
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
        end
        if context.cardarea == G.hand and context.main_scoring then
            local target_hand
                target_hand = context.scoring_name or "High Card"
            SMODS.calculate_effect({x_chips = card.ability.extra.x_chips}, card)
            SMODS.calculate_effect({x_mult = card.ability.extra.x_mult}, card)
            SMODS.calculate_effect({level_up = card.ability.extra.levels,
                level_up_hand = target_hand}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
        end
        if context.discard and context.other_card == card  then
            local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'lzh_here' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
            SMODS.calculate_effect({dollars = lenient_bignum(card.ability.extra.dollars)}, card)
            SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key_append = 'enhanced_card_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumable!", colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
            SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Planet', key_append = 'enhanced_card_planet'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumable!", colour = G.C.SECONDARY_SET.Planet})
                    end
                    return true
                end}, card)
            SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Spectral', key_append = 'enhanced_card_spectral'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumable!", colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end}, card)
            SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'what_the', key_append = 'enhanced_card_what_the'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumable!", colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
        end
    end
}