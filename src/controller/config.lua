  local app_lib_dir = {
    ["modules"] = "/home/app/src/modules"
  }

  local cgilua = require"cgilua"
  cgilua.addopenfunction (function ()
  	cgilua.script_vdir = cgilua.splitonlast(cgilua.urlpath):gsub("%/+", "/")
  	local package = package
  	local app = app_lib_dir[cgilua.script_vdir]
  	if app then
  		package.path = app.."/?.lua;"..app.."/?/init.lua;"..package.path
  	end
  end)
