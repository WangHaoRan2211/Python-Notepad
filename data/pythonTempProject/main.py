from random import *



a=0
n=input('Please input n:')
s=randint(1,int(n))
while True:
    a=input('Please input a 1~n math:')
    if a=='/get n':
        print(n)
    elif a=='/get answer':
        print(str(s))
    elif a=='/exit':
        exit()
    else:
        if int(a)>s:
            print('Math is too big!')
        if int(a)<s:
            print('Math is to small!')
        if int(a)==s:
            print('You Win!!!')
            break

input('')

