# #!/usr/bin/python
# -*- coding: utf-8 -*-
from tkinter import *
from tkinter.messagebox import *
from tkinter.filedialog import *
from tkinter.ttk import *
import os
import webbrowser as wb
from sys import argv
from tkinter.font import Font
save = False
filetype = [('文本文件', '*.txt'), ('Python文件', '*.py *.pyw'), ('C语言文件', '*.c *.cpp *.cs'), ('Cmd文件', '*.cmd *.bat'),
            ('HTML文件', '*.htm *.html'), ('注册表文件', '*.reg'), ('所有文件', '*.*')]


def save_as():
    global save, path
    if save == True:
        showwarning('警告', '新文件路径将会把原文件路径替换')
    path = asksaveasfilename(defaultextension='.txt', filetypes=filetype, title='另存为')
    with open(path, mode='w', encoding='utf-8') as sa:
        sa.write(text1.get(0.0, END))
    save = True
    win.title('记事本-' + path + '-Snapshot(22w47a)')




def save():
    if save == True:
        with open(path, mode='w', encoding='utf-8') as sa:
            sa.write(text1.get(0.0, END))
    else:
        save_as()


def new():
    text1.delete(1.0, END)
    win.title('无标题')
    save = False


def open_file():
    save = True
    s = askopenfile(defaultextension='.txt', filetypes=filetype, title='打开')
    path = s.name
    win.title('记事本-' + path + '')
    text1.delete(1.0, END)
    file = open(path, encoding='utf-8')
    text1.insert(1.0, file.read())
    file.close()








def search(searchName,Searchwz='百度',t=0):
    if t==1:
        if '.com' in searchName or '.cn' in searchName or '.com.cn' in searchName or '.org' in searchName or '.net' in searchName:
            wb.open(searchName)
        else:
            if Searchwz == '必应':
                wb.open('https://cn.bing.com/search?q=' + searchName)
            elif Searchwz == '百度':
                wb.open('https://www.baidu.com/s?wd=' + searchName)
            elif Searchwz == '搜狗':
                wb.open('https://www.sogou.com/web?query=' + searchName)
            elif Searchwz == '360':
                wb.open('https://www.so.com/s?ie=utf-8&src=hao_360so_b_cube&shb=1&hsid=23a8f4f7b4401056&ssid=&q=' + searchName)
            elif Searchwz == '哔哩哔哩':
                wb.open('https://search.bilibili.com/all?keyword=' + searchName)
            elif Searchwz == '百度贴吧':
                wb.open('https://tieba.baidu.com/f/search/res?ie=utf-8&qw=' + searchName)
    else:
        if Searchwz == '必应':
            wb.open('https://cn.bing.com/search?q=' + searchName)
        elif Searchwz == '百度':
            wb.open('https://www.baidu.com/s?wd=' + searchName)
        elif Searchwz == '搜狗':
            wb.open('https://www.sogou.com/web?query=' + searchName)
        elif Searchwz == '360':
            wb.open(
                'https://www.so.com/s?ie=utf-8&src=hao_360so_b_cube&shb=1&hsid=23a8f4f7b4401056&ssid=&q=' + searchName)
        elif Searchwz == '哔哩哔哩':
            wb.open('https://search.bilibili.com/all?keyword=' + searchName)
        elif Searchwz == '百度贴吧':
            wb.open('https://tieba.baidu.com/f/search/res?ie=utf-8&qw=' + searchName)






def color():
    for i in range(1,500):
        text1.tag_add('1',text1.search(')',0.0))
        text1.tag_config('1',foreground='blue')
    text1.tag_add('1', text1.search('(', 0.0))
    text1.tag_config('1', foreground='blue')
    text1.tag_add('2', text1.search('"', 0.0))
    text1.tag_config('2', foreground='green')
    text1.tag_add('2', text1.search('\'', 0.0))
    text1.tag_config('2', foreground='green')



def run_batfile():
    with open(r'data\temp.bat', mode='w', encoding='utf-8') as saa:
        saa.write(text1.get(0.0, END))
    os.system(os.getcwd() + r'\data\temp.bat')


def showPopoutMenu(w, menux):
    def popout(event):
        menux.post(event.x + w.winfo_rootx(), event.y + w.winfo_rooty())
        w.update()

    w.bind('<Button-3>', popout)


def mainwindow():
    w2 = Toplevel()
    w2.iconbitmap('icons/font.ico')
    w2.title('字体设置')
    w2.geometry('400x95')
    w2.resizable(False, False)
    fonts = (
    'System', '@System', 'Terminal', '@Terminal', 'Fixedsys', '@Fixedsys', 'Modern', 'Roman', 'Script', 'Courier',
    'MS Serif', 'MS Sans Serif', 'Small Fonts', 'Marlett', 'Arial', 'Arabic Transparent', 'Arial Baltic', 'Arial CE',
    'Arial CYR', 'Arial Greek', 'Arial TUR', 'Arial Black', 'Bahnschrift Light', 'Bahnschrift SemiLight', 'Bahnschrift',
    'Bahnschrift SemiBold', 'Bahnschrift Light SemiCondensed', 'Bahnschrift SemiLight SemiConde',
    'Bahnschrift SemiCondensed', 'Bahnschrift SemiBold SemiConden', 'Bahnschrift Light Condensed',
    'Bahnschrift SemiLight Condensed', 'Bahnschrift Condensed', 'Bahnschrift SemiBold Condensed', 'Calibri',
    'Calibri Light', 'Cambria', 'Cambria Math', 'Candara', 'Candara Light', 'Comic Sans MS', 'Consolas', 'Constantia',
    'Corbel', 'Corbel Light', 'Courier New', 'Courier New Baltic', 'Courier New CE', 'Courier New CYR',
    'Courier New Greek', 'Courier New TUR', 'Ebrima', 'Franklin Gothic Medium', 'Gabriola', 'Gadugi', 'Georgia',
    'Impact', 'Ink Free', 'Javanese Text', 'Leelawadee UI', 'Leelawadee UI Semilight', 'Lucida Console',
    'Lucida Sans Unicode', 'Malgun Gothic', '@Malgun Gothic', 'Malgun Gothic Semilight', '@Malgun Gothic Semilight',
    'Microsoft Himalaya', 'Microsoft JhengHei', '@Microsoft JhengHei', 'Microsoft JhengHei UI',
    '@Microsoft JhengHei UI', 'Microsoft JhengHei Light', '@Microsoft JhengHei Light', 'Microsoft JhengHei UI Light',
    '@Microsoft JhengHei UI Light', 'Microsoft New Tai Lue', 'Microsoft PhagsPa', 'Microsoft Sans Serif',
    'Microsoft Tai Le', '微软雅黑', '@微软雅黑', 'Microsoft YaHei UI', '@Microsoft YaHei UI', '微软雅黑 Light', '@微软雅黑 Light',
    'Microsoft YaHei UI Light', '@Microsoft YaHei UI Light', 'Microsoft Yi Baiti', 'MingLiU-ExtB', '@MingLiU-ExtB',
    'PMingLiU-ExtB', '@PMingLiU-ExtB', 'MingLiU_HKSCS-ExtB', '@MingLiU_HKSCS-ExtB', 'Mongolian Baiti', 'MS Gothic',
    '@MS Gothic', 'MS UI Gothic', '@MS UI Gothic', 'MS PGothic', '@MS PGothic', 'MV Boli', 'Myanmar Text', 'Nirmala UI',
    'Nirmala UI Semilight', 'Palatino Linotype', 'Segoe MDL2 Assets', 'Segoe Print', 'Segoe Script', 'Segoe UI',
    'Segoe UI Black', 'Segoe UI Emoji', 'Segoe UI Historic', 'Segoe UI Light', 'Segoe UI Semibold',
    'Segoe UI Semilight', 'Segoe UI Symbol', '宋体', '@宋体', '新宋体', '@新宋体', 'SimSun-ExtB', '@SimSun-ExtB', 'Sitka Small',
    'Sitka Text', 'Sitka Subheading', 'Sitka Heading', 'Sitka Display', 'Sitka Banner', 'Sylfaen', 'Symbol', 'Tahoma',
    'Times New Roman', 'Times New Roman Baltic', 'Times New Roman CE', 'Times New Roman CYR', 'Times New Roman Greek',
    'Times New Roman TUR', 'Trebuchet MS', 'Verdana', 'Webdings', 'Wingdings', 'Yu Gothic', '@Yu Gothic',
    'Yu Gothic UI', '@Yu Gothic UI', 'Yu Gothic UI Semibold', '@Yu Gothic UI Semibold', 'Yu Gothic Light',
    '@Yu Gothic Light', 'Yu Gothic UI Light', '@Yu Gothic UI Light', 'Yu Gothic Medium', '@Yu Gothic Medium',
    'Yu Gothic UI Semilight', '@Yu Gothic UI Semilight', '等线', '@等线', '等线 Light', '@等线 Light', '仿宋', '@仿宋', '楷体', '@楷体',
    '黑体', '@黑体', 'HoloLens MDL2 Assets', 'Agency FB', 'Algerian', 'Book Antiqua', 'Arial Narrow',
    'Arial Rounded MT Bold', 'Baskerville Old Face', 'Bauhaus 93', 'Bell MT', 'Bernard MT Condensed', 'Bodoni MT',
    'Bodoni MT Black', 'Bodoni MT Condensed', 'Bodoni MT Poster Compressed', 'Bookman Old Style', 'Bradley Hand ITC',
    'Britannic Bold', 'Berlin Sans FB', 'Berlin Sans FB Demi', 'Broadway', 'Brush Script MT', 'Bookshelf Symbol 7',
    'Californian FB', 'Calisto MT', 'Castellar', 'Century Schoolbook', 'Centaur', 'Century', 'Chiller', 'Colonna MT',
    'Cooper Black', 'Copperplate Gothic Bold', 'Copperplate Gothic Light', 'Curlz MT', 'Dubai', 'Dubai Light',
    'Dubai Medium', 'Elephant', 'Engravers MT', 'Eras Bold ITC', 'Eras Demi ITC', 'Eras Light ITC', 'Eras Medium ITC',
    'Felix Titling', 'Forte', 'Franklin Gothic Book', 'Franklin Gothic Demi', 'Franklin Gothic Demi Cond',
    'Franklin Gothic Heavy', 'Franklin Gothic Medium Cond', 'Freestyle Script', 'French Script MT',
    'Footlight MT Light', '方正舒体', '@方正舒体', '方正姚体', '@方正姚体', 'Garamond', 'Gigi', 'Gill Sans MT',
    'Gill Sans MT Condensed', 'Gill Sans Ultra Bold Condensed', 'Gill Sans Ultra Bold', 'Gloucester MT Extra Condensed',
    'Gill Sans MT Ext Condensed Bold', 'Century Gothic', 'Goudy Old Style', 'Goudy Stout', 'Harlow Solid Italic',
    'Harrington', 'Haettenschweiler', 'High Tower Text', 'Imprint MT Shadow', 'Informal Roman', 'Blackadder ITC',
    'Edwardian Script ITC', 'Kristen ITC', 'Jokerman', 'Juice ITC', 'Kunstler Script', 'Wide Latin', 'Lucida Bright',
    'Lucida Calligraphy', 'Leelawadee', 'Lucida Fax', 'Lucida Handwriting', 'Lucida Sans', 'Lucida Sans Typewriter',
    'Magneto', 'Maiandra GD', 'Matura MT Script Capitals', 'Mistral', 'Modern No. 20', 'Microsoft Uighur',
    'Monotype Corsiva', 'Niagara Engraved', 'Niagara Solid', 'OCR A Extended', 'Old English Text MT', 'Onyx',
    'MS Outlook', 'Palace Script MT', 'Papyrus', 'Parchment', 'Perpetua', 'Perpetua Titling MT', 'Playbill',
    'Poor Richard', 'Pristina', 'Rage Italic', 'Ravie', 'MS Reference Sans Serif', 'MS Reference Specialty',
    'Rockwell Condensed', 'Rockwell', 'Rockwell Extra Bold', 'Script MT Bold', 'Showcard Gothic', '隶书', '@隶书', '幼圆',
    '@幼圆', 'Snap ITC', '华文彩云', '@华文彩云', 'Stencil', '华文仿宋', '@华文仿宋', '华文琥珀', '@华文琥珀', '华文楷体', '@华文楷体', '华文隶书', '@华文隶书',
    '华文宋体', '@华文宋体', '华文细黑', '@华文细黑', '华文行楷', '@华文行楷', '华文新魏', '@华文新魏', '华文中宋', '@华文中宋', 'Tw Cen MT',
    'Tw Cen MT Condensed', 'Tw Cen MT Condensed Extra Bold', 'Tempus Sans ITC', 'Viner Hand ITC', 'Vivaldi',
    'Vladimir Script', 'Wingdings 2', 'Wingdings 3', 'Cascadia Code ExtraLight', 'Cascadia Code Light',
    'Cascadia Code SemiLight', 'Cascadia Code', 'Cascadia Code SemiBold', 'Cascadia Mono ExtraLight',
    'Cascadia Mono Light', 'Cascadia Mono SemiLight', 'Cascadia Mono', 'Cascadia Mono SemiBold', 'Heebo')
    val = StringVar()
    butt = Combobox(w2, textvariable=val, values=fonts)
    butt.grid(row=0, column=0)
    butt.set('Consolas')
    size = Spinbox(w2, from_=5, to=55, state='readonly')
    size.grid(row=0, column=1)
    size.set('15')
    b3 = Button(w2, text='应用', command=lambda: apply(butt.get(), size.get(), c))
    c = IntVar()
    c1 = Checkbutton(w2, text='Bold', variable=c)
    c1.grid(row=2, column=0)
    b3.grid(row=3, column=1)
    w2.mainloop()


def apply(b, s, c2=0):
    bold_font = Font(family=b,size=s,weight="bold")
    _font = Font(family=b, size=s)
    text1.tag_configure("BOLD", font=bold_font)
    if c2 == 0:
        text1.config(font=_font)
    else:
        text1.config(font=bold_font)



def about():
    showinfo('版本信息', '1.2')


def cut():
    global text1
    text1.event_generate("<<Cut>>")


def copy():
    global text1
    text1.event_generate("<<Copy>>")


def paste():
    global text1
    text1.event_generate("<<Paste>>")


def undo():
    global text1
    text1.event_generate("<<Undo>>")


def redo():
    global text1
    text1.event_generate("<<Redo>>")


def select_all():
    global text1
    text1.tag_add("sel", "1.0", "end")




def command_run(command):
    #print(len(argv))
    #print(argv)
    if command == 'open' or command == '/open' or command == '--open' or command == '-O':
        filePath = argv[2]
        if not len(argv) >= 4:
            fileEncode = 'utf-8'
        else:
            fileEncode = argv[3]
        save = True
        win.title('记事本-' + filePath)
        text1.delete(1.0, END)
        file = open(filePath, encoding=fileEncode)
        text1.insert(1.0, file.read())
        file.close()



        if command == 'run':
            return



def update_log():
    logtitle = '''1.2-pre1更新 '''
    log = '''更新:
\t1.添加了Tag设置
\t2.现在选中带有.com，.cn，.com.cn，.org，.net，.php的内容时，将把选中的内容当作网址直接打开
'''
    win3 = Tk()
    win3.title('Update Log')
    win3.iconbitmap('icons/log.ico')
    win3.resizable(False, False)
    ul1 = Label(win3, text=logtitle, font='华文楷体 19 bold')
    ul1.grid(row=1,column=0)
    ul2 = Label(win3, text=log, font='华文楷体 14')
    ul2.grid()
    win3.mainloop()



def command_help():
    w3=Tk()
    w3.iconbitmap('icons/info.ico')
    w3.resizable(False,False)
    w3.title('Command Help')
    commandHelp = '''open、-O、--open、/open:自动打开文件  使用方法:python main.py --open {filePath} [Encoding]
filePath:打开的文件路径(可以是相对路径或绝对路径)  Encoding:打开的文件使用编码(默认UTF-8)

/help、--help、-H、help:说明窗口  使用方法:python main.py --help


{ValueName}:必填项              [ValueName]:选填项
    '''
    if len(argv)>1:
        if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
            print(commandHelp)
    Label(w3,text='命令说明',font='华文楷体 17 bold').grid()
    Label(w3,text=commandHelp,font='华文楷体 12').grid(row=1,column=0)
    win.mainloop()


def set_icon():
    iconPath=askopenfilename(filetypes=[('图标文件','*.ico'),('所有文件','*.*')],title='Select Icon File')
    win.iconbitmap(iconPath)












def run_pyfile(py):
    if os.path.exists('\\data\\pythonTempProject'):
        os.mkdir(os.getcwd()+'\\data\\pythonTempProject')
    with open('data\\pythonTempProject\\main.py',mode='w',encoding='utf-8')as f:
        f.write(text1.get(0.0,END))
    os.system('"' + py +' \\python.exe" ' + '"'+os.getcwd() + '\\data\\pythonTempProject\\main.py"')





def add_tag(tagname,start,end,background,foreground):
    text1.tag_add(tagname,start,end)
    text1.tag_configure(tagname,background=background,foreground=foreground)


def remove_tag(tagname):
    text1.tag_delete(tagname)


def nor_size():
    win.geometry('822x505')


def add_tag_window(tagstart='',tagend=''):
    r2=Toplevel()
    r2.title('Tag设置')
    r2.resizable(False,False)
    Label(r2,text='输入开始位置(格式:行.列,从1开始)').grid()
    entr1=Entry(r2)
    entr1.grid(row=1,column=0,columnspan=2)
    Label(r2, text='输入结束位置(格式:行.列,从1开始)').grid(row=2,column=0)
    entr2 = Entry(r2)
    entr2.grid(row=3, column=0,columnspan=2)
    entr1.insert(0,tagstart)
    entr2.insert(0, tagend)
    Label(r2, text='输入背景色').grid(row=4, column=0)
    entr3=Entry(r2)
    entr3.grid(row=4,column=1)
    entr3.insert(0,'white')
    Label(r2, text='输入前景色').grid(row=5, column=0)
    entr4 = Entry(r2)
    entr4.insert(0,'red')
    entr4.grid(row=5, column=1)
    Label(r2, text='输入Tag名').grid(row=6, column=0)
    entr5 = Entry(r2)
    entr5.grid(row=6,column=1)
    entr5.insert(0, 'tag1')
    addB=Button(r2,text='添加Tag',command=lambda:add_tag(entr5.get(),entr1.get(),entr2.get(),entr3.get(),entr4.get()))
    addB.grid(row=7,column=0,ipadx=30,ipady=7)
    remB = Button(r2, text='移除Tag',command=lambda:remove_tag(entr5.get()))
    remB.grid(row=7, column=1,ipadx=30,ipady=7)
    r2.mainloop()

from tkinter import scrolledtext


win = Tk()
win.title('记事本-无标题')
win.iconbitmap('icons/dark.ico')
win.geometry('822x505')
#win.resizable(False,False)



text1 = scrolledtext.ScrolledText(win,font=('Consola','15'))
text1.pack(fill=BOTH,expand=1)

s1=StringVar()
s1='百度'


menu_right = Menu(win,tearoff=False)
menu_right.add_cascade(label='复制', command=copy)
menu_right.add_cascade(label='粘贴', command=paste)
menu_right.add_cascade(label='全选', command=select_all)
menu_right.add_cascade(label='删除',command=lambda:text1.delete(SEL_FIRST,SEL_LAST))
menu_right.add_cascade(label='搜索', command=lambda:search(text1.get(SEL_FIRST,SEL_LAST),t=1))
menu_right.add_cascade(label='Tag设置',command=lambda:add_tag_window(tagstart=SEL_FIRST,tagend=SEL_LAST))
menu_right.add_separator()
menu_right.add_command(label='运行批处理文件',command=run_batfile)
menu_right.add_command(label='Close Window',command=win.quit)
showPopoutMenu(text1, menu_right)


menu1 = Menu(win)
menu1_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='文件', menu=menu1_1)
menu1_1.add_command(label='新建', command=new)
menu1_1.add_command(label='保存', command=save)
menu1_1.add_command(label='另存为', command=save_as)
menu1_1.add_command(label='打开', command=open_file)
menu1_1.add_separator()
menu1_1.add_command(label='关闭', command=win.quit, accelerator='Alt+F4')
menu2_1=Menu(menu1,tearoff=False)
menu1.add_cascade(label='编辑',menu=menu2_1)
menu2_1.add_command(label='复制', command=copy, accelerator='Ctrl+C')
menu2_1.add_command(label='剪切', command=cut, accelerator='Ctrl+X')
menu2_1.add_command(label='粘贴', command=paste, accelerator='Ctrl+V')
menu2_1.add_command(label='全选', command=select_all, accelerator='Ctrl+A')
menu2_1.add_command(label='删除',command=lambda:text1.delete(SEL_FIRST,SEL_LAST),accelerator='Backspace')
menu2_1.add_command(label='Tag设置', command=add_tag_window)
menu2_1.add_separator()
menu2_1.add_command(label='撤销', command=undo)
menu2_1.add_command(label='恢复', command=redo)
menu3_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='设置', menu=menu3_1)
menu3_1.add_command(label='字体', command=mainwindow)
menu3_1.add_command(label='一键运行批处理文件', command=run_batfile)
menu4_1 = Menu(menu1,tearoff=False)
menu1.add_cascade(label='窗口',menu=menu4_1)
menu4_1.add_command(label='最大化',command=lambda:win.state('zoomed'))
menu4_1.add_command(label='最小化',command=win.iconify)
#menu4_1.add_command(label='恢复窗口默认大小',command=nor_size)
menu4_1.add_command(label='设置主窗口图标',command=set_icon)
menu5_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='搜索', menu=menu5_1)
menu6_1 = Menu(menu1, tearoff=False)
menu5_1.add_command(label='百度',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='百度'))
menu5_1.add_command(label='必应',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='必应'))
menu5_1.add_command(label='搜狗',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='搜狗'))
menu5_1.add_command(label='360',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='360'))
menu5_1.add_command(label='哔哩哔哩',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='哔哩哔哩'))
menu5_1.add_command(label='百度贴吧',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='百度贴吧'))
menu1.add_cascade(label='关于', menu=menu6_1)
menu6_1.add_command(label='关于记事本', command=about)
menu6_1.add_command(label='更新日志', command=update_log)
menu6_1.add_command(label='命令说明', command=command_help)
win.config(menu=menu1)


if len(argv)>1:
    command_run(argv[1])
    if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
        win.quit()
        command_help()



win.mainloop()


