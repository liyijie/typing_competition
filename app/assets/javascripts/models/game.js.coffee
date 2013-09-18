# for more details see: http://emberjs.com/guides/models/defining-models/

TypingCompetition.Game = DS.Model.extend
  score: DS.attr 'number'
  userId: DS.attr 'number'
  durationTime: DS.attr 'number'
  wordCount: DS.attr 'number'
