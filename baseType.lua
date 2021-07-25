#!/usr/local/bin/lua

--[[ 
    记录lua中的基本数据类型
    boolean
    string
    number
    nil  表示一个无效值
    function  函数也是一种类型
    userdata  表示任意C中的数据结构
    thread  独立线程
    table  关联数组，
 ]]

-- nil
print(nil)
-- nil

-- 对于数据类型，nil还有删除的作用，例如：
tab1 = {
    key1 = "val1",
    key2 = "val2",
    key3 = 1,
    "valu3"
}
for k, v in pairs(tab1) do
    print(k .. " -- " .. v)
end

tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " -- " .. v)
end

-- nil 做比较时，对比的是字符串
print(type(x) == nil) -- false
print(type(x) == "nil") -- true

-- boolean ，只有两个值，true、false，Lua 把 false 和 nil 看作是 false，其他的都为 true，数字 0 也是 true
if false or nil then
    print("one true")
else
    print("all false")
end

if 0 then 
    print ("0 is true")
else 
    print ("0 is false")
end

-- number ,lua只有一种数字类型，是double-双精度类型（有点类似js/ts）
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

-- string 单引号和双引号都可以（类似js/ts）
str1 = '1'
str2 = '2'
-- 或者两个方括号表示一块字符串
html = [[
    <html>
        <body>
            <p>hhhhhh</p>
        </body>
    </html>
]]

print (html)

-- 在对一个字符串做计算时，lua会自动转换number
print(2 + "2") -- 4
print("2" + "2") -- 4

-- print ("error" + 10) -- error
-- 字符串连接使用..
print('d' .. 'dd' .. "d")
-- 使用# 计算字符串长度
str4 = "dfasdfdsaf"
print(#str4)

-- table，使用构造表达式来创建
a = {}
a2 = {key = 2, 2,3,4,5}
-- key可以是索引，索引默认从1开始，也可以是字符串
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end

-- function 在lua中被看作第一类值，有点一等公民的感觉，可以存在变量汇总
fun1 = function (tab, fun)
    for key, value in pairs(tab) do
        fun(key, value)
    end
end
fun1({1,2,3,4,5}, function (k, v)
    print(k .. v)
end)

-- thread 主线程被称作协同程序（coroutine)和thread差不多，有独立的栈、局部变量、指令指针，可以跟其他协同程序
-- 共享全局变量和大部分东西
-- 区别：线程可以由多个，协同线程只能有一个，并且处于运行状态的协程线程只有被挂起时才会暂停

--[[ 
    userdata，自定义类型，主要存储C/C++语言库中所创建的类型，通常是struct和指针
 ]]