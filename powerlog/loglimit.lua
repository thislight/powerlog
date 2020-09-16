

local function create_loglimit(limit, rmstep)
    local real_rmstep = rmstep or 5
    return function(logger)
        if #logger > limit then
            table.move(logger, real_rmstep+1, #logger, 1)
        end
    end
end

return create_loglimit
