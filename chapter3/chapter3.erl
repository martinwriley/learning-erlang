-module(chapter3).
-export([sum/1, sum/2, create/1, reverse_create/1, print_numbers/1]).
-export([print_even_numbers/1, filter/2, filter_reverse/2, concatenate/1]).
-export([flatten/1]).

%%%%%%%%%%%%%%%%%%%%%%%%% Exported Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sum(N) when N > 0 -> sum_acc(N, 0).

sum(N, M) when N =< M -> sum_acc(N, M, N). 

create(N) when N > 0 -> create_acc(1, N).

reverse_create(N) when N > 0 -> [N | reverse_create(N - 1)];
reverse_create(0) -> [].

print_numbers(N) when N > 0 -> print_numbers(N - 1),				
  io:format("Number:~p~n", [N]);
print_numbers(0) -> {done}.

print_even_numbers(N) when (N > 0), ((N rem 2) == 0) -> 
  print_even_numbers(N - 1),
  io:format("Number:~p~n", [N]);
print_even_numbers(N) when N > 0 -> print_even_numbers(N - 1);
print_even_numbers(0) -> {done}.

filter([X | T], Max) when X =< Max -> [X | filter(T, Max)];
filter([_ | T], Max) -> filter(T, Max);
filter([], _) -> []. 

filter_reverse(Xs, Max) -> filter_reverse_acc(Xs, Max, []).

concatenate(N) when is_list(N) ->  concatenate_acc(N, []).

flatten(N) when is_list(N) ->  flatten_acc(N, []).

%%%%%%%%%%%%%%%%%%%%%%%%% Private Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sum_acc(0, Sum) -> Sum;
sum_acc(N, Sum) -> sum_acc(N - 1, Sum + N).

sum_acc(N, N, Sum) -> Sum;
sum_acc(N, M, Sum) -> sum_acc(N, M - 1, Sum + M).

create_acc(N, N) -> [N];
create_acc(N, M) -> [N | create_acc(N + 1, M)].

filter_reverse_acc([H | T], Max, Acc) when H =< Max -> 
  filter_reverse_acc(T, Max, [H | Acc]);
filter_reverse_acc([_ | T], Max, Acc) -> filter_reverse_acc(T, Max, Acc);
filter_reverse_acc([], _, Acc) -> Acc.

concatenate_acc([], Acc) -> Acc;
concatenate_acc([H | T], Acc) ->  concatenate_acc(H, concatenate_acc(T,Acc));
concatenate_acc(N, Acc) ->  [N | Acc].

flatten_acc([H | T], Acc) when is_list(H) -> 
  flatten_acc(H, flatten_acc(T, Acc));
flatten_acc([], Acc) -> Acc;
flatten_acc([H | T], Acc) ->  [H | flatten_acc(T, Acc)];
flatten_acc(N, Acc) ->  [N | Acc].
