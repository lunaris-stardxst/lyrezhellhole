SMODS.Rarity {
    key = "flomp",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('002234'),
    loc_txt = {
        name = "FLOMP"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "coulibiac",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('e69420'),
    loc_txt = {
        name = "Coulibiac"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "sigmagreek",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.5,
    badge_colour = HEX('4aa834'),
    loc_txt = {
        name = "Σ"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "here",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('994466'),
    loc_txt = {
        name = "here"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}