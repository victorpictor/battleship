-module (game).

-behaviour (gen_server).

-export ([start_link/1]).
-export ([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2]).

start_link(GameRef) ->
  gen_server:start_link({local, GameRef}, ?MODULE, [GameRef], []).

init(Args) ->
  {ok, []}.

handle_call(Request, From, State) ->
  {reply, State, State}.

handle_cast(Request, State) ->
  {noreply, State}.

handle_info(Info, State) ->
  {noreply, State}.

terminate(Reason, State) ->
  ok.
