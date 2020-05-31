//
//  main.cpp
//  kakao
//
//  Created by MinG._. on 2020/05/09.
//  Copyright © 2020 MinG._. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>

#define INF 2100000000

using namespace std;

void up(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y);
void down(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y);
void left(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y);
void right(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y);

int get_min(int a, int b) {
    if (a < b) return a;
    return b;
}

int big[25][25];
int minimum = INF;

void initializing() {
    for(int i = 0; i < 25; i++) {
        for(int j = 0; j < 25; j++) {
            big[i][j] = INF;
        }
    }
}


void up(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y) {
    int size = temp.size();
    
    if (x >=0 && x < size && y >=0 && y < size) {
        if (!temp[x][y] && !check[x][y]) {
            check[x][y] = true;
            answer += 100;
            
            if(big[x][y] >= answer - 100) {
                big[x][y] = answer;
                if(x == temp.size() - 1 && y == temp.size() - 1) {
                    minimum = get_min(minimum, answer);
                }
                
                up(temp, check, answer, x-1, y);
                down(temp, check, answer+500, x+1, y);
                left(temp, check,answer+500, x, y-1);
                right(temp, check,answer+500, x, y+1);
                
            }
        }
    }
}

void down(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y) {
    int size = temp.size();
    
    if (x >=0 && x < size && y >=0 && y < size) {
        if (!temp[x][y] && !check[x][y]) {
            check[x][y] = true;
            answer += 100;
            
            if(big[x][y] >= answer - 100) {
                big[x][y] = answer;
                if(x == temp.size() - 1 && y == temp.size() - 1) {
                    minimum = get_min(minimum, answer);
                }
                
                up(temp, check, answer+500, x-1, y);
                down(temp, check, answer, x+1, y);
                left(temp, check,answer+500, x, y-1);
                right(temp, check,answer+500, x, y+1);
            }
        }
    }
}

void left(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y) {
    int size = temp.size();
    
    if (x >=0 && x < size && y >=0 && y < size) {
        if (!temp[x][y] && !check[x][y]) {
            check[x][y] = true;
            answer += 100;
            
            if(big[x][y] >= answer - 100) {
                big[x][y] = answer;
                if(x == temp.size() - 1 && y == temp.size() - 1) {
                    minimum = get_min(minimum, answer);
                }
                
                up(temp, check, answer+500, x-1, y);
                down(temp, check, answer+500, x+1, y);
                left(temp, check,answer, x, y-1);
                right(temp, check,answer+500, x, y+1);
            }
        }
    }
}

void right(vector<vector<int>> temp, vector<vector<bool>> check, int answer, int x, int y) {
    int size = temp.size();
    
    if (x >=0 && x < size && y >=0 && y < size) {
        if (!temp[x][y] && !check[x][y]) {
            check[x][y] = true;
            answer += 100;
            
            if(big[x][y] >= answer - 100) {
                big[x][y] = answer;
                if(x == temp.size() - 1 && y == temp.size() - 1) {
                    minimum = get_min(minimum, answer);
                }
                
                up(temp, check, answer+500, x-1, y);
                down(temp, check, answer+500, x+1, y);
                left(temp, check, answer+500, x, y-1);
                right(temp, check, answer, x, y+1);
            }
        }
    }
}

int solution(vector<vector<int>> board) {
    int answer = 0;
    
    vector<vector<bool>> check(board.size(), vector<bool> (board.size(), false));
    
    check[0][0] = 1;
    initializing();
    down(board, check, 0, 1, 0);
    right(board, check, 0, 0, 1);
    cout << minimum;
    
    return answer;
}

int main(int argc, const char * argv[]) {
    vector<vector<int>> a(3, vector<int> (3, 0));
    
    vector<vector<int>> b(8, vector<int> (8, 0));
    
    b[0][7] = 1; b[2][5] = 1; b[3][4] = 1; b[4][3] = 1; b[4][7] = 1; b[5][2] = 1; b[5][6] = 1; b[6][1] = 1; b[6][5] = 1; b[7][0] = 1;
    
    vector<vector<int>> c(4, vector<int> (4, 0));
    
    c[0][2] = 1; c[2][1] = 1; c[2][3] = 1; c[3][0] = 1;
    
    solution(b);
    
    return 0;
}
