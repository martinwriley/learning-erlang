-module(echo).
-export([go/0, loop/0]).

go() ->
  Pid = spawn(echo, loop, []),
  Pid ! {self(), hello},
  receive
  	{Pid, Msg} ->
  	  io:format("~w~n", [inside_go]),
  	  io:format("~w~n", [Msg])
  end,
  Pid ! stop.

  loop() ->
    receive
      {From, Msg} ->
        From ! {self(), Msg},
        io:format("~w~n", [inside_loop]),
        loop();
      stop ->
        true
    end.