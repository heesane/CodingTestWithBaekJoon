class Solution {
    public int solution(String[] order) {
        int answer = 0;
        for(String s : order){
            if(s.indexOf("la") != -1){
                answer += 5000;
            }
            else answer += 4500;
        }
        return answer;
    }
}