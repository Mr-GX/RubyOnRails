#ruby 方法：由对象定义的与该对象相关的操作  对象.方法名(param1,param2,...)
=begin
对象是接收者，调用方法是向接收者发送消息，调用结果是接收者接收了消息
实例方法：在class关键字中定义的方法  以这个对象（实例）为接收者的方法  1000.to_s
类方法：接收者不是对象而是类本身的方法  Array.new
函数式方法：没接收者的方法  sleep(10)
方法的标记法：类名#方法名、类名.方法名、类名::方法名
=end

def func()#无参
	puts("Hello Ruby")
end
func()

def func1(param)#有参
	puts("Hello #{param}")
end
func1("Ruby")

def func2(param,param1="Python")#有参&有默认值&从右侧指定默认值
	puts("Hello #{param},Hello #{param1}")
end
func2("Ruby")

#方法的返回值
def volume(x,y,z)
	#x*y*z
	return x*y*z #return语句可以省略，最后一个表达式结果就是方法的返回值
end
puts(volume(2,3,4))

def max(a,b)
	if a>b
		return a
	end
	b
end
puts(max(10,5))

#定义带块的方法
def yield_func
	while true
		yield
	end
end

num=1
yield_func do 
	puts("num is #{num}")
	if num>100
		break
	end
	num *= 2
end

#参数个数不确定的方法 所有参数会被封装成数组传递 不确定个数的参数将接收传递的未利用到的参数
def dymic_param_func(*param,param1)
	[param,param1]
end
p(dymic_param_func(1,2,3)) #[[1, 2], 3]

#关键字参数构成的方法 指定参数的默认值 将参数名和值成对的传递  可以改变参数的顺序或者省略一些参数
#**param会把参数列表以外的关键字参数以散列（hashmap）对象的形式保存
def key_param_func(x:0,y:0,z:0,**param)
	xy=x*y
	xz=x*z
	yz=y*z
	return (xy+xz+yz)*2
end
puts(key_param_func(x:2,y:3,z:4))
puts(key_param_func(z:4,y:3,x:2))
puts(key_param_func(x:2,z:4))
puts(key_param_func(x:2,y:3,z:4,v:5,w:6))

#关键字参数和普通参数搭配的方法  普通参数必须传值、关键字参数可以使用默认值、关键字参数可以用散列传递
def key_nomal_param_func(a,b:1,c:2)
	print(a,b,c,"\n")
end
key_nomal_param_func(0)
key_nomal_param_func(1,b:2,c:3)
params={b:2,c:3}
key_nomal_param_func(1,params)

#方法调用的补充
#1.把数组分解为参数
def ary_param_func(a,b,c)
	a+b+c
end

puts(ary_param_func(1,2,3))
args=[2,3]
puts(ary_param_func(1,*args))
args1=[1,2,3]
puts(ary_param_func(*args1))

#2.把散列作为参数传递，{}可以省略
def hash_param_func(args,args1)
	[args,args1]
end

puts(hash_param_func(1,{a:2,b:3}))
puts(hash_param_func(1,a:2,b:3))