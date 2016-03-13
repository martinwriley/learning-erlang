-module(db).
-export([new/0,destroy/1,write/3,delete/2,read/2,match/2]).

%%%%%%%%%%%%%%%%%%%%%%%%% Exported Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new() -> [].
destroy(_) -> ok.
write(Key, Element, Db) -> [{Key, Element} | Db].
delete(Key, Db)	-> delete_entry(Key, Db).
read(Key, Db) -> read_entry(Key, Db).
match(Element, Db) -> match_entry(Element, Db).

%%%%%%%%%%%%%%%%%%%%%%%%% Private Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

delete_entry(Key, [{Key, _} | T]) -> T;
delete_entry(Key, [H | T]) -> [H | delete_entry(Key, T)];
delete_entry(_, []) -> [].

read_entry(Key, [{Key, Element} | _]) -> {Key, Element};
read_entry(Key, [_ | T]) -> read_entry(Key, T);
read_entry(_, []) -> {error, instance}.	

match_entry(Element, [{Key, Element} | _]) -> Key;
match_entry(Element, [_ | T]) -> match_entry(Element, T);
match_entry(_, []) -> {error, instance}.