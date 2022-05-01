def solution(s):
    answer = ''
    dict = {'zero': '0','one' : '1','two' :'2','three' : '3','four' : '4','five' : '5','six' : '6','seven' : '7', 'eight' : '8','nine' : '9'}
    temp = ''
    for i in range(len(s)):
        if s[i].isdigit():
            if temp in dict:
                answer += dict[temp]
                temp = ''
            answer += s[i]
        else:
            temp += s[i]
            if temp in dict:
                answer += dict[temp]
                temp = ''


    return int(answer)
