# for more details see: http://emberjs.com/guides/models/defining-models/

TypingCompetition.Sentence = DS.Model.extend
  content: DS.attr 'string'
  wordCount: DS.attr 'number'
  typeId: DS.attr 'number'
