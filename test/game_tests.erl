-module(game_tests).
-include_lib("eunit/include/eunit.hrl").

start_link_test_() ->
  {setup,
    fun setup/0,
    fun cleanup/1,
    fun it_should_start_process/1}.

setup() ->
  {ok, Pid} = game:start_link(nameOfTheGame),
  Pid.

cleanup(Ref) ->
  gen_server:stop(Ref).

it_should_start_process(Ref) ->
  ?_assert(is_process_alive(Ref)).
