---
title: Heroku安裝使用教學
tags:
  - Heroku安裝使用教學
  - Heroku
categories:
  - Heroku
keywords: 'Heroku,安裝,教學,申請'
abbrlink: 689940fd
date: 2018-03-14 15:48:52
---


## Heroku安裝教學-前言
Heroku 是一個平台即服務(PaaS)，各個開發者或是開發團隊可以自行在Heroku平台開發&佈署各種網站。
好處是可以減少維護管理系統底層的成本，也透過簡單的介面來調整所需要的硬體設備等級或是資源。
PaaS的平台不少，但是Heroku操作相當簡單，可以讓開發者初期專心的開發程式，而不用煩惱管理機器或是其他維護。
當然如果網站隨著上線後流量變大，那麼Heroku就不一定適合了，不管如何Heroku 對於早期的開發者是非常適合的。

## Heroku 安裝

首先先到Heroko 申請一個帳號
[網站:https://www.heroku.com/](https://www.heroku.com/) 

## 申請Heroku帳號
目前申請Heroku 帳號是免費的，填寫一些基本資料即可申請
## 免費帳號的限制
Heroku 免費帳號的限制對開發者比較有影響的就是
- 30分鐘沒有使用會進入睡眠狀態，之後要開啟需要等待一些時間才能運作。
- 512MB的儲存空間，這空間對開發者開發一些小專案來說夠用了。
- 1個dyno。dyno是運行和響應請求的應用程序的實例。要執行網站就至少需要一個dyno

## 安裝Heroku Cli
Heroko Cli是一個用來管理、創建、提交等命令的工具。
[Heroko Cli 下載網址](https://devcenter.heroku.com/articles/heroku-cli)

{% img /images/heroku_cli.PNG 800 600 Heroko下載頁面 %}
看各位讀者自己依照作業系統選擇下載，下載後直接進行安裝即可
安裝後，同時也會自動的加到環境變數中。
安裝完成後，開啟命令提示字元來測試一下，鍵入以下指令

``` bash
heroku -h 
```
如果出現以下頁面，電腦重開機就可以了
{% img /images/heroku_cli_install_error.PNG 800 600 Heroko not found %}
如果讀者不想重開機，那鍵入以下指令(Windows 適用)

``` bash
set PATH=%PATH%;C:\Program Files\Heroku\bin #Heroku安裝的路徑
```
再輸入一次 heroku -h，看到以下畫面就是成功了!!
{% img /images/heroku_cli_install_sucess.PNG 800 600 Heroko Sucess %}

## Heroku 使用教學
在命令提示字元下鍵入
``` bash
heroku login
```
出現以下畫面，輸入剛剛申請的Heroku帳號、密碼，這樣後在git push 之後就不用再次輸入了。
{% img /images/heroku_login.PNG 800 600 Heroko Login %}

再來進入正題，我們要在Heroku開設一個應用程式(Instance)，可以透過以下指令
``` bash
heroku create name
```
name 是你指定應用程式名子，也可以不指定，Heroku 會隨機產生一組名稱

其餘指令可以參考[Heroko Cli 指令](https://devcenter.heroku.com/articles/heroku-cli-commands)
後面要佈署網站，要用git 指令來做。
Git 教學可以參考這篇 [連猴子都能懂得Git入門指南](https://backlog.com/git-tutorial/tw/intro/intro2_1.html)

## 建立本地端存放程式碼
再來先在本地端建立一個資料夾，專門用來存放程式碼，後續也從這資料夾直接git push 到Heroku
``` bash
mkdir heroku_workplace
cd  heroku_workplace
git init 
heroku git:remote -a {HEROKU_APP_NAME}
```
{HEROKU_APP_NAME}是你指定的應用程式名子
將開發好的程式碼放入這個資料夾後，鍵入指令
``` bash
git add .
git commit -m "Init"
git push heroku master
```
每次更新完程式，要重新推上Heroku，就用上述步驟重做一次即可。

## 檢查的日誌(log)
``` bash
heroku logs --tail --app {HEROKU_APP_NAME}
```
{HEROKU_APP_NAME}是你指定的應用程式名子
--tail :是持續印出log
--app {HEROKU_APP_NAME}: 是指定app

到這邊 Heroku 安裝跟使用已經完成，下一篇是line bot
在下一篇line bot 會用到Heroku，並佈署喔
