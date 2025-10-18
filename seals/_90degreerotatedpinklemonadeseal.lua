SMODS.Seal {
    key = '_90degreerotatedpinklemonadeseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult = 3,
            x_mult = 1.1,
            chips = 315,
            x_chips = 1.1,
            retrigger_times = 1,
            dollars = 2,
            levels = 2,
            dollars = 1,
            card_draw = 17,
            mult = 2,
            x_mult = 1.5,
            chips = 20,
            x_chips = 1.5,
            dollars = 5,
            levels = 1
        }
    },
    badge_colour = HEX('fab9af'),
   loc_txt = {
        name = '90 degree rotated pink lemonade seal',
        label = '90 degree rotated pink lemonade seal',
        text = {
        [1] = 'When Played;',
        [2] = '{C:red}+3{} Mult',
        [3] = '{X:red,C:white}X1.1{} Mult',
        [4] = '{C:blue}+15{} Chips',
        [5] = '{X:blue,C:white}X1.1{} Chips',
        [6] = '{C:attention}Retrigger{} this card once',
        [7] = '{C:money}+$2{}',
        [8] = 'Create a Random {C:red}EVIL CARD{}',
        [9] = '{C:planet}+2{} Hand Levels',
        [10] = 'On discard;',
        [11] = '{C:money}+$1{}',
        [12] = 'Create a random {C:spectral}Spectral{} card',
        [13] = 'Create a random {C:blue}Gambling{} Joker',
        [14] = 'Draw {C:attention}17{} cards to hand',
        [15] = 'If held in hand;',
        [16] = '{C:red}+2{} Mult',
        [17] = '{X:red,C:white}X1.5{} Mult',
        [18] = '{C:blue}+20 {}Chips',
        [19] = '{X:blue,C:white}X1.5{} Chips',
        [20] = '{C:money}+$5{}',
        [21] = '{C:planet}+1{} Hand levels',
        [22] = '{C:attention}Copies{} a random Joker'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            local target_hand
                target_hand = context.scoring_name or "High Card"
            SMODS.calculate_effect({mult = card.ability.seal.extra.mult}, card)
            SMODS.calculate_effect({x_mult = card.ability.seal.extra.x_mult}, card)
            SMODS.calculate_effect({chips = card.ability.seal.extra.chips}, card)
            SMODS.calculate_effect({x_chips = card.ability.seal.extra.x_chips}, card)
            SMODS.calculate_effect({dollars = lenient_bignum(card.ability.seal.extra.dollars)}, card)
            SMODS.calculate_effect({func = function()
    for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'evil_cards', })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                  end}, card)
            SMODS.calculate_effect({level_up = card.ability.seal.extra.levels,
                level_up_hand = target_hand}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
        end
        if context.discard and context.other_card == card then
            local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'lzh_gambling' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
            if G.GAME.blind.in_blind then
    SMODS.draw_cards(card.ability.seal.extra.card_draw)
  end
            SMODS.calculate_effect({dollars = lenient_bignum(card.ability.seal.extra.dollars)}, card)
            SMODS.calculate_effect({func = function()
    for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                  end}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.seal.extra.card_draw).." Cards Drawn", colour = G.C.BLUE})
        end
        if context.cardarea == G.hand and context.main_scoring then
            local target_hand
                target_hand = context.scoring_name or "High Card"
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
            SMODS.calculate_effect({mult = card.ability.seal.extra.mult}, card)
            SMODS.calculate_effect({x_mult = card.ability.seal.extra.x_mult}, card)
            SMODS.calculate_effect({chips = card.ability.seal.extra.chips}, card)
            SMODS.calculate_effect({x_chips = card.ability.seal.extra.x_chips}, card)
            SMODS.calculate_effect({dollars = lenient_bignum(card.ability.seal.extra.dollars)}, card)
            SMODS.calculate_effect({level_up = card.ability.seal.extra.levels,
                level_up_hand = target_hand}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
        end
    end
}