def solution(brown, yellow):
    answer = []
    x = 1
    while True:
        y = 1
        while x >= y :
            if x*y == yellow:
                if 2*x + 2*y + 4 == brown:
                    return [x+2, y+2]
            y += 1
        x += 1
