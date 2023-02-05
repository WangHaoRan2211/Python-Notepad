# Python-Notepad #

----

## 简介 ##

Python-Notepad是一个用Python3.10和Tkinter写的简易记事本（目前仅支持中文）
---

----
## 运行 ##
在运行main.py前，请先在shell中运行以下代码:
```commandline
pip install sv_ttk
```
然后cd到文件目录并运行
```commandline
python.exe main.py
```
就可以运行了

---
## 编译 ##
在shell中输入
```commandline
pip install pyinstaller
```
完成后cd到文件目录后运行
```commandline
pyinstaller -F -W main_OldUI.py 
```
之后运行
```commandline
cd dist
```
此时shell所在的路径就是可执行文件的路径
把文件目录里的data文件夹,icons文件夹复制到可执行文件目录中，编译就完成了。
