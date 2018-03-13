---
title: python 一小時快速上手
tags:
  - python 教學
  - python 快速上手
categories:
  - python
date: 2018-03-13 15:55:55
---


## 前言

Python，做為一個程式語言相當平易近人也好上手，也是在這波大數據分析，人工智慧的浪潮下不可或缺的程式語言。

## Python 是甚麼
二話不多說Python，直接來看Wiki上描述的Python

{% blockquote @Python https://zh.wikipedia.org/wiki/Python %}
Python的設計哲學是「優雅」、「明確」、「簡單」。
Python開發者的哲學是「用一種方法，最好是只有一種方法來做一件事」
{% endblockquote %}



## 第一個Python程式

``` bash
#第一個程式,用print() 這個函數 來跟大家打招呼吧
print("Hello world")
#輸出結果: Hello world
```
輸出結果:
Hello world

## 字串組合
範例: 
    首先設定 string_variable = "Hello",myname = " Eric"
    再讓兩個字串組合  string_variable+myname 並顯示

{% codeblock lang:python%}
string_variable = "Hello"
myname = " Eric"
print(string_variable+myname)
#輸出結果: Hello Eric	
{% endcodeblock %}

## 數字的四則運算
範例:
   設定 variable_a = 3,variable_b = 2
   相加 variable_a+variable_b
   相減 variable_a-variable_b     
   相乘 variable_a*variable_b
   相除 variable_a/variable_b
   取餘數 variable_a%variable_b
   
{% codeblock lang:python%}
variable_a = 3
variable_b = 2
variable_a+variable_b 
#輸出結果 5
variable_a-variable_b 
#輸出結果 1
variable_a*variable_b 
#輸出結果 6
variable_a/variable_b 
#輸出結果 1.5
variable_a%variable_b
#輸出結果 1  
{% endcodeblock %}

## IF-ElSE 
範例:
   設定  variable_a = 3,variable_b = 2
   檢驗  variable_a 是否大於 variable_b 
   如果  variable_a 大於 variable_b 則顯示字串 "a 大於 b",反之 則顯示字串 "a 小於 b"
{% codeblock lang:python%}
variable_a = 3
variable_b = 2
if(variable_a > variable_b):
    print("a 大於 b")
else:
    print("a 小於 b")
#輸出結果:"a 大於 b" 
{% endcodeblock %}
來看看 a =3 , b = 4  程式執行結果 
{% codeblock lang:python%}
variable_a = 3
variable_b = 4
if(variable_a > variable_b):
    print("a 大於 b")
else:
    print("a 小於 b")
#輸出結果:"a 小於 b"
{% endcodeblock %}

## IF-ElIF-ElSE
範例:
   情境 設計一段程式,來檢查該正整數是奇數還是偶數
   偶數定義: 能被2整除的為偶數
   奇數定義: 不能被2整除的為奇數
   設定  variable_x 為正整數 
   檢驗  variable_x 如果小於0,則顯示 重新輸入
   如果  variable_x 如果被2整除,則顯示 "variable_x 是偶數"
   如果  variable_x 如果不能被2,則顯示 "variable_x 是奇數"
   *int() 會將裡面的數值轉成整數，因此撇除是浮點數的問題*
以下同學可以自己試跑看看結果   
{% codeblock lang:python%}
variable_x = int(input("請輸入正整數:"))
if(variable_x <= 0):
    print("請重新輸入")
elif((variable_x % 2) ==0 ):
    print("%d 是偶數" % variable_x)
else:
    print("%d 是奇數" % variable_x)
{% endcodeblock %}

## IF and、or

條件組合
 True and True   是 True
 True and False  是 False
 True or  True   是 True
 True or False   是 True
 False or False  是 False
 False and False 是 False
範例:
    判斷variable_x 是不是大於0,且是整數,是正整數在進行判斷是偶數還是奇數
    如果不是正整數,請顯示重新輸入
	
	我們這邊用了float()這個函數,這個函數是把整數和字串換成浮點數 白話來說就是把 1 換成1.0。
	為了教學需要這邊用float 表示輸入可以是浮點數,所以在程式上我們要多一個判斷使用者輸入是否為整數
	int(variable_x) == variable_x 如果為True，表示使用者輸入的是整數，如果為False 則表示使用者輸入為浮點數
{% codeblock lang:python%}	
variable_x = float(input("請輸入正整數:"))
if((int(variable_x) == variable_x) and (variable_x > 0)):
    if ((variable_x % 2) ==0):
        print("%d 是偶數" % variable_x)
    else:
        print("%d 是奇數" % variable_x)
else:
    print("請重新輸入" )
{% endcodeblock %} 

## list 序列
序列是Python中最基本的數據結構。序列中的每個元素都分配一個數字 - 它的位置，或索引，第一個索引是0，第二個索引是1，依此類推。
請看以下程式範例
{% codeblock lang:python%}
list_1 = [1,2,3,4]
print(list_1[0])
#輸出結果為 1
list_2 = ["hello","Eric","今天天氣如何"]
print(list_2[0])
#輸出結果為 hello
list_2 = ["hello","Eric","今天天氣如何"]
print(list_2[0]+" "+list_2[1]+" "+list_2[2])
#輸出結果為 hello Eric 今天天氣如何
{% endcodeblock %}

## For loop 
Python for loop 可以遍歷任何序列的項目，如一個列表或者一個字符串。
for iterating_var in sequence:
   statements(s)
請看以下範例:
{% codeblock lang:python%}
for i in [0,1,2,3,4]:
    print(i)
{% endcodeblock %}
輸出結果:
0
1
2
3
4 

## range()
python range() 函數可創建一個整數列表
範例:
    range(5) 產生 [0,1,2,3,4] 
{% codeblock lang:python%}
list_tmp = range(4)
print(list_tmp) 	
{% endcodeblock %}
#輸出結果 [0,1,2,3]

## 複合題型
印出1~100 是偶數的數字
用到 IF else,For loop,range(),  a%b 顯示餘數
建議同學要自己練習一遍 Learning by doning
{% blockquote John Dewey., A theory of education %}
Learning by doning
{% endblockquote %}
{% codeblock lang:python%}
for i in range(101):
    if (i != 0):
        if(i%2 ==0):
            print(i)
{% endcodeblock %}

## 複合題型
印出1~100 找出所有的質數
用到 IF else,For loop,range(),  a%b 顯示餘數
建議同學要自己練習一遍 Learning by doning
{% codeblock lang:python%}
for i in range(101):
    if (i >=2):
        count = 0
        for k in range(i):
            if(k>=2):
                if(i%k !=0):
                    count+=1
            else:
                count+=1       
        if(count==i):
            print("質數 %d"% i)
{% endcodeblock %}

## while loop 
Python 編程中 while 語句用於循環執行程序，即在某條件下，循環執行某段程序，以處理需要重複處理的相同任務。其基本形式為：

while 判斷條件:
    執行
範例:
    用while loop 印出 1~100	
{% codeblock lang:python%}	
i = 1
while(i <= 100):
    print(i)
    i+=1	
{% endcodeblock %}

## 利用while loop 來找100以內的質數
{% codeblock lang:python%}
i = 2
while(i <= 100):
    k=2
    while(k<i):
        if(i%k==0):
            break
        k+=1    
    if(k==i):
        print("質數 %d"%i) 
    i+=1
{% endcodeblock %}

## function() 函數
函數是組織好的，可重複使用的，用來實現單一，或相關聯功能的代碼段。
函數能提高應用的模塊性，和代碼的重複利用率。
範例:
    偶數奇數判斷  
{% codeblock lang:python%}
def isEvenNumbers(num):
    if(num%2 ==0 ):
        return (str(num)+" 是偶數")
    else:
        return (str(num)+" 是奇數")
variable_x = int(input("請輸入正整數:"))
if(variable_x <= 0):
    print("請重新輸入") 
else:
    print(isEvenNumbers(variable_x))
{% endcodeblock %}

## 建構一個函數，用來判斷是否為質數	
{% codeblock lang:python%}
def isPrimeNumbers(num):
    k=2
    while(k<num):
        if(num%k==0):
            return False
        k+=1
    return True        
for i in range(101):
    if(i>=2):
        if(isPrimeNumbers(i)):
            print("%d 是質數"%i)
{% endcodeblock %}

## 用Python來設計遊戲:終極密碼
設計終極密碼 1~100
先設定答案，然後讓使用者輸入數字，如果沒猜中，則讓使用者再次輸入，並顯示範圍
{% codeblock lang:python%}
anser_number=71
Flag = True
start_number= 1
end_number =100
while(Flag):    
    guess_number = int(input("終極密碼，%d到%d: "%(start_number,end_number)))
    if(guess_number == anser_number):
        print("恭喜猜中，密碼是%d "% anser_number)
        break
    elif(guess_number < anser_number ):
        start_number = guess_number
    else:
        end_number = guess_number
{% endcodeblock %}

		