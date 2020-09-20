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

local function create_loglimit(limit, rmstep)
    local real_rmstep = rmstep or 5
    return function(logger)
        if #logger > limit then
            for i = 0, real_rmstep do
                table.remove(logger, 1)
            end
        end
        logger.pointer = #logger
    end
end

return create_loglimit
