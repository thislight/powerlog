local powerlog = require "powerlog"
local stdout = require "powerlog.stdout"
local create_loglimit = require "powerlog.loglimit"

table.insert(powerlog.receivers, stdout())

local logger = powerlog:create("example")
logger.accept_level = 50
table.insert(logger.loghooks, create_loglimit(1, 1))

logger:debug("Test")

local _, err = pcall(function() error("simple error") end)
logger:error("Test", nil, err)

local simple_table = {
    t = {},
    n = 123456,
}

logger:debug("Test", simple_table)

assert(#logger <= 1, "the records length > 1")
logger:debug('Yeeeeeeeeeah')
assert(#logger <= 1, "the records length > 1")
logger:debug("current logger records length", #logger)
