from tkinter import scrolledtext
from tkinter import *
from tkinter.ttk import *
from sv_ttk import *



def run_bat(bat_text):
    out_text.configure(state='normal')
    out_text.delete(1.0,END)
    out_text.configure(state='disabled')
    for i in range(0,len(bat_text),1):
        if bat_text[i]=='':
            continue
        else:
            abs = os.popen(bat_text[i])
            out_text.configure(state='normal')
            out_text.insert(INSERT,abs.read())
            out_text.configure(state='disabled')



import os,sys
os.chdir(os.path.dirname(sys.argv[0]))

rb=Tk()
rb.resizable(False,False)
rb.title('Run Batch File-v1.0a1')
global out_text
nr_text=scrolledtext.ScrolledText(rb,font='Consolas 10')
nr_text.grid(row=0,column=0)
out_text=scrolledtext.ScrolledText(rb,state='disabled',font='Consolas 10')
out_text.grid(row=2,column=0)
a_run=Button(rb,text='One-Click Run',command=lambda:run_bat(nr_text.get('1.0',END).splitlines()))
a_run.grid(row=1,column=0)
if __name__!='__main__':
    with open('np_modules\\batedit\\batfile.bat',encoding='utf-8')as d:
        bat_text=d.read()
        nr_text.insert(1.0,bat_text)
        #print(bat_text)
else:
    with open('batfile.bat',encoding='utf-8')as d:
        bat_text=d.read()
        nr_text.insert(1.0,bat_text)
        #print(bat_text)

rb.mainloop()
