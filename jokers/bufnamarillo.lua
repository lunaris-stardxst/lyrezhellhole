SMODS.Joker{ --Bufón amarillo
    key = "bufnamarillo",
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = 'Bufón amarillo',
        ['text'] = {
            [1] = 'Agrega {C:money}cuatro dólares{} cada vez que una tarjeta {C:enhanced}Golden{},',
            [2] = '{C:attention}Gold Seal{} o {C:enhanced}\"c:attebtion\"{} obtiene una puntuación'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_lzh_cattebtion"] == true or SMODS.get_enhancements(context.other_card)["m_gold"] == true or context.other_card.seal == "Gold") then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}