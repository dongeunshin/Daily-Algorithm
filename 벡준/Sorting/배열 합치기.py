import sys

a, b = map(int, sys.stdin.readline().split())
alist = list(map(int, sys.stdin.readline().split()))
blist = list(map(int, sys.stdin.readline().split()))
anslist = alist + blist
answer = ' '.join(map(str, sorted(anslist)))
print(answer)
