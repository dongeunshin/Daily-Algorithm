def solution(msg): 
    answer = []
    
    dict = {}
    for i in range(1,27):
        dict[chr(i+64)] = i
    
    n = 1
    while True:
        i = 1         
        while len(msg) >= i:
            if msg[:i]in dict and len(msg) == i:
                answer.append(dict[msg])
                return answer
            if msg[:i] not in dict:
                w = msg[:i-1]
                answer.append(dict[w])
                msg = msg[i-1:]
                break
            i += 1
        if len(msg) > 0:
            dict[w + msg[0]] = 26 + n
            n += 1
        else:
            break
