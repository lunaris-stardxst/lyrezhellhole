SMODS.Joker{ --average linux modding-chat moment
    key = "almcm",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'average linux modding-chat moment',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if your OS is {C:attention}Linux{}',
            [2] = '{C:inactive}\"STOP POSTING ABOUT LINUX, IM TIRED OF SEEING IT!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if love.system.getOS() == "Linux" then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}