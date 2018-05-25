---
title: 輕鬆學會網路爬蟲，教你用Python爬蟲爬大樂透
tags:
  - Python 教學
categories:
  - python
keywords: '爬蟲,台灣大樂透,Python,網路爬蟲'
abbrlink: dad03d64
date: 2018-05-25 16:53:24
---


AI的領域之中，如何獲取資料並儲存是重要的第一步，網路爬蟲可以是獲取網路資料的重要技能之一。
而Python 則是用來做網路爬蟲非常好的工具，因此本篇將教你如何用Python 做網路爬蟲來獲取台灣大樂透號碼。
透過此文章的教學讓非工程師也能夠理解，網路爬蟲是甚麼，非常建議非工程師的讀者能夠自己來玩看看
註:本篇僅作教學使用，未提供任何獎號預測。

<!-- more -->

## 前言
要打造一個AI，關鍵第一步是收集資料並儲存(觀察)，而網路爬蟲是一個收集資料重要技能，因此本篇將 
深入淺出的介紹如何用Python打造一個台灣大樂透爬蟲程式。

## Python爬蟲環境安裝
Python環境安裝在先前的文章以介紹過，可參考此篇文章{% post_link Python-環境安裝 %}
使用Python爬蟲所需要以下的lib 安裝
1. BeautifulSoup
``` bash
pip install beautifulsoup4 

```
1. lxml 
``` bash
pip install lxml 
```
1. Requests
``` bash
pip install requests
```
額外安裝，Python 資料處理所需套件
1. Pandas 資料處理好幫手Pandas，Pandas可以用來更方便處理資料
``` bash
pip install Pandas
```

## 網路爬蟲講解
網路爬蟲的原理是透過解析網頁的內容資訊，以及解析網頁內的連結，透過此連結進入更深一層的網頁不斷循環，
直到爬完該網頁內的所有資訊。
而目前網頁結構都是基於HTML、Css，因此解析網頁的內容就需要有HTML跟CSS的基礎資訊。
想簡單理解HTML、CSS 可參考此網址[HTML基礎教學](http://linzy.csj.ks.edu.tw/materials/html_use.htm)
如果英文能力比較好的可以參考[w3 school](https://www.w3schools.com/)

## 大樂透網頁
要進行爬蟲前，最好先人工理解想要爬蟲的目標網頁內容，[台彩大樂透](http://www.taiwanlottery.com.tw/Lotto/Lotto649/history.aspx)
台彩大樂透網頁，用Chrome 進入此頁面，按下F12 就可以看到以下頁面
{% img /images/2018-05-09_104955.png 800 600 台灣大樂透 %}
依序點擊
- Network
- Doc
- 左邊列表history.aspx
{% img /images/2018-05-09_104955_new_step.png 800 600 台灣大樂透%}

### 將網頁爬回來
解析網頁最重要的部分，先找出url，再來看request method 是get，還是Post
{% img /images/2018-05-09_104955_step_2.png 800 600 requests url%}
這邊的request method 是 get
{% img /images/2018-05-09_104955_step3.png 800 600 requests method%}
有了url跟 request method 就可以將網頁頁面抓回來囉
鍵入以下程式碼
``` bash
from bs4 import BeautifulSoup
import requests

head_Html_lotto='http://www.taiwanlottery.com.tw/Lotto/Lotto649/history.aspx'
res = requests.get(head_Html_lotto, timeout=30)
print(res.text)
```
執行於ipython notebook ，讀者可以參考之前文章{% post_link notebook教學 %}
{% img /images/lotto_craw_setp_02.png 800 600 程式結果%}

程式抓回來的網頁內容，可以找到大樂透的開獎號碼
{% img /images/lotto_craw_step_04.png 800 600 樂透獎號%}
來確認一下台彩大樂透網頁開獎號碼是否與抓回來的相同
{% img /images/TW_lotto_page_01.png 800 600 台彩大樂透獎號%}

到這邊已經完成一半了，再來進行刪去不必要的網頁內容，僅萃取出我們想看的資訊

### 萃取內容
萃取網頁資訊，我們使用Beautifulsoup，此工具已有許多功能了，可參考[Beautiful Soup 技術文件](http://beautifulsoup.readthedocs.io/zh_CN/latest/)

首先抓出大樂透獎號的html格式，獎號的html格式如下

{% img /images/TW_lotto_04.png 800 600 獎號的html格式%}

這邊可以看到關鍵的格式為
```bash
<span id="Lotto649Control_history_dlQuery_No1_0">02</span>
```
因此想法上，我們將分成兩個部份來處理:
-大部分解
-細部分解

#### 大部分解
先萃取並收集網頁內有 Lotto649Control_history_dlQuery_No1_ 等資訊，因此在程式中
我們要把所有獎號的id用一個List記錄起來，到時候讓soup.find_all 去找符合id並收集起來即可

```bash
from bs4 import BeautifulSoup
import requests

winning_Numbers_Sort_lotto = ['Lotto649Control_history_dlQuery_No1_','Lotto649Control_history_dlQuery_No2_','Lotto649Control_history_dlQuery_No3_','Lotto649Control_history_dlQuery_No4_','Lotto649Control_history_dlQuery_No5_','Lotto649Control_history_dlQuery_No6_','Lotto649Control_history_dlQuery_SNo_']

def search_winning_numbers(css_class):
    global winning_Numbers_Sort_lotto
    if(css_class != None):
        for i in range(len(winning_Numbers_Sort_lotto )):
            if winning_Numbers_Sort_lotto [i] in css_class:
                return css_class              
head_Html_lotto='http://www.taiwanlottery.com.tw/Lotto/Lotto649/history.aspx'
res = requests.get(head_Html_lotto, timeout=30)
#print(res.text)
soup = BeautifulSoup(res.text,'lxml')
#print(soup2.prettify())
header_Info = soup.find_all(id=search_winning_numbers)
for item in header_Info:
    print(item)				
```
程式執行結果，可以看到大部分解後，內容已經乾淨許多。
{% img /images/lotto_craw_result_02.png 800 600 大部分解%}

#### 細部分解
細部分解在大部分解之後，繼續萃取我們需要的資訊，這邊需要用到 css一種格式
從以下可以看到 <span></span> 夾住的資訊是02，因此程式中僅需要取 <span></span>.text 這種方式即可取得獎號 
```bash
<span id="Lotto649Control_history_dlQuery_No1_0">02</span>
```
細部分解的method
```bash
def parse_tw_lotto_html(data_Info,number_count):  
    data_Info_List = []
    data_Info_Dict = {}
    tmp_index = 0
    for index  in range(len(data_Info)) :
        if (index == 0):
			#用data_Info[index].text 即可取得獎號
            data_Info_List.append(data_Info[index].text)  
        else:
            if(index % number_count != 0):
                data_Info_List.append(data_Info[index].text)
            else:
                data_Info_Dict[str(tmp_index)] = list(data_Info_List)
                data_Info_List= []
                data_Info_List.append(data_Info[index].text)
                tmp_index = tmp_index+1
        data_Info_Dict[str(tmp_index)] = list(data_Info_List)
    return data_Info_List,data_Info_Dict
```

```bash
from bs4 import BeautifulSoup
import requests

winning_Numbers_Sort_lotto = ['Lotto649Control_history_dlQuery_No1_','Lotto649Control_history_dlQuery_No2_','Lotto649Control_history_dlQuery_No3_','Lotto649Control_history_dlQuery_No4_','Lotto649Control_history_dlQuery_No5_','Lotto649Control_history_dlQuery_No6_','Lotto649Control_history_dlQuery_SNo_']

def search_winning_numbers(css_class):
    global winning_Numbers_Sort_lotto
    if(css_class != None):
        for i in range(len(winning_Numbers_Sort_lotto )):
            if winning_Numbers_Sort_lotto [i] in css_class:
                return css_class    
def parse_tw_lotto_html(data_Info,number_count):  
    data_Info_List = []
    data_Info_Dict = {}
    tmp_index = 0
    for index  in range(len(data_Info)) :
        if (index == 0):
            data_Info_List.append(data_Info[index].text)  
        else:
            if(index % number_count != 0):
                data_Info_List.append(data_Info[index].text)
            else:
                data_Info_Dict[str(tmp_index)] = list(data_Info_List)
                data_Info_List= []
                data_Info_List.append(data_Info[index].text)
                tmp_index = tmp_index+1
        data_Info_Dict[str(tmp_index)] = list(data_Info_List)
    return data_Info_List,data_Info_Dict            
head_Html_lotto='http://www.taiwanlottery.com.tw/Lotto/Lotto649/history.aspx'
res = requests.get(head_Html_lotto, timeout=30)
soup = BeautifulSoup(res.text,'lxml')
header_Info = soup.find_all(id=search_winning_numbers)
data_Info_List,data_Info_Dict  = parse_tw_lotto_html(header_Info,7)    
print(data_Info_Dict)
```
執行上面完整程式得到以下結果，可以看到我們已經成功取得所需要的大樂透獎號資訊了
{% img /images/lotto_cram_result_04png.png 800 600 細部分解%}


### 總結

透過Python 執行網頁爬蟲，已經容易許多了。
網頁爬蟲大體上流程
- 初步理解網頁內容結構，
- 人工判讀得到正確的url,以及request method 
- 將網頁內容爬回來
- 萃取需要的網頁內容

網路爬蟲可以是一種資料收集相當重要的手段之一，透過此文章的教學讓非工程師也能夠輕鬆
理解網路爬蟲是甚麼
