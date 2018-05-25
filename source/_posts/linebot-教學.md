---
title: line bot 教學
tags:
  - linebot
  - 教學
  - python
categories:
  - line
keywords: 'linebot 教學, python,heroku,chatbot,教學,line,bot'
abbrlink: c7f31b57
date: 2018-03-18 15:07:05
---
Line bot 教學， 透過一連串的解說讓你快速打造自己的line bot
<!-- more -->

## linebot教學-前言
Linebot 是line 在2016年推出的聊天機器人(Chatbot)，類似的Chatbot 有FB Messenger、WeChat等等。
對於聊天機器人我們看Wiki的解釋。{% blockquote Wiki百科 https://zh.wikipedia.org/wiki/%E8%81%8A%E5%A4%A9%E6%A9%9F%E5%99%A8%E4%BA%BA 聊天機器人%}聊天機器人泛指是經由對話或者文字進行交談的電腦程式 {% endblockquote %}
不少研究機構預測在2020年至少會超過一半以上的行動裝置搭載AI，其中[Gartner](https://www.gartner.com/en?utm_expid=.3whmzSo_QVecuQPIychz5Q.1&utm_referrer=https%3A%2F%2Fwww.google.com.tw%2F)更是預測行動裝置上會有40%以上的app
搭載Chatbot。科技的大浪推著我們前進，我們也來快速打造自己的linebot吧。

## Linebot 申請
[點我申請linebot](https://developers.line.me/en/)
1. 先上Line 官網申請帳號後，點上面連結開通Message API，也就是我們說的line bot
這邊要提醒的是如果你把line@帳號開通message API 將失去1對1溝通的功能，建議直接新開一個Message API即可
{% img /images/linebot_start_messageAPI.PNG 800 600 開通Message API %}

1. 在Select Provider這邊填入個人/組織名稱，我這邊填入"Freelance developers"，然後下一步
{% img /images/linebot_create_step01.PNG 800 600 填入個人/組織名稱 %}
1. 這邊要填入的資訊比較多，一個一個來講。
	* App name:自行填入想好的名子，上線後在Line好友也是顯示這個名子
	* App description:描述這個bot的功能
{% img /images/linebot_step02.PNG 800 600 填入AppName %}
	* Plan:這邊選Developer Trial，限制是只能有50位好友。Free 雖然沒有好友限制，但是會少了Push messages.推送功能
	* Category: 這邊依照個人、組織的營業項目選擇即可，我這邊選擇部落格。
	* Subcategory: 這邊是子項目，依照個人、組織的營業項目選擇即可。
	* Email address: 填入電子信箱。都填寫完畢點confim就完成建立bot囉。
{% img /images/linebot_step03.PNG 800 600 填入其他資訊 %}
1. 按照上面步驟建立完成後，即可看到新創好的bot，點畫面中箭頭的按鈕
{% img /images/linebot_confirm.PNG 800 600 完成畫面 %}
1. 再來會進入了Channel Setting的畫面，裡面有兩個重要的認證資訊我們要記起來
{% img /images/linebot_channelsetting.PNG 800 600 Channel Setting %}
1. channel secret 第一個重要的資訊，記起來，那是之後放在Webhook認證用的。
{% img /images/linebot_channel_secret.PNG 800 600 Channel Setting %}
1. Channel access token 畫面往下拉會看到這項，一開始空的，點擊Issue 按鈕產生token
{% img /images/linebot_channel_access.PNG 800 600 "Channel access token" %}
1. Issue token 我這邊選3小時，點擊後產生的token 要記起來，那是第二個重要的資訊
{% img /images/linebot_channel_access_Issue.PNG 800 600 "token Issue" %}
1. 這邊進入正題了，來分別解釋一下各欄位的功用
	* Use webhooks: 這邊是選擇開啟/關閉 webhooks功能。
	* Webhook URL :這邊就是要給他一個網路位置，這個網路位置要求是https，加密的網路位置!!
	* Allow bot to join group chats: 這選項是指line bot 能不能加入群組。
{% img /images/linebot_settings_01.PNG 800 600 "Webhook" %}
* Webwook 是甚麼，參見[Wiki Webhook說明](https://en.wikipedia.org/wiki/Webhook)，簡單來說就是一個http 的callbacks。
	這樣講有點抽象可以想像成是一個接線生，專門接聽你指定或是任何的訊息，或是轉達。所以Webhook就是我們用來接聽來自line的訊息，
	然後傳給Line bot，Line bot 再根據訊息產生對應的動作再藉由這個Webhook傳回去給line，
## Line bot 佈署到 Heroku

到目前為止申請好了line bot，也設定好了，那麼就要來讓line bot 動起來。我們要給line bot 一個住的地方，佈署它讓它動起來
這邊我選擇Heroku，Heroku安裝可以參考先前的文章{% post_link heroku安裝使用教學 %}。
直接參考以下指令
1. 建立linebot 資料夾
``` bash
mkdir linebot_firts_project
cd linebot_firts_project
```
2. heroku 登入，打入帳號密碼
``` bash
heroku login
```
3. heroku 建立需要的應用程序 這邊我指定名子 mylinebot-eric-01，名字請讀者自行設定囉
``` bash
heroku create "mylinebot-eric-01" 
```
4. 設定git config 名子跟信箱，並初始化資料夾
``` bash
git config --global user.name "你的名字"
git config --global user.emil "你的信箱"
git init
```
5. 將資料夾與 heroku 做連結，注意mylinebot-eric-01 請換成讀者自行設定的名子喔
``` bash
heroku git:remote -a mylinebot-eric-01
```
將[Github](https://github.com/EricJhang/teach_linebot)中的檔案放置linebot_firts_project這個資料夾，注意不要複製到.git
{% img /images/linebot_github_01.PNG 800 600 複製三個檔案 %}
``` bash
git add .
git commit -m "init"
git push heroku master
```
[Heroku app 清單](https://dashboard.heroku.com/apps)
6. 點上方連結，就可以看到我們剛剛新增的應用程式了
{% img /images/heroku_app_list.PNG 800 600 Heroku app清單 %}
7. 設定Webhook 所需要的scret以及token
點開新增的應用程式，這邊是mylinebot-eric-01，可以看到首頁，點擊settings
{% img /images/heroku_app_home.PNG 800 600 Heroku app清單 %}
點擊Revea config，準備填入Webhook認證所需要的資訊
{% img /images/heroku_setting.PNG 800 600 點擊Revea config %}
填入上面步驟 6、7 拿到的token,secret，注意key的名子 要跟 app.py相同(預設lineToken、lineSecret)
{% img /images/heroku_token_scrcet.PNG 800 600 填入token,secret %}
8. 回到[linebot網頁](https://developers.line.me/console/channel/1568338708/basic/)設定webhook url填入
"yourHerokuAppName.herokuapp.com//callback"。
{% img /images/linebot_weburl_setting.PNG 800 600 設定Webhook url %}
9. 填入Webhook url後，趕緊加入你的line好友
{% img /images/linebot_qrcode.PNG 800 600 掃描QR code %}
10. 直接測試，有回應就表示成功囉!!
{% img /images/linebot_first_repley.PNG 800 600 掃描QR code %}
這邊有看到bot 回了一串訊息"感謝您傳送訊息給我！...略"，這個是linebot 預設訊息只要進入官網關掉就可以
[官網位置](https://admin-official.line.me/)
進入官網後，找到bot，點左邊列表--->訊息--->自動回應訊息，關掉預設回覆訊息即可
{% img /images/linebot_office_setting_message.PNG 800 600 自動回覆訊息 %}
恭喜，你的第一個line bot 完成了!!

## 整理所有流程
要完成line bot 要做以下步驟
1. 先申請line bot 帳號並開通
2. 記住channel secret以及channel token 待後續使用
3. 安裝heroku {% post_link heroku安裝使用教學 %}
4. 上[Github](https://github.com/EricJhang/teach_linebot)抓取line bot 初始所需要的檔案
5. 依照指令一步一步做下去
6. 在Heroku setting 填入token以及secret
7. 在line bot 設定webhook url
8. 加入Line bot 好友，測試成功!!


