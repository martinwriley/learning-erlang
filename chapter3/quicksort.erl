-module(quicksort).
-export([quicksort/1]).

%%%%%%%%%%%%%%%%%%%%%%%%% Exported Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
quicksort([]) -> [];
quicksort([H | []]) -> [H];
quicksort([H | T]) -> 
  quicksort(smaller(H, T)) ++ [H] ++ quicksort(higher(H, T)).


%%%%%%%%%%%%%%%%%%%%%%%%% Private Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
higher(_, []) -> [];
higher(Comp, [H | T]) when Comp =< H -> [H | higher(Comp, T)];
higher(Comp, [_ | T]) -> higher(Comp, T).

smaller(_, []) -> [];
smaller(Comp, [H | T]) when Comp > H -> [H | smaller(Comp, T)];
smaller(Comp, [_ | T]) -> smaller(Comp, T).

