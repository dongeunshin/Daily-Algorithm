def solution(files):
    answer = []
    for i in files:
        HEAD, NUMBER, TAIL = '','',''
        number_check = False
        for j in range(len(i)):
            if i[j].isdigit():
                NUMBER += i[j]
                number_check = True
            elif not number_check:
                HEAD += i[j]
            else:
                TAIL += i[j:]
                break
        answer.append((HEAD, NUMBER, TAIL))
    print(answer)
    answer.sort(key=lambda x: (x[0].lower(), int(x[1])))
    return [''.join(a) for a in answer]

