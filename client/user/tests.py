from functools import reduce


def juft_sonlar(b):
    for i in range(1,b):
        if i%2==0:
            yield i
for i in juft_sonlar(30):

    print(i)