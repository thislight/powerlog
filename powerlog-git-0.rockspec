package = "powerlog"
version = "git-0"
source = {
   url = "git+https://github.com/thislight/powerlog.git"
}
description = {
   homepage = "https://github.com/thislight/powerlog",
   license = "GPLv3"
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
