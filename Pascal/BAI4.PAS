uses crt;
type
    AnsInfo = record
        Value : int64;
        Iterator : int64;
    end;
var n : int64;
    Arr : array[1..5001] of int64;
    Ans : array[1..5001] of AnsInfo;
    f1, f2 : text;
const fi = 'BAI4.INP';
      fo = 'BAI4.OUT';
procedure setData;
var i : integer;
    begin
        assign(f1, fi); reset(f1);
        assign(f2, fo); rewrite(f2);
        readln(f1, n);
        for i := 1 to n do
            read(f1, Arr[i]);
    end;
procedure solution;
var Length : array[1..5001] of int64;
    max_length_end, max_length, Count : int64;
    i, j : integer;
    begin
        Count := 1;
        max_length_end := 0;
        max_length := 0;
        for i := 1 to n do
            Length[i] := 1;
        for i := 1 to n do 
            for j := 1 to i do 
                if Arr[i] < Arr[j] then
                    if Length[i] <= Length[j] + 1 then
                        Length[i] := Length[j] + 1;
        for i := 1 to n do
            if Length[i] > max_length then 
                begin
                    max_length := Length[i];
                    max_length_end := i;
                end;
        writeln(f2, max_length);
        Ans[Count].Value := Arr[max_length_end];
        Ans[Count].Iterator := max_length_end;
        for i := max_length_end - 1 downto 1 do 
            begin
            if (Arr[i] > Ans[Count].Value) and (Length[i] = Length[Ans[Count].Iterator] - 1) then
                begin
                    inc(Count);
                    Ans[Count].Value := Arr[i];
                    Ans[Count].Iterator := i;
                    if Length[i] = 1 then 
                        break;
                end;
            end;
        for i := Count downto 1 do 
            writeln(f2, Ans[i].Iterator, ' ', Ans[i].Value);
    end;
begin
    setData;
    Solution;
    close(f1); close(f2);
end.