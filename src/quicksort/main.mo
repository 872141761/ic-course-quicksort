import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

actor {
    public func qsort(arr: [Int]): async [Int]{
       var newArr :[var Int] = Array.thaw(arr);
       quicksort(newArr);
       return Array.freeze(newArr);
   };

  func quicksort(arr: [var Int]) {
      sort(arr, 0, arr.size()-1);
  };

  func sort(arr: [var Int], left: Int, right:Int) {
        if (left >= right) return;

        var p = partition(arr, Int.abs(left), Int.abs(right));
        sort(arr, left, p - 1);
        sort(arr, p + 1, right);
  };

  func swap(arr: [var Int], i:Nat, j:Nat) {
      var temp = arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
  };

  func partition(arr: [var Int], left:Nat, right:Nat): Int {
      var v = arr[left];
      var i = left;
      var j = right + 1;
      
      label a loop {
          label b loop {
              i := i + 1;
              if (arr[i] > v) break b;
              if (i == right) break b;};

            label c loop {
                j := j - 1;
                if (v > arr[j]) break c;
                if (j == left) break c;
            };

            if (i >= j) break a;

            swap(arr, i, j);
        };

        swap(arr, left, j);

        return j;
  };
};

