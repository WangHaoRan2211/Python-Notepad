from tkinter import *
from tkinter.messagebox import *
from tkinter.filedialog import *
from tkinter.ttk import *
import os
save = False
filetype = [('文本文件', '*.txt'), ('Python文件', '*.py *.pyw'), ('C语言文件', '*.c *.cpp *.cs'), ('Cmd文件', '*.cmd *.bat'),
            ('HTML文件', '*.htm *.html'),('注册表文件','*.reg'),('所有文件', '*.*')]






def save_as():
    global save,path
    if save == True:
        showwarning('警告', '新文件路径将会把原文件路径替换')
    path = asksaveasfilename(defaultextension='.txt', filetypes=filetype, title='另存为')
    with open(path, mode='w', encoding='utf-8') as sa:
        sa.write(text1.get(0.0, END))
    save = True
    win.title('记事本-' + path)
















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
    win.title('记事本-' + path)
    text1.delete(1.0, END)
    file = open(path, encoding='utf-8')
    text1.insert(1.0, file.read())
    file.close()






def run_batfile():
    with open(r'C:\Users\Administrator\AppData\Local\Temp\temp.bat', mode='w', encoding='utf-8') as saa:
        saa.write(text1.get(0.0, END))
    os.system(r'C:\Users\Administrator\AppData\Local\Temp\temp.bat')
    os.remove(r'C:\Users\Administrator\AppData\Local\Temp\temp.bat')















def mainwindow():
    w2 = Toplevel()
    w2.title('字体设置')
    w2.geometry('320x50')
    w2.resizable(False, False)
    fonts = ('Consolas','微软雅黑', '宋体', '楷体', '黑体', '隶书')
    val = StringVar()
    butt = Combobox(w2, textvariable=val, values=fonts)
    butt.grid(row=0, column=0)
    butt.set('Consolas')
    size = Spinbox(w2, from_=3, to=35, state='readonly')
    size.grid(row=0, column=1)
    b3 = Button(w2, text='应用', command=lambda: apply(butt.get(), size.get()))
    b3.grid(row=2, column=1)
    w2.mainloop()





def apply(b, s):
    Font = '%s %s' % (b, s)
    text1.config(font=Font)






def about():
    showinfo('版本信息', '1.0')
    









def copy():
    t = text1.get(SEL,1.0,END)
    text1.clipboard_clear()
    text1.clipboard_append(t)







win = Tk()
win.title('记事本-无标题')
win.geometry('700x590')
text1 = Text(win, width=680, height=650, undo=True, autoseparators=False, font='微软雅黑 12 bold')
text1.pack(side=LEFT,fill=BOTH,expand=True)
scr = Scrollbar(win)
scr.pack(side=RIGHT, fill=Y)
scr.config(command=text1.yview)
text1.config(yscrollcommand=scr.set)
menu1 = Menu(win)
menu1_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='文件', menu=menu1_1)
menu1_1.add_command(label='新建', command=new)
menu1_1.add_command(label='保存', command=save)
menu1_1.add_command(label='另存为', command=save_as)
menu1_1.add_command(label='打开', command=open_file)
menu1_1.add_separator()
menu1_1.add_command(label='关闭', command=win.quit)
menu2_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='设置', menu=menu2_1)
menu2_1.add_command(label='字体', command=mainwindow)
menu2_1.add_command(label='一键运行批处理文件', command=run_batfile)
menu2_1.add_separator()
menu2_1.add_command(label='复制',command=copy)
menu3_1 = Menu(menu1, tearoff=False)
menu1.add_cascade(label='关于', menu=menu3_1)
menu3_1.add_command(label='关于记事本', command=about)
win.config(menu=menu1)
win.mainloop()
