#include <bits/stdc++.h>
#define FastIO ios :: sync_with_stdio(0); cin.tie(0); cout.tie(0);
#define int long long
using namespace std;
int n;
void solution(vector<int> Arr){
    vector<int> Length(n, 1);
    vector<pair<int, int> > Ans;
    int max_length_end = 0, max_length = 0;
    for(int i = 0; i < n; i++)
        for(int j = 0; j < i; j++)
            if(Arr[i] < Arr[j])
                Length[i] = max(Length[i], Length[j] + 1);
    for(int i = 0; i < n; i++)
        if(Length[i] > max_length){
            max_length = Length[i];
            max_length_end = i;
        }
    cout << max_length << '\n';
    Ans.push_back(make_pair(max_length_end, Arr[max_length_end]));
    for(int i = max_length_end - 1; i >= 0; i--)
        if(Arr[i] > Ans[Ans.size() - 1].second && Length[i] == Length[Ans[Ans.size() - 1].first] - 1){
            Ans.push_back(make_pair(i, Arr[i]));
            if(Length[i] == 1)
                break;
        }
    for(int i = Ans.size() - 1; i >= 0; i--)
        cout << Ans[i].first + 1 << ' ' << Ans[i].second << '\n';
}
void setData(){
    freopen("BAI4.INP", "r", stdin);
    freopen("BAI4.OUT", "w", stdout);
    cin >> n;
    vector<int> Arr(n);
    for(int i = 0; i < n; i++)
        cin >> Arr[i];
    solution(Arr);
}
int32_t main(){
    setData();
}