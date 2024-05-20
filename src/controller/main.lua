#!/usr/bin/env cgilua.cgi
local htk = require"htk"

local LINK = htk.LINK
local SCRIPT = htk.SCRIPT
local BOX = htk.BOX
local HTML = htk.HTML
local HEAD = htk.HEAD
local META = htk.META
local UTF = htk.UTF
local TITLE = htk.TITLE
local DIV = htk.DIV
local IMG = htk.IMG
local DOCTYPE = htk.DOCTYPE
local H2 = htk.H2
local A = htk.A
local I = htk.I
local BR = htk.BR

local function include(t)
	local requests = {}
	for i, file in ipairs(t) do
      local type = file:match("^.+(%..+)$")
      local dir = type
      file = dir .. "/" .. file
			if type == "css" then
				table.insert(requests, htk.LINK{ rel = "stylesheet", type = "text/css", href = file })
			elseif type == "js" then
				table.insert(requests, htk.SCRIPT{ src = file })
			end
	end
	return BOX(requests)
end

local function html()
	return htk.HTML{
		htk.HEAD{
			htk.META{
				["http-equiv"] = "content-type",
				content = "text/html; charset=UTF-8",
			},
			include{ "style.css", },
			htk.TITLE { "Interface para Configuração de Meta-dados"},
		},
		htk.BODY {
  		DIV{
  		  style = "text-align: center;",
  		  IMG {
  		    src = "imgs/AtelieVirtual.svg"
  		  },
  		  H2 {"Texto"},
  		  A { href="files/curriculo.pdf", "Currículo" }, I { " | Meu currículo" },
  		  H2 { "Código" },
  		  A { href="http://www.github.com/rousbound/typst-lua", "typst-lua" }, I { " | Binding de typst para lua" },
  		  BR{},
  		  BR{},
  		  A { href="http://www.github.com/rousbound/cgilua-cli", "cgilua-cli" }, I { " | Interface CLI para CGILua" },
    		H2 { "Som", },
    		A { href = "files/If.mp3", "If - Pink Floyd" }, I{" | Cover"},
  		  H2{"Vídeo"}, A { href = "files/valvulas_do_gozo.mp4", "Válvulas do Gozo" }, I{" | Composição"}
  	  }
		}
}
end

cgilua.put(html())
