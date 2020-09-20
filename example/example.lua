-- Copyright (C) 2020 thisLight
-- 
-- This file is part of powerlog.
-- 
-- powerlog is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- powerlog is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with powerlog.  If not, see <http://www.gnu.org/licenses/>.

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
