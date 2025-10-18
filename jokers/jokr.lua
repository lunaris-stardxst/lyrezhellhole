SMODS.Joker{ --jokr
    key = "jokr",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'jokr',
        ['text'] = {
            [1] = '{C:attention}+1{} joker slot',
            [2] = 'create a copy of this card when a card scores'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_lzh_jokr" then
                        target_joker = joker
                        break
                    end
                end
                
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "jokr", colour = G.C.GREEN})
                end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_lzh_jokr" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_lzh_jokr" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end