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
    fonts = ('System', '@System', 'Terminal', '@Terminal', 'Fixedsys', '@Fixedsys', 'Modern', 'Roman', 'Script', 'Courier', 'MS Serif', 'MS Sans Serif', 'Small Fonts', 'Marlett', 'Arial', 'Arabic Transparent', 'Arial Baltic', 'Arial CE', 'Arial CYR', 'Arial Greek', 'Arial TUR', 'Arial Black', 'Bahnschrift Light', 'Bahnschrift SemiLight', 'Bahnschrift', 'Bahnschrift SemiBold', 'Bahnschrift Light SemiCondensed', 'Bahnschrift SemiLight SemiConde', 'Bahnschrift SemiCondensed', 'Bahnschrift SemiBold SemiConden', 'Bahnschrift Light Condensed', 'Bahnschrift SemiLight Condensed', 'Bahnschrift Condensed', 'Bahnschrift SemiBold Condensed', 'Calibri', 'Calibri Light', 'Cambria', 'Cambria Math', 'Candara', 'Candara Light', 'Comic Sans MS', 'Consolas', 'Constantia', 'Corbel', 'Corbel Light', 'Courier New', 'Courier New Baltic', 'Courier New CE', 'Courier New CYR', 'Courier New Greek', 'Courier New TUR', 'Ebrima', 'Franklin Gothic Medium', 'Gabriola', 'Gadugi', 'Georgia', 'Impact', 'Ink Free', 'Javanese Text', 'Leelawadee UI', 'Leelawadee UI Semilight', 'Lucida Console', 'Lucida Sans Unicode', 'Malgun Gothic', '@Malgun Gothic', 'Malgun Gothic Semilight', '@Malgun Gothic Semilight', 'Microsoft Himalaya', 'Microsoft JhengHei', '@Microsoft JhengHei', 'Microsoft JhengHei UI', '@Microsoft JhengHei UI', 'Microsoft JhengHei Light', '@Microsoft JhengHei Light', 'Microsoft JhengHei UI Light', '@Microsoft JhengHei UI Light', 'Microsoft New Tai Lue', 'Microsoft PhagsPa', 'Microsoft Sans Serif', 'Microsoft Tai Le', '微软雅黑', '@微软雅黑', 'Microsoft YaHei UI', '@Microsoft YaHei UI', '微软雅黑 Light', '@微软雅黑 Light', 'Microsoft YaHei UI Light', '@Microsoft YaHei UI Light', 'Microsoft Yi Baiti', 'MingLiU-ExtB', '@MingLiU-ExtB', 'PMingLiU-ExtB', '@PMingLiU-ExtB', 'MingLiU_HKSCS-ExtB', '@MingLiU_HKSCS-ExtB', 'Mongolian Baiti', 'MS Gothic', '@MS Gothic', 'MS UI Gothic', '@MS UI Gothic', 'MS PGothic', '@MS PGothic', 'MV Boli', 'Myanmar Text', 'Nirmala UI', 'Nirmala UI Semilight', 'Palatino Linotype', 'Segoe MDL2 Assets', 'Segoe Print', 'Segoe Script', 'Segoe UI', 'Segoe UI Black', 'Segoe UI Emoji', 'Segoe UI Historic', 'Segoe UI Light', 'Segoe UI Semibold', 'Segoe UI Semilight', 'Segoe UI Symbol', '宋体', '@宋体', '新宋体', '@新宋体', 'SimSun-ExtB', '@SimSun-ExtB', 'Sitka Small', 'Sitka Text', 'Sitka Subheading', 'Sitka Heading', 'Sitka Display', 'Sitka Banner', 'Sylfaen', 'Symbol', 'Tahoma', 'Times New Roman', 'Times New Roman Baltic', 'Times New Roman CE', 'Times New Roman CYR', 'Times New Roman Greek', 'Times New Roman TUR', 'Trebuchet MS', 'Verdana', 'Webdings', 'Wingdings', 'Yu Gothic', '@Yu Gothic', 'Yu Gothic UI', '@Yu Gothic UI', 'Yu Gothic UI Semibold', '@Yu Gothic UI Semibold', 'Yu Gothic Light', '@Yu Gothic Light', 'Yu Gothic UI Light', '@Yu Gothic UI Light', 'Yu Gothic Medium', '@Yu Gothic Medium', 'Yu Gothic UI Semilight', '@Yu Gothic UI Semilight', '等线', '@等线', '等线 Light', '@等线 Light', '仿宋', '@仿宋', '楷体', '@楷体', '黑体', '@黑体', 'HoloLens MDL2 Assets', 'Agency FB', 'Algerian', 'Book Antiqua', 'Arial Narrow', 'Arial Rounded MT Bold', 'Baskerville Old Face', 'Bauhaus 93', 'Bell MT', 'Bernard MT Condensed', 'Bodoni MT', 'Bodoni MT Black', 'Bodoni MT Condensed', 'Bodoni MT Poster Compressed', 'Bookman Old Style', 'Bradley Hand ITC', 'Britannic Bold', 'Berlin Sans FB', 'Berlin Sans FB Demi', 'Broadway', 'Brush Script MT', 'Bookshelf Symbol 7', 'Californian FB', 'Calisto MT', 'Castellar', 'Century Schoolbook', 'Centaur', 'Century', 'Chiller', 'Colonna MT', 'Cooper Black', 'Copperplate Gothic Bold', 'Copperplate Gothic Light', 'Curlz MT', 'Dubai', 'Dubai Light', 'Dubai Medium', 'Elephant', 'Engravers MT', 'Eras Bold ITC', 'Eras Demi ITC', 'Eras Light ITC', 'Eras Medium ITC', 'Felix Titling', 'Forte', 'Franklin Gothic Book', 'Franklin Gothic Demi', 'Franklin Gothic Demi Cond', 'Franklin Gothic Heavy', 'Franklin Gothic Medium Cond', 'Freestyle Script', 'French Script MT', 'Footlight MT Light', '方正舒体', '@方正舒体', '方正姚体', '@方正姚体', 'Garamond', 'Gigi', 'Gill Sans MT', 'Gill Sans MT Condensed', 'Gill Sans Ultra Bold Condensed', 'Gill Sans Ultra Bold', 'Gloucester MT Extra Condensed', 'Gill Sans MT Ext Condensed Bold', 'Century Gothic', 'Goudy Old Style', 'Goudy Stout', 'Harlow Solid Italic', 'Harrington', 'Haettenschweiler', 'High Tower Text', 'Imprint MT Shadow', 'Informal Roman', 'Blackadder ITC', 'Edwardian Script ITC', 'Kristen ITC', 'Jokerman', 'Juice ITC', 'Kunstler Script', 'Wide Latin', 'Lucida Bright', 'Lucida Calligraphy', 'Leelawadee', 'Lucida Fax', 'Lucida Handwriting', 'Lucida Sans', 'Lucida Sans Typewriter', 'Magneto', 'Maiandra GD', 'Matura MT Script Capitals', 'Mistral', 'Modern No. 20', 'Microsoft Uighur', 'Monotype Corsiva', 'Niagara Engraved', 'Niagara Solid', 'OCR A Extended', 'Old English Text MT', 'Onyx', 'MS Outlook', 'Palace Script MT', 'Papyrus', 'Parchment', 'Perpetua', 'Perpetua Titling MT', 'Playbill', 'Poor Richard', 'Pristina', 'Rage Italic', 'Ravie', 'MS Reference Sans Serif', 'MS Reference Specialty', 'Rockwell Condensed', 'Rockwell', 'Rockwell Extra Bold', 'Script MT Bold', 'Showcard Gothic', '隶书', '@隶书', '幼圆', '@幼圆', 'Snap ITC', '华文彩云', '@华文彩云', 'Stencil', '华文仿宋', '@华文仿宋', '华文琥珀', '@华文琥珀', '华文楷体', '@华文楷体', '华文隶书', '@华文隶书', '华文宋体', '@华文宋体', '华文细黑', '@华文细黑', '华文行楷', '@华文行楷', '华文新魏', '@华文新魏', '华文中宋', '@华文中宋', 'Tw Cen MT', 'Tw Cen MT Condensed', 'Tw Cen MT Condensed Extra Bold', 'Tempus Sans ITC', 'Viner Hand ITC', 'Vivaldi', 'Vladimir Script', 'Wingdings 2', 'Wingdings 3', 'Cascadia Code ExtraLight', 'Cascadia Code Light', 'Cascadia Code SemiLight', 'Cascadia Code', 'Cascadia Code SemiBold', 'Cascadia Mono ExtraLight', 'Cascadia Mono Light', 'Cascadia Mono SemiLight', 'Cascadia Mono', 'Cascadia Mono SemiBold', 'Heebo')
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
