def solution(genres, plays):
    answer = []
    numOfPlaying = {}
    playByGenres = {}
    
    for i in range(len(genres)):
        if genres[i] in numOfPlaying:
            numOfPlaying[genres[i]] += plays[i]
        else:
            numOfPlaying[genres[i]] = plays[i]
            playByGenres[genres[i]] = []
            
        playByGenres[genres[i]].append((i, plays[i]))
        playByGenres[genres[i]] = sorted(playByGenres[genres[i]],key=lambda x: -x[1]) # 매번 sort해주는 거보다 더 좋은 방법이 있을꺼 같다. 
                                                                                      # 마지막에 한번에 하고 싶은데 람다식을 어떻게 세워야지?
        
    sort_dict = sorted(numOfPlaying.items(),key=lambda x: -x[1])
    for key in sort_dict:
        for p in playByGenres[key[0]][:2]:
            answer.append(p[0])
    return answer
  
  
