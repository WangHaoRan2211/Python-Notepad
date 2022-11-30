# #!/usr/bin/python
# -*- coding: utf-8 -*-
from tkinter import *
from tkinter.messagebox import *
from tkinter.filedialog import *
from tkinter.ttk import *
import os
from tkinter import SEL_FIRST
import webbrowser as wb
from sv_ttk import *
from sys import argv

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


def toggle_theme():
    if get_theme() == 'dark' or get_theme() == 'light':
        return get_theme
    else:
        showerror('错误', '当前没有使用太阳谷主题，已自动切换为浅色主题，请自行选择主题。')
        return 'light'


def themeWindow():
    root = Toplevel(win)
    root.iconbitmap('Icon.ico')
    root.title('更改主题')
    root.geometry('100x75')
    root.resizable(False, False)
    v1 = IntVar()
    with open('data/theme.ini', 'r+', encoding='utf-8') as th:
        if th.read() == '':
            th.write('theme=1')
        else:
            if th.read() == 'theme=1':
                v1 = 1
            else:
                v1 = 2
    e2 = Radiobutton(root, variable=v1, value=1, text='浅色', command=use_light_theme)
    e2.grid(row=1, column=0)
    e3 = Radiobutton(root, variable=v1, value=2, text='暗色', command=use_dark_theme)
    e3.grid(row=2, column=0)
    with open('data/theme.ini', 'r+', encoding='utf-8') as th2:
        th2.write('theme=' + str(v1))
    win.mainloop()


def theme():
    global v1
    if v1.get() == 'auto':
        set_theme(toggle_theme())
    else:
        set_theme(v1)


def save():
    if save == True:
        with open(path, mode='w', encoding='utf-8') as sa:
            sa.write(text1.get(0.0, END))
    else:
        save_as()


def new():
    text1.delete(1.0, END)
    win.title('无标题-Snapshot(22w48a)')
    save = False


def open_file():
    save = True
    s = askopenfile(defaultextension='.txt', filetypes=filetype, title='打开')
    path = s.name
    win.title('记事本-' + path + '-Snapshot(22w48a)')
    text1.delete(1.0, END)
    file = open(path, encoding='utf-8')
    text1.insert(1.0, file.read())
    file.close()








def search_baidu(searchName,Searchwz='百度'):
    if Searchwz=='必应':
        wb.open('https://cn.bing.com/search?q='+searchName)
    elif Searchwz=='百度':
        wb.open('https://www.baidu.com/s?wd='+searchName)









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
    w2.iconbitmap('Icon.ico')
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
    if c2 == 0:
        Font = '%s %s' % (b, s)
    else:
        Font = '%s %s bold' % (b, s)
    text1.config(font=Font)


def about():
    showinfo('版本信息', '22w48a(Snapshot)')


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


def update_log():
    logtitle = '''22w48a更新 '''
    log = '''大更新:
\t1.添加了命令系统，现在支持help、open、set-theme三种命令。
\t2.添加了右键菜单
小更新:
\t1.添加剪切、撤销、恢复功能'''
    win3 = Tk()
    win3.title('Update Log')
    win3.iconbitmap('Icon.ico')
    win3.resizable(False, False)
    ul1 = Label(win3, text=logtitle, font='华文楷体 19 bold')
    ul1.pack()
    ul2 = Label(win3, text=log, font='华文楷体 14')
    ul2.pack(padx=45)
    win3.mainloop()


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
        win.title('记事本-' + filePath + '-Snapshot(22w48a)')
        text1.delete(1.0, END)
        file = open(filePath, encoding=fileEncode)
        text1.insert(1.0, file.read())
        file.close()
    if command == 'set-theme' or command == '/set-theme' or command == '--set-theme' or command == '-ST':
        #print(argv[2])
        if not (argv[2]=='dark' or argv[2]=='light'):
            raise SyntaxError('错误:你输入了一个不存在的主题,请输入dark或light')
            #print('错误:你输入了一个不存在的主题,请输入dark或light')
        set_theme(argv[2])


        if command == 'run':
            return




def command_help():
    w3=Tk()
    w3.resizable(False,False)
    w3.title('Command Help')
    commandHelp = '''open、-O、--open、/open:自动打开文件  使用方法:python main.py --open {filePath} [Encoding]
filePath:打开的文件路径(可以是相对路径或绝对路径)  Encoding:打开的文件使用编码(默认UTF-8)

/help、--help、-H、help:说明窗口  使用方法:python main.py --help

/set-theme、--set-theme、-ST、set-theme:以自定义的主题启动记事本  使用方法:python main.py --set-theme {ThemeName}
ThemeName:主题名字(可选light或dark)


{ValueName}:必填项              [ValueName]:选填项
    '''
    if len(argv)>1:
        if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
            print(commandHelp)
    Label(w3,text='命令说明',font='华文楷体 17 bold').pack()
    Label(w3,text=commandHelp,font='华文楷体 12').pack(ipadx=45)
    win.mainloop()


def set_icon():
    iconPath=askopenfilename(filetypes=[('图标文件','*.ico'),('所有文件','*.*')],title='Select Icon File')
    win.iconbitmap(iconPath)



win = Tk()
win.title('记事本-无标题-Snapshot(22w48a)')
win.iconbitmap('Icon.ico')
win.geometry('700x590')


text1 = Text(win, width=680, height=650, undo=True, autoseparators=False, font='Consolas 15')
text1.pack(side=LEFT, fill=BOTH, expand=True)
scr = Scrollbar(win)
scr.pack(side=RIGHT, fill=Y)
scr.config(command=text1.yview)
text1.config(yscrollcommand=scr.set)


menu_right = Menu(win,tearoff=False)
menu_right.add_cascade(label='复制', command=copy)
menu_right.add_cascade(label='粘贴', command=paste)
menu_right.add_cascade(label='全选', command=select_all)
'''menu_right.add_cascade(label='Search', command=lambda:search_baidu(text1.get(SEL_FIRST,SEL_LAST)))
menu_right.add_separator()
menu_right.add_command(label='Close Window',command=win.quit)
menu_right.add_command(label='run bat file',command=run_batfile)'''
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
menu2_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='设置', menu=menu2_1)
menu2_1.add_command(label='字体', command=mainwindow)
menu2_1.add_command(label='主题', command=themeWindow)
menu2_1.add_command(label='一键运行批处理文件', command=run_batfile)
menu2_1.add_separator()
menu2_1.add_command(label='复制', command=copy, accelerator='Ctrl+C')
menu2_1.add_command(label='剪切', command=cut, accelerator='Ctrl+X')
menu2_1.add_command(label='粘贴', command=paste, accelerator='Ctrl+V')
menu2_1.add_command(label='全选', command=select_all, accelerator='Ctrl+A')
menu2_1.add_separator()
menu2_1.add_command(label='撤销', command=undo)
menu2_1.add_command(label='恢复', command=redo)
'''menu3_1 = Menu(menu1,tearoff=False)
menu1.add_cascade(label='Window',menu=menu3_1)
menu3_1.add_command(label='Zoomed',command=lambda:win.state('zoomed'))
menu3_1.add_command(label='Minimize',command=win.iconify)
menu3_1.add_command(label='Set Main Window Icon',command=set_icon)'''
menu4_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='关于', menu=menu4_1)
menu4_1.add_command(label='关于记事本', command=about)
menu4_1.add_command(label='更新日志', command=update_log)
menu4_1.add_command(label='命令说明', command=command_help)
win.config(menu=menu1)


if len(argv)>1:
    command_run(argv[1])
    if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
        win.quit()
        command_help()


set_theme('light')


win.mainloop()


