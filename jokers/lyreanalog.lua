SMODS.Joker{ --Lyre Analog
    name = "Lyre Analog",
    key = "lyreanalog",
    config = {
        extra = {
            lyrexchips = 1,
            lyrexmult = 5,
            what_the = 0,
            coulibiac = 0,
            j_joker = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lyre Analog',
        ['text'] = {
            [1] = 'man i just wanna get this update out fast so i guess {X:blue,C:white} X0.1 {}  Chips every time a card scores and {X:red,C:white}X1{} Mult every ttime you enter a blind, also creates a what the fucking card and coulibiac joker at end of round',
            [2] = '{C:inactive}(Currently {X:blue,C:white}X#1#{C:inactive} Chips and {X:red,C:white}{X:red,C:white}X#2#{C:inactive} Mult.)'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 5,
    rarity = "lzh_lyre",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.lyrexchips, card.ability.extra.lyrexmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                card.ability.extra.lyrexchips = (card.ability.extra.lyrexchips) + 0.1
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.lyrexmult = (card.ability.extra.lyrexmult) + 1
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    x_chips = card.ability.extra.lyrexchips,
                    extra = {
                        Xmult = card.ability.extra.lyrexmult
                        }
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()local created_consumable = false
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
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                    extra = {
                        func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                    local tag = Tag(selected_tag)
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                    return true
                end,
                            message = "Created Tag!",
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Joker', rarity = 'lzh_coulibiac' })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}