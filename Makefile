APP    := lfe_elli_example
REBAR3 ?= @rebar3

.PHONY: all compile release run check clean clean-all docs

all: compile

compile:
	$(REBAR3) compile

release:
	$(REBAR3) release

_build/default/rel/$(APP)/bin/$(APP): release

run: _build/default/rel/$(APP)/bin/$(APP)
	$< console

check:
	$(REBAR3) eunit

clean:
	$(REBAR3) clean

clean-all:
	$(REBAR3) clean -a

docs:
	$(REBAR3) lfe lodox
