require "TSLib"
sz = require "sz"
json = sz.json
thread = require "thread"
class = require "middleclass"
require "dateutil"
require "fileutil"
require "httputil"
require "funcutil"
require "osutil"
require "tableutil"
require "tsutil"
require "ilog"
require "State"

State.static.stateHooks = {
	{
		before = function(state) 
			--ilog(state.name.." global state before", false)
		end,
		after = function(state) 
			--ilog(state.name.." global state after", false)
		end,
		hookList = {".*"},
		whiteList = {gc.states.MainState}
	}
}

function main()
	local stateMgr = StateMgr:new("mainTask")
	stateMgr:start()
end

local status, err = tryCatch(main)
if not status then
	ilog("occur an exception causes the program crashed!")
	ilog("errInfo: "..err)
	--error(err) --throw an exception to the TouchSprite
	dialog(err, 30)
	--lua_restart()
end

