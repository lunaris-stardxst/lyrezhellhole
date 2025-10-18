SMODS.Shader({ key = 'overexposed', path = 'overexposed.fs' })

SMODS.Edition {
    key = 'misprintedition',
    shader = 'overexposed',
    config = {
        extra = {
            x_mult_min = 0,
            x_mult_max = 23
        }
    },
    in_shop = false,
    extra_cost = 3,
    apply_to_float = true,
    badge_colour = HEX('435b7a'),
    sound = { sound = "negative1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Misprint',
        label = 'Misprint',
        text = {
        [1] = '{X:red,C:white}X0-23{} Mult'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return { x_mult = pseudorandom('x_mult_d0e5a9ff', card.edition.extra.x_mult_min, card.edition.extra.x_mult_max) }
        end
    end
}