# http://emberjs.com/guides/models/defining-a-store/

TypingCompetition.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()

