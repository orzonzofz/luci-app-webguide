--[[
Description: Editor's info in the top of the file
Author: p1ay8y3ar
Date: 2021-10-10 21:04:06
LastEditor: p1ay8y3ar
LastEditTime: 2021-10-10 22:54:06
Email: p1ay8y3ar@gmail.com
--]]
--[[
Description: Editor's info in the top of the file
Author: p1ay8y3ar
Date: 2021-10-10 21:04:06
LastEditor: p1ay8y3ar
LastEditTime: 2021-10-10 21:04:07
Email: p1ay8y3ar@gmail.com
--]]
--[[
Description: Editor's info in the top of the file
Author: p1ay8y3ar
Date: 2021-10-10 21:04:06
LastEditor: p1ay8y3ar
LastEditTime: 2021-10-10 21:04:06
Email: p1ay8y3ar@gmail.com
--]]
module("luci.controller.webguide", package.seeall)

function index()
        entry({"admin", "services", "webguide"}, cbi("webguide"), _("WebGuide"), 1)
        end