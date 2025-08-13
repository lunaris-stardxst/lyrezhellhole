SMODS.Booster {
    key = 'evil_arcana_pack',
    loc_txt = {
        name = "EVIL Arcana PAck",
        text = {
            "A custom booster pack with unique cards."
        },
        group_name = "EVIL Arcana PAck"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'fair_and_just_pack',
    loc_txt = {
        name = "fair and just pack",
        text = {
            "Choose 1 of 2 FLOMP Jokers"
        },
        group_name = "k_flomp"
    },
    config = { extra = 2, choose = 1 },
    cost = 7,
    weight = 0.1,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'FLOMP',
    group_key = "k_flomp",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'jokerslop_pack',
    loc_txt = {
        name = "jokerslop pack",
        text = {
            "what the FUCK are they feeding these jokers",
            "(Choose 1 of 3)"
        },
        group_name = "k_what_the"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'what the fucking',
    group_key = "k_what_the",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Tarot",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ff0000"))
        ease_background_colour({ new_colour = HEX('ff0000'), special_colour = HEX("000000"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'starter_pack',
    loc_txt = {
        name = "Starter Pack",
        text = {
            "Choose 5 of 10 Jokers to truly start your run!"
        },
        group_name = "Starter Pack"
    },
    config = { extra = 10, choose = 5 },
    cost = 10,
    weight = 3.7,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("4a90e2"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
