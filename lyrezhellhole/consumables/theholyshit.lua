SMODS.Consumable {
    key = 'theholyshit',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    loc_txt = {
        name = 'the [[HOLY SHIT!!!]]',
        text = {
        [1] = 'WHO THE {X:legendary,C:green}FUCK{} IS FEEDINGTHE JOKERS {C:attention}CAT FOOD{}???!'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', key = 'j_lzh_astro' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}