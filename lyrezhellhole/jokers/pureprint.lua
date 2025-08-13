SMODS.Joker{ --Pureprint
    name = "Pureprint",
    key = "pureprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pureprint',
        ['text'] = {
            [1] = 'Copies {C:attention}every{} Joker'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 20,
    rarity = "lzh_pure",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        local effects = {}
        for i, v in ipairs(G.jokers.cards) do
            if i > 5 then break end
            if v ~= card then
                local effect = SMODS.blueprint_effect(card, v, context)
                if effect then table.insert(effects, effect) end
            end
        end
        return SMODS.merge_effects(effects)
    end
}