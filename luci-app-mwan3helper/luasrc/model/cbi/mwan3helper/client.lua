m = Map("mwan3helper")
m.title	= translate("MWAN3 Helper")
m.description = translate("MWAN3 Helper generate IPSets")

m:section(SimpleSection).template  = "mwan3helper/mwan3helper_status"

s = m:section(TypedSection, "mwan3helper")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enable GFW IPSet"))
o.rmempty = false
o.description = translate("启用 DNS 防污染并打开GFW IPSet（与SSR的GFW列表模式不能同时开启）")

o = s:option(Value, "dns", translate("Anti-pollution DNS Server"))
o:value("208.67.222.222:443", translate("OpenDNS (208.67.222.222:443)"))
o:value("208.67.220.220:443", translate("OpenDNS (208.67.220.220:443)"))
o:value("8.8.4.4:53", translate("Google Public DNS (8.8.4.4:53)"))
o:value("8.8.8.8:53", translate("Google Public DNS (8.8.8.8:53)"))
o:value("1.1.1.1:53", translate("Cloudflare DNS (1.1.1.1:53)"))
o.default="208.67.222.222:443"

return m
