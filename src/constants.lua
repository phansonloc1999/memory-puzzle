COLORS = {
    RED = { 255, 0, 0 },
    GREEN = { 0, 255, 0 },
    BLUE = { 0, 0, 255 },
    YELLOW = { 255, 255, 0 },
    ORANGE = { 255, 139, 0 },
    PURPLE = { 128, 0, 128 },
    BROWN = { 165, 42, 42 },
    WHITE = { 255, 255, 255 }
}

CURSOR = { WIDTH = 5, HEIGHT = 5 }

gSounds = {
    ["select"] = love.audio.newSource("assets/select.wav", "static"),
    ["matched"] = love.audio.newSource("assets/matched.wav", "static"),
    ["mismatched"] = love.audio.newSource("assets/mismatched.wav", "static")
}

gSounds["select"]:setVolume(1)