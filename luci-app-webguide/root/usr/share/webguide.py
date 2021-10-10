'''
Description: Editor's info in the top of the file
Author: p1ay8y3ar
Date: 2021-10-10 15:45:35
LastEditor: p1ay8y3ar
LastEditTime: 2021-10-11 00:04:38
Email: p1ay8y3ar@gmail.com
'''
'''
dict(config,list(dict(name,)dict(other,)dict(options,list(list(),list()))))
'''
import json
# 写入到js文件中
pins = []
apps = []

newf = open("/etc/config/webguide", 'r')
lines = newf.readlines()
pins_flag = False
app_flag = False
pin_index = -1
app_index = -1
for idx, line in enumerate(lines):
    if "User" in line:
        value_list = line.strip().split(" ")
        user = value_list[-1]
    elif "Title" in line:
        value_list = line.strip().split(" ")
        title = value_list[-1]
    elif "Icp" in line:
        value_list = line.strip().split(" ")
        icp = value_list[-1]
    elif line.startswith("config") and "static" not in line:

        value_list = line.strip().split(" ")
        if "bottom_navi" in value_list:
            pin_index += 1
            pins.append({})
            pins_flag = True
            app_flag = False
        elif "page_navi" in value_list:
            app_index += 1
            apps.append({})
            pins_flag = False
            app_flag = True
    elif not line.startswith("config"):
        value_list = line.strip().split(" ")
        if len(value_list) < 2: continue

        key = value_list[1]
        value = value_list[2][1:-1]
        if "option svg" in line:
            value = line.strip().replace("option svg", "")
            value = value[value.index("<svg"):value.index("</svg>") + 6]
        if pins_flag:
            pins[pin_index][key] = value
        elif app_flag:
            apps[app_index][key] = value

with open("/www/webguide/index.js", "w+") as f:
    f.write('var title = {};\n'.format(title))
    f.write('var user = {};\n'.format(user))
    f.write('var icp = {};\n'.format(icp))
    jstr = json.dumps(pins, indent=4, ensure_ascii=False)
    f.write("var pins = ")
    f.write(jstr)
    f.write('\n')
    jstr_app = json.dumps(apps, indent=4, ensure_ascii=False)

    f.write("var apps = ")
    f.write(jstr_app)
    f.write('\n')