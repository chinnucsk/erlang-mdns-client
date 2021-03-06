%% Copyright (c) 2012, Peter Morgan <peter.james.morgan@gmail.com>
%%
%% Permission to use, copy, modify, and/or distribute this software for any
%% purpose with or without fee is hereby granted, provided that the above
%% copyright notice and this permission notice appear in all copies.
%%
%% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
%% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
%% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
%% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
%% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
%% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
%% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

-module(mdns_client).
-export([start/0,
	 name/0,
	 stop/0,
	 discovered/0,
	 discovered/1,
	 add_type/1,
	 types/0,
	 make/0]).

name() ->
    ?MODULE.

start() ->
    application:start(?MODULE).

stop() ->
    gen_server:call(name(), stop).

discovered() ->
    gen_server:call(name(), discovered).

discovered(Type) ->
    gen_server:call(name(), {discovered, Type}).


add_type(Type) ->
    gen_server:cast(name(), {add_type, Type}).

types() ->
    gen_server:call(name(), types).


make() ->
    make:all([load]).
