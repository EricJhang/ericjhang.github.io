---
title: ipython notebook安裝教學
tags:
  - ipython notebook
  - ipyhton noteboot 安裝
  - jupyter
categories:
  - python  
date: 2018-03-13 19:51:22
---


## 前言
ipython notebook這個套件相當強大，其中的notebook功能可以在瀏覽器上執行python並看到結果。
這個功能非常符合教學與分享的需要，如果你是初新手或是正準備轉職數據分析的工程師，此套件非常建議安裝。 

## ipython notebook安裝
安裝ipython notebook前，需要先安裝python，安裝python方法可以參考之前的文章
{% post_link Python-環境安裝 %}
在"Windows 命令提示字元"下執行 以下指令
``` bash
pip install "ipython[notebook]"
```
{% img /images/ipython_install.PNG 800 600 輸入pip install "ipython[notebook]"  %}

安裝成功會出現Successfully installed
{% img /images/ipython_install_complate.PNG 800 600 安裝成功 %}

如果安裝失敗(出現紅字)是以下的原因，出現"PermissionError: "
{% img /images/ipython_install_error.PNG 800 600 安裝失敗 %}

則在Windows 左下角開啟"Windows 命令提示字元"時，點滑鼠右鍵，選擇"以系統管理身分執行"

## 執行ipython notebook

在執行ipython notebook 前，我們先建立一個資料夾，到時候執行ipython notebook 可以直接讀取資料夾內的檔案，
我們在notebook上執行的程式也會存到此資料夾。

在命令提示字元，先回到根目錄底下，執行
``` bash
mkdir ipython_notebook_workplace
cd ipython_notebook_workplace
ipython notebook
```
{% img /images/ipython_mkdir_run.PNG 800 600 建立資料夾並執行 %}

執行後會以瀏覽器開啟，jupyter。
{% img /images/noetbook_work_01.PNG 800 600 notebook執行畫面 %}
再來點選右邊New，新增一個Python3檔案

OK，大功告成，我們來鍵入第一個程式，來試試看吧
``` bash
print("Hello world")
```
打上程式後，執行run，即可看到結果"Hello world"
{% img /images/jupyter_hello_01.PNG 800 600 Hello world %}

以後要執行Python程式，都可以用ipython notebook來直接看到結果了!!
