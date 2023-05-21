# #!/usr/bin/python
# -*- coding: utf-8 -*-
from tkinter import *
from tkinter.messagebox import *
from tkinter.filedialog import *
from tkinter.ttk import *
import os
import webbrowser as wb
from sv_ttk import *
from sys import argv
from tkinter.font import Font

from tkinter.colorchooser import *
save = False
font_size=15
with open('data\\langs\\lang.txt',encoding='utf-8')as fh:
    l=fh.read()

if l=='中文':
    from data.langs.zh import lang_main,subwin
elif l=='English':
    from data.langs.en import lang_main,subwin
filetype = lang_main.filetype_lang


def save_as():
    global save, path
    if save == True:
        showwarning(subwin.sas_wtitle, subwin.sas_wtext)
    path = asksaveasfilename(defaultextension='.txt', filetypes=filetype, title=lang_main.saveas)
    with open(path, mode='w', encoding='utf-8') as sa:
        sa.write(text1.get(0.0, END))
    save = True
    win.title(lang_main.nortitle + path + '-Snapshot(22w47a)')


def toggle_theme():
    if get_theme() == 'dark' or get_theme() == 'light':
        return get_theme
    else:
        showerror('错误', '当前没有使用太阳谷主题，已自动切换为浅色主题，请自行选择主题。')
        return 'light'


def themeWindow():
    root = Toplevel(win)
    root.iconbitmap('icons/theme.ico')
    root.title(subwin.themewin_title)
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
    e2 = Radiobutton(root, variable=v1, value=1, text=subwin.themewin_light, command=use_light_theme)
    e2.grid(row=1, column=0)
    e3 = Radiobutton(root, variable=v1, value=2, text=subwin.themewin_dark, command=use_dark_theme)
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
        if v1.get()=='1':
            win.iconbitmap('icons/dark.ico')
        else:
            win.iconbitmap('icons/light.ico')


def save():
    if save == True:
        with open(path, mode='w', encoding='utf-8') as sa:
            sa.write(text1.get(0.0, END))
    else:
        save_as()


def new():
    text1.delete(1.0, END)
    win.title(lang_main.new_window_title)
    save = False


def open_file():
    save = True
    s = askopenfile(defaultextension='.txt', filetypes=filetype, title=lang_main.open)
    path = s.name
    win.title(lang_main.nortitle + path + '')
    text1.delete(1.0, END)
    file = open(path, encoding='utf-8')
    text1.insert(1.0, file.read())
    file.close()








def search(searchName,Searchwz=lang_main.baidu,t=0):
    if t==1:
        if '.com' in searchName or '.cn' in searchName or '.com.cn' in searchName or '.org' in searchName or '.net' in searchName:
            wb.open(searchName)
        else:
            if Searchwz == lang_main.bing:
                wb.open('https://cn.bing.com/search?q=' + searchName)
            elif Searchwz == lang_main.baidu:
                wb.open('https://www.baidu.com/s?wd=' + searchName)
            elif Searchwz == lang_main.sougo:
                wb.open('https://www.sogou.com/web?query=' + searchName)
            elif Searchwz == '360':
                wb.open('https://www.so.com/s?ie=utf-8&src=hao_360so_b_cube&shb=1&hsid=23a8f4f7b4401056&ssid=&q=' + searchName)
            elif Searchwz == lang_main.bb:
                wb.open('https://search.bilibili.com/all?keyword=' + searchName)
            elif Searchwz == lang_main.bdtb:
                wb.open('https://tieba.baidu.com/f/search/res?ie=utf-8&qw=' + searchName)
    else:
        if Searchwz == lang_main.bing:
            wb.open('https://cn.bing.com/search?q=' + searchName)
        elif Searchwz == lang_main.baidu:
            wb.open('https://www.baidu.com/s?wd=' + searchName)
        elif Searchwz == lang_main.sougo:
            wb.open('https://www.sogou.com/web?query=' + searchName)
        elif Searchwz == '360':
            wb.open(
                'https://www.so.com/s?ie=utf-8&src=hao_360so_b_cube&shb=1&hsid=23a8f4f7b4401056&ssid=&q=' + searchName)
        elif Searchwz == lang_main.bb:
            wb.open('https://search.bilibili.com/all?keyword=' + searchName)
        elif Searchwz == lang_main.bdtb:
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
    from tkinter import font
    w2 = Toplevel()
    w2.iconbitmap('icons/font.ico')
    w2.title(subwin.fontwin_title)
    w2.geometry('400x95')
    w2.resizable(False, False)
    fonts = font.families()
    val = StringVar()
    butt = Combobox(w2, textvariable=val, values=fonts)
    butt.grid(row=0, column=0)
    butt.set('Consolas')
    size = Spinbox(w2, from_=5, to=55, state='readonly')
    size.grid(row=0, column=1)
    size.set('15')
    b3 = Button(w2, text=lang_main.apply, command=lambda: apply(butt.get(), size.get(), c))
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
    showinfo(lang_main.verinfo, '1.2')


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
    if command == 'set-theme' or command == '/set-theme' or command == '--set-theme' or command == '-ST':
        #print(argv[2])
        if not (argv[2]=='dark' or argv[2]=='light'):
            raise SyntaxError('错误:你输入了一个不存在的主题,请输入dark或light')
            #print('错误:你输入了一个不存在的主题,请输入dark或light')
        if argv[2]=='light':
            win.iconbitmap('icons/dark.ico')
        else:
            win.iconbitmap('icons/light.ico')
        set_theme(argv[2])


        if command == 'run':
            return



def update_log():
    logtitle = subwin.fontwin_title
    log = subwin.uplog_text
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

/set-theme、--set-theme、-ST、set-theme:以自定义的主题启动记事本  使用方法:python main.py --set-theme {ThemeName}
ThemeName:主题名字(可选light或dark)


{ValueName}:必填项              [ValueName]:选填项
    '''
    if len(argv)>1:
        if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
            print(commandHelp)
    Label(w3,text=lang_main.comhelp,font='华文楷体 17 bold').grid()
    Label(w3,text=commandHelp,font='华文楷体 12').grid(row=1,column=0)
    win.mainloop()


def set_icon():
    iconPath=askopenfilename(filetypes=[('图标文件','*.ico'),('所有文件','*.*')],title='Select Icon File')
    win.iconbitmap(iconPath)












def run_pyfile():
    exec(text1.get(0.0,END))





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
    #cc1=Button(win,text='选择颜色',command=entr3.insert(0,askcolor()[2]))
    #cc1.grid(row=4,column=2)
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


def modif_fontsize():
    text1.configure(font=Font(size=font_size+2))

def modif_fontsize2():
    text1.configure(font=Font(size=font_size-2))


from tkinter import scrolledtext


win = Tk()
win.title(lang_main.title)
win.iconbitmap('icons/dark.ico')
win.geometry('822x505')
#win.resizable(False,False)
#win.overrideredirect(True)



text1 = scrolledtext.ScrolledText(win,font=('Consola',str(font_size)))
text1.pack(fill=BOTH,expand=1)

s1=StringVar()
s1=lang_main.baidu


menu_right = Menu(win,tearoff=False)
menu_right.add_cascade(label=lang_main.copy, command=copy)
menu_right.add_cascade(label=lang_main.paste, command=paste)
menu_right.add_cascade(label=lang_main.selall, command=select_all)
menu_right.add_cascade(label=lang_main.delete,command=lambda:text1.delete(SEL_FIRST,SEL_LAST))
menu_right.add_cascade(label=lang_main.semenu, command=lambda:search(text1.get(SEL_FIRST,SEL_LAST),t=1))
menu_right.add_cascade(label=lang_main.tagset,command=lambda:add_tag_window(tagstart=SEL_FIRST,tagend=SEL_LAST))
menu_right.add_separator()
menu_right.add_command(label=lang_main.click_batch,command=run_batfile)
menu_right.add_command(label='Close Window',command=win.quit)
showPopoutMenu(text1, menu_right)


menu1 = Menu(win)
menu1_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label=lang_main.filemenu, menu=menu1_1)
menu1_1.add_command(label=lang_main.new, command=new)
menu1_1.add_command(label=lang_main.save, command=save)
menu1_1.add_command(label=lang_main.saveas, command=save_as)
menu1_1.add_command(label=lang_main.open, command=open_file)
menu1_1.add_separator()
menu1_1.add_command(label=lang_main.exit, command=win.quit, accelerator='Alt+F4')
menu2_1=Menu(menu1,tearoff=False)
menu1.add_cascade(label=lang_main.editmenu,menu=menu2_1)
menu2_1.add_command(label=lang_main.copy, command=copy, accelerator='Ctrl+C')
menu2_1.add_command(label=lang_main.cut, command=cut, accelerator='Ctrl+X')
menu2_1.add_command(label=lang_main.paste, command=paste, accelerator='Ctrl+V')
menu2_1.add_command(label=lang_main.selall, command=select_all, accelerator='Ctrl+A')
menu2_1.add_command(label=lang_main.delete,command=lambda:text1.delete(SEL_FIRST,SEL_LAST),accelerator='Backspace')
menu2_1.add_command(label=lang_main.tagset, command=add_tag_window)
menu2_1.add_separator()
menu2_1.add_command(label=lang_main.undo, command=undo)
menu2_1.add_command(label=lang_main.redo, command=redo)
menu3_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label=lang_main.setmenu, menu=menu3_1)
menu3_1.add_command(label=lang_main.fontset, command=mainwindow)
menu3_1.add_command(label=lang_main.themeset, command=themeWindow)
menu3_1.add_command(label=lang_main.click_batch, command=run_batfile)
menu3_1.add_command(label=lang_main.run_py,command=run_pyfile)
menu4_1 = Menu(menu1,tearoff=False)
menu1.add_cascade(label=lang_main.winmenu,menu=menu4_1)
menu4_1.add_command(label=lang_main.zoom,command=lambda:win.state('zoomed'))
menu4_1.add_command(label=lang_main.iconify,command=win.iconify)
#menu4_1.add_command(label='恢复窗口默认大小',command=nor_size)
menu4_1.add_command(label=lang_main.setico,command=set_icon)
menu5_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label=lang_main.semenu, menu=menu5_1)
menu6_1 = Menu(menu1, tearoff=False)
menu5_1.add_command(label=lang_main.baidu,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.baidu))
menu5_1.add_command(label=lang_main.bing,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bing))
menu5_1.add_command(label=lang_main.sougo,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.sougo))
menu5_1.add_command(label='360',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='360'))
menu5_1.add_command(label=lang_main.bb,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bb))
menu5_1.add_command(label=lang_main.bdtb,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bdtb))
menu1.add_cascade(label=lang_main.aboutmenu, menu=menu6_1)
menu6_1.add_command(label=lang_main.aboutnotepad, command=about)
menu6_1.add_command(label=lang_main.uplog, command=update_log)
menu6_1.add_command(label=lang_main.comhelp, command=command_help)
win.config(menu=menu1)


if len(argv)>1:
    command_run(argv[1])
    if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
        win.quit()
        command_help()





set_theme('light')


win.mainloop()


