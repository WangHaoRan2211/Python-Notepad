# #!/usr/bin/python
# -*- coding: utf-8 -*-
from tkinter import *
from tkinter.messagebox import *
from tkinter.filedialog import *
from tkinter.ttk import *
import os
import webbrowser as wb
from libs.sv_ttk import *
from sys import argv
import sys
from zipfile import *
from libs import chardet
from tkinter.font import Font
import json as js
from tkinter.colorchooser import *
from tkinter import font
sys.dont_write_bytecode = True
save = False
path = ''
debug_mode=0
with open('data\\langs\\lang.txt',encoding='utf-8')as fh:
    l=fh.read()
lang_list=['简体中文','繁體中文','English','Español','French','Deutsch']

with open('data\\config.json',encoding='utf-8')as cfg:
    config=js.load(cfg)
    print(config)
norfont=config['global_bgfont']
norfnsize = config['global_bgfontsize']
txbg=config['textbgcolor']
thm=config['theme']
txnorfg=config['textfont_color']
txnorfont=config['textfont_family']
txnorfnsize = config['textfont_size']
menu_font=config['menu_font_family']
menu_fnsize = config['menu_font_size']
menu_bg=config['menu_bgcolor']
menu_active_bg=config['menu_active_bgcolor']
menu_fg=config['menu_fgcolor']
menu_active_fg=config['menu_active_fgcolor']

if l=='简体中文':
    from data.langs.zh import lang_main,subwin
elif l=='English':
    from data.langs.en import lang_main,subwin
elif l=='Español':
    from data.langs.sp import lang_main,subwin
elif l=='繁體中文':
    from data.langs.tw import lang_main,subwin
elif l=='French':
    from data.langs.fr import lang_main,subwin
elif l=='Deutsch':
    from data.langs.de import lang_main,subwin
else:
    from data.langs.en import lang_main,subwin


#exec('from data.packs.langpacks.gg.datas import lang_main,subwin')

#print('Not langs name '+l)
normal_font=norfont+' '+str(norfnsize)



langpacklist = list()
dbtype_list = os.listdir('data/packs/langpacks')
for dbtype in dbtype_list:
    if os.path.isfile(os.path.join('data/packs/langpacks',dbtype)):
        dbtype_list.remove(dbtype)
for item in os.scandir('data/packs/langpacks'):
    if item.is_dir():
        langpacklist.append(item.path)

for i in range(0, len(langpacklist)):
    lpath = langpacklist[i]
    with open(lpath + '\\config.json', encoding='utf-8') as v:
        configjson = v.read()
    config = js.loads(configjson)
    with open('version', encoding='utf-8') as hfg:
        ver = hfg.readlines()[0]
    if config["version"] == ver:
        lang_list.append(config['langname'])
        if l == config['langname']:
            #print('from data.packs.langpacks.' + dbtype_list[i] + '.datas import lang_main,subwin')
            exec('from data.packs.langpacks.' + dbtype_list[i] + '.datas import lang_main,subwin')





filetype = lang_main.filetype_lang


def save_as():
    global save, path
    if save == True:
        showwarning(subwin.sas_wtitle, subwin.sas_wtext)
    tmppath = asksaveasfilename(defaultextension='.txt', filetypes=filetype, title=lang_main.saveas)
    if tmppath != '':
        path = tmppath
        with open(path, mode='w', encoding='utf-8') as sa:
            sa.write(text1.get(0.0, END))
        save = True
        savemode.set(lang_main.footbar_filepath_saved+path)
        win.title(lang_main.nortitle + path)



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
    ##root.geometry('100x75')
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
    global save,path
    if save == True:
        with open(path, mode='w', encoding='utf-8') as sa:
            sa.write(text1.get(0.0, END))
        savemode.set(lang_main.footbar_filepath_saved+path)
    else:
        save_as()


def new():
    global save
    text1.delete(1.0, END)
    win.title(lang_main.new_window_title)
    save = False
    savemode.set(lang_main.footbar_filepath_notsaved)

def get_encoding(file):
    with open(file,'rb') as f:
        tmp = chardet.detect(f.read())
        return tmp['encoding']
    
def open_file():
    global save, path
    save = True
    s = askopenfile(defaultextension='.txt', filetypes=filetype, title=lang_main.open)
    path = s.name
    print(path)
    cd = get_encoding(path)
    win.title(lang_main.nortitle + path + '')
    text1.delete(1.0, END)
    file = open(path, encoding=str(cd))
    text1.insert(1.0, file.read())
    file.close()
    savemode.set(lang_main.footbar_filepath_saved+path)








def search(searchName,Searchwz=lang_main.bing,t=0):
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
    butt.set(txnorfont)
    size = Spinbox(w2, from_=5, to=55, state='readonly')
    size.grid(row=0, column=1)
    size.set(str(txnorfnsize))
    b3 = Button(w2, text=lang_main.apply, command=lambda: apply_font_set(butt.get(), size.get(), c))
    c = IntVar()
    #c1 = Checkbutton(w2, text='Bold', variable=c)
    #c1.grid(row=2, column=0)
    b3.grid(row=3, column=1)
    #pre_text=Label(w2,text='文字\nLetter\nZeichen\nТекст')
    #pre_text.grid(row=4, column=0)
    w2.mainloop()


def apply_font_set(b, s, c2=0):
    bold_font = Font(family=b,size=s,weight="bold")
    _font = Font(family=b, size=s,weight="normal")
    #text1.tag_configure("BOLD", font=bold_font)
    if c2 == 0:
        text1.config(font=_font)
    else:
        text1.config(font=bold_font)



def about():
    showinfo(lang_main.verinfo, '1.4.0a1-250x01-v1x\n\nhttps://github.com/WangHaoRan2211/Python-Notepad')


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



def lanWindow():
    lw=Toplevel()
    lw.iconbitmap('icons\\lang.ico')
    lw.title(subwin.langwin_title)
    lw.resizable(False,False)
    l=StringVar()
    c3=Combobox(lw,textvariable=l,values=lang_list,state='readonly')
    c3.grid(row=0,column=0)
    with open('data\\langs\\lang.txt',encoding='utf-8')as d:
        l1=d.read()
    if l1=='简体中文':
        c3.set('简体中文')
    elif l1=='繁體中文':
        c3.set('繁體中文')
    elif l1=='English':
        c3.set('English')
    elif l1=='Español':
        c3.set('Español')
    elif l1=='French':
        c3.set('French')
    elif l1=='Deutsch':
        c3.set('Deutsch')
    else:
        for item in os.scandir('data/packs/langpacks'):
            if item.is_dir():
                with open(item.path+'\\config.json',encoding='utf-8')as afg:
                    a=js.loads(afg.read())
                if l1 == a['langname']:
                    c3.set(a['langname'])
    Label(lw,text=subwin.langwin_info,foreground='#FF0000',font=normal_font).grid(row=1,column=0)
    Button(lw,text=subwin.ok,command=lambda:set_lang(c3.get())).grid(row=2,column=1)
    lw.mainloop()


def set_lang(lang):
    with open('data\\langs\\lang.txt',mode='w',encoding='utf-8')as gjh:
        gjh.write(lang)

def show_arrow_cursor(event=None):
    text1.config(cursor='hand2')

def show_xterm_cursor(event=None):
    text1.config(cursor='xterm')

def click_to_website(event=None,link=''):
    print("click to "+link)
    wb.open(link)
linklist=list()
def linkset(tag, link1):
    global linklist
    print(tag + link1)
    text1.tag_bind(
        tag, 
        '<Enter>', 
        lambda event: show_arrow_cursor()  # 使用 lambda 包装函数调用
    )
    # 绑定鼠标离开事件（光标恢复默认）
    text1.tag_bind(
        tag, 
        '<Leave>', 
        lambda event: show_xterm_cursor()  # 使用 lambda 包装函数调用
        )

    # 使用 lambda 传递 event 和 link 参数
    text1.tag_bind(tag, '<Button-1>', lambda event, link=link1: click_to_website(link=link))

    links={"tag":tag,"link":link1}
    linklist.append(links)
    print(linklist)

    



def linkset_window():
    lw = Toplevel()
    lw.resizable(width=None, height=None)
    lw.title(subwin.linksetwin_title)
    lw.resizable(0,0)
    Label(lw,text=subwin.linkinputtag,font=normal_font).grid(row=0,column=0)
    Elink=Entry(lw)
    Elink.grid(row=1,column=0,columnspan=2,ipadx=60)
    Elink.insert(0,"tag1")
    Label(lw,text=subwin.linkinputlink,font=normal_font).grid(row=2,column=0,)
    Elink2=Entry(lw)
    Elink2.grid(row=3,column=0,columnspan=2,ipadx=60)
    Elink2.insert(0,"https://www.github.com")
    Button(lw,text=subwin.apply,command=lambda:linkset(Elink.get(),Elink2.get())).grid(row=4,column=0,ipadx=30)
    Button(lw,text=subwin.close,command=lambda:lw.destroy()).grid(row=4,column=1,ipadx=30)



def command_run(command):
    global save,path
    #print(len(argv))
    #print(argv)
    if command == 'open' or command == '/open' or command == '--open' or command == '-O':
        filePath = argv[2]
        if not len(argv) >= 4:
            fileEncode = 'utf-8'
        else:
            fileEncode = argv[3]
        save = True
        win.title(lang_main.nortitle+filePath)
        text1.delete(1.0, END)
        path = filePath
        file = open(filePath, encoding=fileEncode)
        text1.insert(1.0, file.read())
        file.close()
        savemode.set(lang_main.footbar_filepath_saved+path)
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
        if command=='--lang' or command=='-L' or command=='/lang' or command=='lang':
            if argv[2]=='zh':
                from data.langs.zh import subwin,lang_main
            elif argv[2]=='sp':
                from data.langs.sp import subwin,lang_main
            elif argv[2]=='en':
                from data.langs.en import subwin,lang_main


        if command == 'run':
            return







def command_help():
    w3=Tk()
    w3.iconbitmap('icons/info.ico')
    w3.resizable(False,False)
    w3.title('Command Help')
    commandHelp = subwin.comhelp
    if len(argv)>1:
        if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
            print(commandHelp)
    Label(w3,text=lang_main.comhelp,font=(norfont,17,"bold")).grid()
    Label(w3,text=commandHelp,font=normal_font).grid(row=1,column=0)
    win.mainloop()


def set_icon():
    iconPath=askopenfilename(filetypes=[('Icon Files','*.ico'),('All Files','*.*')],title='Select Icon File')
    win.iconbitmap(iconPath)












def run_pyfile():
    exec(text1.get(0.0,END))
taglist = dict()




def add_tag(tagname,start,end,background,foreground,fontfamily=norfont,fontsize=str(norfnsize),fontstyle="/"):
    text1.tag_add(tagname,start,end)
    id=tagname
    _start = start
    _end = end
    bgcolor = background
    fgcolor = foreground
    if fontstyle == "/":
        tgfont=fontfamily,fontsize
    else:
        tgfont=fontfamily,fontsize,fontstyle
    config={"bgcolor":bgcolor,"fgcolor":fgcolor,"start":_start,"end":_end,"font":tgfont}
    tagdict={"id":id,"config":config}
    print(tagdict)
    text1.tag_configure(tagname,background=background,foreground=foreground,font=tgfont)


def remove_tag(tagname):
    text1.tag_delete(tagname)


def nor_size():
    win.geometry('822x505')


def add_tag_window(tagstart='',tagend=''):
    global norfnsize
    r2=Toplevel()
    r2.title(subwin.tagwin_title)
    r2.resizable(False,False)
    Label(r2,text=subwin.tagwin_startext,font=normal_font).grid(pady=2)
    entr1=Entry(r2)
    entr1.grid(row=1,column=0,columnspan=2,ipadx=100,pady=2)
    Label(r2, text=subwin.tagwin_endtext,font=normal_font).grid(row=2,column=0,pady=2)
    entr2 = Entry(r2)
    entr2.grid(row=3, column=0,columnspan=2,ipadx=100,pady=2)
    entr1.insert(0,tagstart)
    entr2.insert(0, tagend)
    Label(r2, text=subwin.tagwin_bg,font=normal_font).grid(row=4, column=0,pady=2)
    entr3=Entry(r2)
    entr3.grid(row=4,column=1,ipadx=50,pady=2)
    entr3.insert(0,'white')
    #cc1=Button(win,text='选择颜色',command=entr3.insert(0,askcolor()[2]))
    #cc1.grid(row=4,column=2)
    Label(r2, text=subwin.tagwin_fg,font=normal_font).grid(row=5, column=0,pady=2)
    entr4 = Entry(r2)
    entr4.insert(0,'red')
    entr4.grid(row=5, column=1,ipadx=50,pady=2)
    Label(r2, text=subwin.tagwin_name,font=normal_font).grid(row=9, column=0,pady=2)
    entr5 = Entry(r2)
    entr5.grid(row=9,column=1,ipadx=50,pady=2)
    entr5.insert(0, 'tag1')


    Label(r2, text=subwin.tagwin_choose_font_family,font=normal_font).grid(row=6, column=0,pady=2)
    fontfamc=StringVar()
    fonts=font.families()
    butt = Combobox(r2, textvariable=fontfamc, values=fonts)
    butt.grid(row=7, column=0,pady=2)
    butt.set(txnorfont)
    Label(r2, text=subwin.tagwin_choose_font_size,font=normal_font).grid(row=6, column=1,pady=2)
    fsize = Spinbox(r2, from_=5, to=55, state='readonly')
    fsize.grid(row=7, column=1,pady=2)
    fsize.set(str(txnorfnsize))
    fnadds=("/","bold", "italic", "underline","overstrike")
    fnaddvar=StringVar()
    fnaddvar.set("/")
    Label(r2, text=subwin.tagwin_choose_font_addio,font=normal_font).grid(row=8, column=0,pady=2)
    fnadd=Combobox(r2, textvariable=fnaddvar, values=fnadds)
    fnadd.grid(row=8, column=1,pady=2)
    addB=Button(r2,text=subwin.tagwin_add,command=lambda:add_tag(entr5.get(),entr1.get(),entr2.get(),entr3.get(),entr4.get(),fontfamc.get(),fsize.get(),fnaddvar.get()))
    addB.grid(row=10,column=0,ipadx=40,ipady=7,pady=2)
    remB = Button(r2, text=subwin.tagwin_remove,command=lambda:remove_tag(entr5.get()))
    remB.grid(row=10, column=1,ipadx=40,ipady=7,pady=2)
    r2.mainloop()





from tkinter import scrolledtext


import sys
inb=0
def run_bat():
    os.chdir(os.path.dirname(sys.argv[0]))
    global inb
    with open('np_modules\\batedit\\batfile.bat', 'w',encoding='utf-8') as file:
        file.write(text1.get('1.0', END))
    if inb != 0:
        del sys.modules['np_modules.batedit.bat_editor']
    import np_modules.batedit.bat_editor
    inb+=1
    #print(sys.modules,inb)

if "--debug" in sys.argv or "-debug" in sys.argv or "-D" in sys.argv:
    print('debug mode on')
    debug_mode = 1



def setting_win():
    global text1
    settingWin = Toplevel()
    settingWin.title("设置面板")
    
    # 创建主容器统一管理布局
    main_container = Frame(settingWin)
    main_container.pack(expand=True, fill="both", padx=10, pady=5)

    # 左上角固定文字
    Label(
        main_container,
        text="设置面板",
        font=Font(family=norfont, size=40),
        anchor='w'
    ).grid(row=0, column=0, sticky="nw")

    # 创建Notebook
    nb = Notebook(main_container)
    
    # 配置Notebook样式
    style = Style(settingWin)
    style.configure("TNotebook.Tab", font=normal_font)
    style.configure("TLabelFrame", font=normal_font)
    style.configure("Entry", font=normal_font)

    
    # 添加标签页Frame
    editor_set_frame = Frame(nb)
    color_set_frame = Frame(nb)
    other_set_frame = Frame(nb)
    about_frame = Frame(nb)
    
    # 添加标签页
    nb.add(editor_set_frame, text="编辑器设置")
    nb.add(color_set_frame, text="外观设置")
    nb.add(other_set_frame, text="杂项")
    nb.add(about_frame, text="关于")
    
    # 布局Notebook
    nb.grid(row=1, column=0, sticky="nsew")

    # ============ 新增按钮区域 ============
    # 创建按钮容器（放在main_container的第2行）
    button_frame = Frame(main_container)
    button_frame.grid(row=2, column=0, sticky="se", pady=10)  # 关键：sticky="se"右下对齐

    # 创建按钮（注意父容器改为button_frame）
    Label(button_frame,text="设置将于重启后生效",foreground="red",font=normal_font).pack(side=LEFT, padx=2, ipadx=2, ipady=2)
    b1=Button(
        button_frame, 
        text="恢复默认设置",  # 替换为实际函数
    ).pack(side=LEFT, padx=2, ipadx=2, ipady=2)
    
    b2=Button(
        button_frame, 
        text="退出",
        command=settingWin.destroy
    ).pack(side=RIGHT, padx=2, ipadx=2, ipady=2)
    
    b3=Button(
        button_frame, 
        text="确定",  # 替换为实际函数
    ).pack(side=RIGHT, padx=2, ipadx=2, ipady=2)

    # ============ 布局权重配置 ============
    # 主容器布局配置
    main_container.grid_rowconfigure(1, weight=1)  # Notebook行可扩展
    main_container.grid_columnconfigure(0, weight=1)  # 整列横向扩展

    # 确保窗口缩放时布局生效
    settingWin.rowconfigure(0, weight=1)
    settingWin.columnconfigure(0, weight=1)

    #---------------------------标签页内容-----------------------------

    #编辑器设置
    lbfrm = LabelFrame(editor_set_frame, text="颜色设置")
    lbfrm.grid(row=0, column=0, padx=10, pady=10)
    Label(lbfrm, text="字体颜色", font=normal_font).grid(row=0, column=0)
    cscol=Entry(lbfrm,font=normal_font)                                       
    cscol.grid(row=1, column=0, padx=10, pady=10)
    cscoledit=Button(lbfrm, text="选择颜色", command=lambda:choose_color(settingWin,cscol))
    cscoledit.grid(row=1, column=1, padx=10, pady=10) 
    cscol.insert(0,txnorfg)
    Label(lbfrm, text="背景颜色", font=normal_font).grid(row=2, column=0)
    cscolbg=Entry(lbfrm,font=normal_font)                                       
    cscolbg.grid(row=3, column=0, padx=10, pady=10)
    cscolbgedit=Button(lbfrm, text="选择颜色", command=lambda:choose_color(settingWin,cscolbg,"#ffffff"))
    cscolbgedit.grid(row=3, column=1, padx=10, pady=10) 
    cscolbg.insert(0,txbg)

    lbfrmeditfont = Labelframe(editor_set_frame, text="字体")
    lbfrmeditfont.grid(row=1, column=0, padx=10, pady=10)
    Label(lbfrmeditfont, text=subwin.tagwin_choose_font_family,font=normal_font).grid(row=0, column=0,pady=2)
    fontfamc=StringVar()
    fonts=font.families()
    butt = Combobox(lbfrmeditfont, textvariable=fontfamc, values=fonts,font=normal_font)
    butt.grid(row=1, column=0,pady=2)
    butt.set(txnorfont)
    Label(lbfrmeditfont, text=subwin.tagwin_choose_font_size,font=normal_font).grid(row=0, column=1,pady=2)
    fsize = Spinbox(lbfrmeditfont, from_=5, to=55, state='readonly',font=normal_font)
    fsize.grid(row=1, column=1,pady=2)
    fsize.set(str(txnorfnsize))


    #外观设置 
    lbfr_color= Labelframe(color_set_frame, text="菜单设置")
    lbfr_color.grid(row=0, column=0, padx=10, pady=10)
    Label(lbfr_color, text="默认背景颜色",font=normal_font).grid(row=0, column=0,pady=2)
    csmenubg = Entry(lbfr_color,font=normal_font)
    csmenubg.grid(row=1, column=0,pady=2,)
    csmenubg.insert(0,menu_bg)
    csmenubgbut=Button(lbfr_color, text="选择颜色", command=lambda: choose_color(settingWin,csmenubg,menu_bg))
    csmenubgbut.grid(row=1, column=1,pady=2)
    Label(lbfr_color, text="默认字体颜色",font=normal_font).grid(row=2, column=0,pady=2)
    csmenufont = Entry(lbfr_color,font=normal_font)
    csmenufont.grid(row=3, column=0,pady=2)
    csmenufont.insert(0,menu_fg)
    csmenufontbut=Button(lbfr_color, text="选择颜色", command=lambda: choose_color(settingWin,csmenufont,menu_fg))
    csmenufontbut.grid(row=3, column=1,pady=2)
    Label(lbfr_color, text="激活时背景颜色",font=normal_font).grid(row=0, column=2,pady=2)
    csmenuactivebg = Entry(lbfr_color,font=normal_font)
    csmenuactivebg.grid(row=1, column=2,pady=2)
    csmenuactivebg.insert(0,menu_active_bg)
    csmenuactivebgbut=Button(lbfr_color, text="选择颜色", command=lambda: choose_color(settingWin,csmenuactivebg,menu_active_bg))
    csmenuactivebgbut.grid(row=1, column=3,pady=2)
    Label(lbfr_color, text="激活时字体颜色",font=normal_font).grid(row=2, column=2,pady=2)
    csmenuactivefont = Entry(lbfr_color,font=normal_font)
    csmenuactivefont.grid(row=3, column=2,pady=2)
    csmenuactivefont.insert(0,menu_active_fg)
    csmenuactivefontbut=Button(lbfr_color, text="选择颜色", command=lambda: choose_color(settingWin,csmenuactivefont,menu_active_fg))
    csmenuactivefontbut.grid(row=3, column=3,pady=2)


    Label(lbfr_color, text="菜单字体",font=normal_font).grid(row=4, column=2,pady=2,columnspan=2,sticky=W+E)
    fnts=font.families()
    fnt=StringVar()
    fnt.set(menu_font)
    csmenufntbox=Combobox(lbfr_color,font=normal_font,textvariable=fnt,values=fnts)
    csmenufntbox.grid(row=5, column=0,pady=2,columnspan=4,sticky=W+E)
    Label(color_set_frame, text="默认主题",font=normal_font).grid(row=1, column=0,pady=2,sticky=W)
    themes=("light","dark")
    thms=StringVar()
    thms.set(thm)
    csthmbox=Combobox(color_set_frame,font=normal_font,textvariable=thms,values=themes,state="readonly")
    csthmbox.grid(row=2, column=0,pady=2,sticky=W)
    settingWin.mainloop()
    

def choose_color(pw,e,color='#000000'):
    e.delete(0,END)
    color = askcolor(parent=pw, initialcolor=color)
    print(color)
    e.insert(0,color[1])
    return color[1]
#print(askcolor())

win = Tk()
if debug_mode == 1:
    win.title(lang_main.title + " - Debug Mode")
else:
    win.title(lang_main.title)
win.iconbitmap('icons/dark.ico')
win.geometry('822x505')
#win.resizable(False,False)
#win.overrideredirect(True)

print(menu_font,str(menu_fnsize))

text1 = scrolledtext.ScrolledText(win,font=(txnorfont,txnorfnsize))
text1.pack(fill=BOTH,expand=1)

s1=StringVar()
s1=lang_main.baidu
fc=StringVar()
fc.set(lang_main.footbar_letter_count+':'+str(len(text1.get(0.0,END))-1))
savemode=StringVar()
savemode.set(lang_main.footbar_filepath_notsaved)
l1=Label(win,textvariable=fc,font=normal_font).pack(side=RIGHT, padx=2, ipadx=2, ipady=2)
l2=Label(win,textvariable=savemode,font=normal_font).pack(side=LEFT, padx=2, ipadx=2, ipady=2)
#Label(win,text=" | ",font=norfont+' 10').pack(side=RIGHT, padx=2, ipadx=2, ipady=2)

menu_right = Menu(win, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu_right.add_cascade(label=lang_main.copy, command=copy)
menu_right.add_cascade(label=lang_main.paste, command=paste)
menu_right.add_cascade(label=lang_main.selall, command=select_all)
menu_right.add_cascade(label=lang_main.delete,command=lambda:text1.delete(text1.index(SEL_FIRST),text1.index(SEL_LAST)))
menu_right.add_cascade(label=lang_main.semenu, command=lambda:search(text1.get(text1.index(SEL_FIRST),text1.index(SEL_LAST)),t=1))
menu_right.add_cascade(label=lang_main.tagset,command=lambda:add_tag_window(tagstart=text1.index(SEL_FIRST),tagend=text1.index(SEL_LAST)))
menu_right.add_separator()
menu_right.add_command(label=lang_main.click_batch,command=run_bat)
menu_right.add_command(label='Close Window',command=lambda:win.destroy())
showPopoutMenu(text1, menu_right)


menu1 = Menu(win)
menu1_1 = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu1.add_cascade(label=lang_main.filemenu, menu=menu1_1)
menu1_1.add_command(label=lang_main.new, command=new)
menu1_1.add_command(label=lang_main.save, command=save)
menu1_1.add_command(label=lang_main.saveas, command=save_as)
menu1_1.add_command(label=lang_main.open, command=open_file)
menu1_1.add_separator()
menu1_1.add_command(label=lang_main.exit, command=lambda:win.destroy(), accelerator='Alt+F4')
menu2_1=Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu1.add_cascade(label=lang_main.editmenu,menu=menu2_1)
menu2_1.add_command(label=lang_main.copy, command=copy, accelerator='Ctrl+C')
menu2_1.add_command(label=lang_main.cut, command=cut, accelerator='Ctrl+X')
menu2_1.add_command(label=lang_main.paste, command=paste, accelerator='Ctrl+V')
menu2_1.add_command(label=lang_main.selall, command=select_all, accelerator='Ctrl+A')
menu2_1.add_command(label=lang_main.delete,command=lambda:text1.delete(SEL_FIRST,SEL_LAST),accelerator='Backspace')
menu2_1.add_command(label=lang_main.tagset, command=add_tag_window)
menu2_1.add_command(label=subwin.linksetwin_title,command=linkset_window)
menu2_1.add_separator()
menu2_1.add_command(label=lang_main.undo, command=undo)
menu2_1.add_command(label=lang_main.redo, command=redo)
menu3_1 = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu1.add_cascade(label=lang_main.setmenu, menu=menu3_1)
menu3_1.add_command(label=lang_main.fontset, command=mainwindow)
menu3_1.add_command(label=lang_main.themeset, command=themeWindow)
menu3_1.add_command(label=lang_main.click_batch, command=run_bat)
menu3_1.add_command(label=lang_main.run_py,command=run_pyfile)
menu3_1.add_command(label=lang_main.lang_set,command=lanWindow)
menu3_1.add_command(label="设置面板",command=setting_win)
menu4_1 = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu1.add_cascade(label=lang_main.winmenu,menu=menu4_1)
menu4_1.add_command(label=lang_main.zoom,command=lambda:win.state('zoomed'))
menu4_1.add_command(label=lang_main.iconify,command=win.iconify)
#menu4_1.add_command(label='恢复窗口默认大小',command=nor_size)
menu4_1.add_command(label=lang_main.setico,command=set_icon)
menu5_1 = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu1.add_cascade(label=lang_main.semenu, menu=menu5_1)
menu6_1 = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
menu5_1.add_command(label=lang_main.baidu,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.baidu))
menu5_1.add_command(label=lang_main.bing,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bing))
menu5_1.add_command(label=lang_main.sougo,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.sougo))
menu5_1.add_command(label='360',command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz='360'))
menu5_1.add_command(label=lang_main.bb,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bb))
menu5_1.add_command(label=lang_main.bdtb,command=lambda:search(searchName=text1.get(SEL_FIRST,SEL_LAST),Searchwz=lang_main.bdtb))
menu1.add_cascade(label=lang_main.aboutmenu, menu=menu6_1)
menu6_1.add_command(label=lang_main.aboutnotepad, command=about)
menu6_1.add_command(label=lang_main.open_github, command=lambda:wb.open('https://github.com/WangHaoRan2211/Python-Notepad'))
menu6_1.add_command(label=lang_main.comhelp, command=command_help)
if debug_mode == 1:
    menu_debug = Menu(menu1, tearoff=False,bg=menu_bg,activebackground=menu_active_bg,fg=menu_fg,activeforeground=menu_active_fg,font=(menu_font,str(menu_fnsize)))
    menu1.add_cascade(label="Debug", menu=menu_debug)
    menu_debug.add_command(label=lang_main.click_batch, command=run_bat)
win.config(menu=menu1)


if len(argv)>1:
    command_run(argv[1])
    if argv[1] == 'help' or argv[1] == '/help' or argv[1] == '--help' or argv[1] == '-H':
        win.destroy()
        command_help()


def update():
    global fc
    fc.set(lang_main.footbar_letter_count+":"+str(len(text1.get(0.0,END))-1))
    win.after(100,update) 



set_theme(thm)
import pywinstyles
text1.config(background=txbg,foreground=txnorfg)
def drop_func(file):
    global save,path
    save = True
    path = file[0]
    print("open file: "+str(file[0]))
    cd = get_encoding(path)
    win.title(lang_main.nortitle + path + '')
    text1.delete(1.0, END)
    file = open(path, encoding=str(cd))
    text1.insert(1.0, file.read())
    file.close()
    savemode.set(lang_main.footbar_filepath_saved+path)
pywinstyles.apply_dnd(text1, drop_func)
update()
style_g = Style(win)
style_g.configure("TNotebook.Tab", font=normal_font)
style_g.configure("TButton", font=normal_font)
style_g.configure("TRadiobutton", font=normal_font)

win.mainloop()





