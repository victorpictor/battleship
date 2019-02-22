-module (games).

-behaviour (supervisor).

-export ([start_link/0, start_child/1]).
-export ([init/1]).

start_link() ->
  supervisor:start_link({local,?MODULE}, ?MODULE, []).

start_child(Name) ->
  supervisor:start_child(?MODULE, [Name]).

init(Arg) ->
  Restart = {simple_one_for_one, 10, 60},
  Children = [{game, {game, start_link, []}, permanent, brutal_kill, supervisor, [game]}],
  {ok,{Restart, Children}}.
