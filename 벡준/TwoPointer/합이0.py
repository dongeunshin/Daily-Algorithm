import sys

N = int(input())
arr = list(map(int, sys.stdin.readline().split()))
arr.sort()
ans = 0
for i in range(N - 2):
    left, right = i + 1, N - 1
    goal = -arr[i]
    mx_idx = N
    while left < right:
        tmp = arr[left] + arr[right]
        if tmp < goal:
            left += 1
        elif tmp == goal:
            if arr[left] == arr[right]:
                ans += right - left
            else:
                if mx_idx > right:
                    mx_idx = right
                    while mx_idx >= 0 and arr[mx_idx - 1] == arr[right]:
                        mx_idx -= 1
                ans += right - mx_idx + 1
            left += 1
        else:
            right -= 1
print(ans)  
