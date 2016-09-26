#Ruby 正则表达式类Regexp 
#1.正则表达式的写法与用法 使用//将正则表达式括起来 
#创建方法 使用Regexp#new(str) %r特殊语法（模式中包含/时比较方便。%r(模式)、%r<模式>、%r|模式|、%r!模式!）

#2.正则表达式的模式与匹配 /正则表达式模式/(加i不区分大小写) =~ 希望匹配的字符串 匹配成功返回首次成功匹配的位置，否则返回nil
#匹配普通字符
p(/test/ =~ "ruby test test")
p(/test/i =~ "ruby Test")
p(/测试/ =~ "ruby 测试")
#匹配行首和行尾	 使用模式/^正则表达式模式$/ 	
#^（匹配行首）$（匹配行尾）特殊意义的字符并不用于匹配^$字符被称为元字符 元字符前加\会转义，不再具有元字符功能，本身会用于匹配
#匹配任意字符的.元字符,1个.代表一位
p(/^ABC$/ =~ "ABC",/^ABC/ =~ "1ABC",/ABC$/ =~ "ABC1",/A..C/ =~ "A0xC")
#指定匹配字符的范围	 1个或多个[]	匹配多个字符中的1个  
#[]内部使用A-Z/a-z/0-9/A-Za-z/A-Za-z_... 加-表示一定范围的字符串
#[]内部开头使用^表示指定字符以外的字符串
p(/[ABC]/ =~ "VBE",/[a-z]/ =~ "047bc5",/[^a-z]/ =~ "047bc5")
#使用反斜杠\和1个英文字母的模式
# \s表示空白符，匹配空格（0x20）、制表符（Tab）、换行符、换页符
# \d匹配0-9的数字
# \w匹配英文字母与数字
# \A匹配字符串开头
# \z匹配字符串末尾
p(/a\se/ =~ "a e",/\d\d/ =~ "10",/\w\w/ =~ "w0",/\Aabc/ =~ "abcde",/cde\z/ =~ "abcde")
#重复 重复匹配多次相同的字符 *重复0次以上  +重复1次以上  ?重复0次或1次  *?0次以上的重复中最短的部分  +?1次以上的重复中最短的部分
p(/A.*C/ =~ "ABBBC",/A+C/ =~ "C",/AAA?C/ =~ "AC",/A*?C/ =~ "ACAAAAC",/A+?C/ =~ "ACAAAAC")
#()与重复  重复匹配多个字符
p(/^(ABC)*$/ =~ "ABCABC",/^(ABC).*$/ =~ "ABCDDABC")
#选择 |在几个候选匹配模式中匹配任意一个
p(/^(ABC|DEF)/ =~ "ABCE",/^(ABC|DEF)/ =~ "DEF00")

#3.使用quote方法（转义正则表达式的所有元字符）的正则表达式  返回转义了元字符的正则表达式字符串，再结合new方法生成新的正则表达式
reg1=Regexp.new("abc*def")