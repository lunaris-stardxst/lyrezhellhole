SMODS.Joker{ --whos harrison
    name = "whos harrison",
    key = "whosharrison",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'whos harrison',
        ['text'] = {
            [1] = 'gives {C:money}C:Money{} if you found {C:attention}harrison{}'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 15,
    rarity = "lzh_coulibiac",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 0
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_lzh_harrison" then
              return true
          end
      end
      return false
  end)() then
            end
        end
    end
}