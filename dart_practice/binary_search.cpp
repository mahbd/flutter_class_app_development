#include <bits/stdc++.h>

using namespace std;

class Solution
{
public:
    int search(vector<int> &nums, int target)
    {
        // find index of target
        if (lower_bound(nums.begin(), nums.end(), target) == nums.end() || *lower_bound(nums.begin(), nums.end(), target) != target)
            return -1;
        int index = lower_bound(nums.begin(), nums.end(), target) - nums.begin();
        return index;
    }
};