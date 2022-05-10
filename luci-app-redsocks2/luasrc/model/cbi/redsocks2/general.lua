
m=Map("redsocks2",translate("Redsocks2 - General Settings"),translatef("A HTTP,HTTPS,SOCKS4,SOCKS5 Proxy"))

m:section(SimpleSection).template  = "redsocks2/status"

s=m:section(TypedSection,"redsocks2_base",translate("Basic Settings"))
s.anonymous=true

o=s:option(Flag,"enabled",translate("Enable"))
o.default = "0"

o=s:option(ListValue,"loglevel",translate("Log Level"))
o:value("debug")
o:value("info")
o:value("off")

s=m:section(TypedSection,"redsocks2_redirect",translate("Proxy Settings"))
s.anonymous=true
s.addremove=false

o=s:option(Value,"local_ip",translate("Local IP"))
o.datatype="ip4addr"

o=s:option(Value,"local_port",translate("Local Port"))
o.datatype="uinteger"

o=s:option(Value,"server_ip",translate("Proxy Server IP"))
o.datatype="ip4addr"

o=s:option(Value,"server_port",translate("Proxy Server Port"))
o.datatype="uinteger"

o=s:option(ListValue,"proxy_type",translate("Proxy Server Type"))
o:value("socks5",translate("Socks5"))
o:value("socks4",translate("Socks4"))
o:value("http-connect",translate("Http-connect"))
o:value("http-relay",translate("http-relay"))

o=s:option(Value,"username",translate("Username"))

o=s:option(Value,"password",translate("Password"))
o.password=true

o=s:option(Flag,"enipset",translate("Enable Ipset Mode"))
o.default = "0"
o.rmempty=true
o.default=true

o=s:option(Value,"ipsetname",translate("Ipset name"))
o:depends({enipset="1"})
o.default = "cn"
o.description =translate("Ipset connect through a proxy")

o=s:option(Flag,"selfproxy",translate("Enable self proxy"))
o.default = "0"
o.rmempty=true
o.default=true

s=m:section(TypedSection,"redsocks2_tcpdns",translate("TCP DNS Settings"))
s.anonymous=true
s.addremove=false

o=s:option(Flag,"enabled",translate("Enable"))
o.default = "0"

o=s:option(Value,"local_dns",translate("Local DNS"))
o:depends({enabled="1"})
o.placeholder = "127.0.0.1:5053"
o.default     = "127.0.0.1:5053"

o=s:option(DynamicList,"server_dns",translate("Server DNS"))
o:depends({enabled="1"})
o.placeholder = "208.67.222.222:443"
o.default     = "208.67.222.222:443"

o=s:option(Flag,"throughproxy",translate("Connect through a proxy"))
o:depends({enabled="1"})

local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/redsocks2 restart >/dev/null 2>&1 &")
end

return m