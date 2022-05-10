module("luci.controller.redsocks2", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/redsocks2") then
		return
	end

	entry({"admin", "services", "redsocks2"}, alias("admin", "services", "redsocks2", "general"), _("Redsocks2"))
	entry({"admin", "services", "redsocks2", "general"}, cbi("redsocks2/general"), _("General Settings"), 10).leaf = true
	entry({"admin", "services", "redsocks2", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	local listen_port = luci.sys.exec("uci get redsocks2.@redsocks2_redirect[0].local_port")
	e.running = string.len(luci.sys.exec("netstat -nlp | grep " .. listen_port))>0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
