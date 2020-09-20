package = "powerlog"
version = "git-0"
source = {
   url = "git+https://github.com/thislight/powerlog.git"
}
description = {
   homepage = "https://github.com/thislight/powerlog",
   license = "GPLv3",
   summary = "Another logging library for Lua 5.3+",
   detailed = [[Powerlog provides a simple logger and some tools for logging.]]
}
dependencies = {
   "lua >=5.3, <=5.4"
}
build = {
   type = "builtin",
   modules = {
      powerlog = "powerlog.lua",
      ["powerlog.loglimit"] = "powerlog/loglimit.lua",
      ["powerlog.stdout"] = "powerlog/stdout.lua",
      ["powerlog.topstring"] = "powerlog/topstring.lua"
   }
}
