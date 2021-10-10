--[[
Description: Editor's info in the top of the file
Author: p1ay8y3ar
Date: 2021-10-10 21:04:41
LastEditor: p1ay8y3ar
LastEditTime: 2021-10-11 00:10:33
Email: p1ay8y3ar@gmail.com
--]]


require("luci.sys")
appname='webguide'
m=Map(appname)

s=m:section(TypedSection,"static","")
s.addremove=false
s.anonymous=true

title=s:option(Value,"Title",translate("title"))
user=s:option(Value,"User",translate("username"))
icp=s:option(Value,"Icp",translate("information"))

---- 底部4个固定导航信息

s = m:section(TypedSection, "bottom_navi", "", "<font color='red'>" .. translate("Fixed bottom navigation bar") .. "</font>")
s.addremove = false
s.anonymous = true
s.template = "cbi/tblsection"
o = s:option(Value, "txt", translate("Sitename"))
o.width = "auto"
o.rmempty = false

o = s:option(Value, "url", translate("web url"))
o.width = "auto"
o.rmempty = false

o = s:option(Value, "svg", translate("svg url"))
o.width = "auto"
o.rmempty = false

---- 主页面的导航设置

s = m:section(TypedSection, "page_navi", "", "<font color='red'>" .. translate("Page navigation settings") .. "</font>")
s.addremove = true
s.anonymous = true
s.sortable = true
s.template = "cbi/tblsection"
o = s:option(Value, "txt", translate("Sitename"))
o.width = "auto"
o.rmempty = false

o = s:option(Value, "url", translate("web url"))
o.width = "auto"
o.rmempty = false

o = s:option(Value, "svg", translate("svg url"))
o.width = "auto"
o.rmempty = false

local apply = luci.http.formvalue("cbi.apply")
if apply then
    luci.sys.exec("python /usr/share/webguide.py > /dev/null 2>&1")
end
return m