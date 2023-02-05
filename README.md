# Python-Notepad #

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="94" height="20" role="img" aria-label="Python: 3.10.7"><title>Python: 3.10.7</title><linearGradient id="s" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="r"><rect width="94" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#r)"><rect width="49" height="20" fill="#555"/><rect x="49" width="45" height="20" fill="#007ec6"/><rect width="94" height="20" fill="url(#s)"/></g><g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="110"><text aria-hidden="true" x="255" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="390">Python</text><text x="255" y="140" transform="scale(.1)" fill="#fff" textLength="390">Python</text><text aria-hidden="true" x="705" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="350">3.10.7</text><text x="705" y="140" transform="scale(.1)" fill="#fff" textLength="350">3.10.7</text></g></svg>  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="68" height="20" role="img" aria-label="Tk: 8.6.12"><title>Tk: 8.6.12</title><linearGradient id="s" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="r"><rect width="68" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#r)"><rect width="23" height="20" fill="#555"/><rect x="23" width="45" height="20" fill="#fe7d37"/><rect width="68" height="20" fill="url(#s)"/></g><g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="110"><text aria-hidden="true" x="125" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="130">Tk</text><text x="125" y="140" transform="scale(.1)" fill="#fff" textLength="130">Tk</text><text aria-hidden="true" x="445" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="350">8.6.12</text><text x="445" y="140" transform="scale(.1)" fill="#fff" textLength="350">8.6.12</text></g></svg>
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