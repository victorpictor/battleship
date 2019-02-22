-module (games_tests).
-include_lib("eunit/include/eunit.hrl").

setup() ->
  {ok, Pid} = games:start_link(),
  Pid.

cleanup(Pid) ->
  exit(Pid, normal).

game_test_() ->
  {setup,
    fun setup/0,
    fun cleanup/1,
    fun (Pid) ->
      [it_should_start_supervisor(Pid),
       it_should_start_child(Pid)]
    end}.

it_should_start_supervisor(Pid) ->
  ?_assert(is_process_alive(Pid)).

it_should_start_child(Pid) ->
  {ok, Child1} = games:start_child(test_name1),
  {ok, Child2} = games:start_child(test_name2),
  ?_assert(is_process_alive(Child1)),
  ?_assert(is_process_alive(Child2)).
