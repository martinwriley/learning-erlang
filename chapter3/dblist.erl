-module(dblist).
-export([new/0,destroy/1,write/3,delete/2,read/2,match/2]).

%%%%%%%%%%%%%%%%%%%%%%%%% Exported Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new() -> [].
destroy(_) -> ok.
write(Key, Element, Db) -> [{Key, Element} | Db].
delete(Key, Db)	-> lists:keydelete(Key, 1, Db).
read(Key, Db) -> lists:keyfind(Key, 1, Db).
match(Element, Db) -> match_entry(Element, Db).

%%%%%%%%%%%%%%%%%%%%%%%%% Private Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

match_entry(Element, [{Key, Element} | _]) -> Key;
match_entry(Element, [_ | T]) -> match_entry(Element, T);
match_entry(_, []) -> {error, instance}.