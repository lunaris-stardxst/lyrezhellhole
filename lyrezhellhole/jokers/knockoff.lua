SMODS.Joker{ --shitty knockoff
    key = "knockoff",
    config = {
        extra = {
            knockoffdiscount = 33.333,
            rerollknockoff = 3
        }
    },
    loc_txt = {
        ['name'] = 'shitty knockoff',
        ['text'] = {
            [1] = 'All items are {C:money}#1#%{} off,',
            [2] = 'Gain {C:attention}#2#{} free Rerolls every shop'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.knockoffdiscount, card.ability.extra.rerollknockoff}}
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        SMODS.change_free_rerolls(card.ability.extra.rerollknockoff)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        SMODS.change_free_rerolls(-(card.ability.extra.rerollknockoff))
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_lzh_knockoff")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then self.cost = math.max(0, math.floor(self.cost * (1 - (card.ability.extra.knockoffdiscount) / 100))) end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end