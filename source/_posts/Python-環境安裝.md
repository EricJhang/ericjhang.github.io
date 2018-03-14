---
title: Python 環境安裝
tags:
  - Python
  - Python 安裝
categories:
  - python
date: 2018-03-13 19:51:08
---


## 前言
本頁面僅紀錄如何進行Python 環境安裝。

## Python 環境安裝[Windows]

#### 下載Python
先從官網下載，注意選擇Windows 版本 
[點我進入Python 官網](https://www.python.org/downloads/)
{% img /images/python_install_01.PNG 800 600 Python下載 %}

我這邊選擇Python 3 為了之後的Tensorflow做準備!!當然本人還是建議能夠用Linux 開發Tensorflow還是比較好的。

各位同學依照需求選取Python 版本即可。

#### 安裝Python
{% img /images/python_install_step.PNG 800 600 Python 安裝 %}
基本上一直下一步即可。

#### 環境變數設定

安裝好之後，要設定環境變數，這樣才能"Windows 命令提示字元"下使用
首先找出Python 安裝位置
{% img /images/python_path_setting.PNG 800 600 Python 安裝位置%}

複製上面那串路徑後，去找到我的電腦，點右鍵--->內容--->左邊列表的進階系統設定
window 7 叫我的電腦
window 10 則是找到本機
{% img /images/python_path_setting_02.PNG 800 600 進階系統設定 %}
點環境變數

環境變數底下有個Path，選Path後再點編輯
{% img /images/python_path_setting_03.PNG 800 600 環境變數 %}

新增環境變數，點右上角新增，把剛剛複製Python路徑貼上。
{% img /images/python_path_setting_04.PNG 800 600 環境變數 %}

然後重開機，重開機後 於左下角的開始列表 打出cmd，叫出"Windows 命令提示字元"
輸入Python 看到以下畫面，OK 大功告成
{% img /images/python_path_setting_complate.PNG 800 600 環境變數 %}

下一篇則是 Jupyter 安裝教學
{% post_link notebook教學 %}
