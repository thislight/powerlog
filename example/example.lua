local powerlog = require "powerlog"
local stdout = require "powerlog.stdout"

table.insert(powerlog.receivers, stdout())

local logger = powerlog:create("example")
logger.accept_level = 50

logger:debug("Test")

local _, err = pcall(function() error("simple error") end)
logger:error("Test", nil, err)

local simple_table = {
    t = {},
    n = 123456,
}

logger:debug("Test", simple_table)
