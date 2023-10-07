typedef ByFace = ({
  List<String> first,
  List<String> second,
  List<String> third,
});

typedef InflectedVerb = ({
  ByFace singular,
  ByFace plural,
});

typedef EndingsSets<T> = ({
  T al,
  T el,
});

typedef ImperativeMood = ({List<String> singular, List<String> plural});

enum Tense {
  infinitive,
  imperative,
  present,
  pastContinious,
  pastSimple,
  presentPerfect,
  pastPerfect,
  futureSimple,
  futureSimpleNegative,
  goingTo,
  effectiveParticiple,
  subjectiveParticiple,
  presentParticiple,
}

class Verb {
  final String infinitive;
  final String stamp;
  final ImperativeMood imperativeMood;
  final InflectedVerb present;
  final InflectedVerb pastContinious;
  final InflectedVerb pastSimple;
  final InflectedVerb presentPerfect;
  final InflectedVerb pastPerfect;
  final InflectedVerb futureSimple;
  final InflectedVerb futureSimpleNegative;
  final InflectedVerb goingTo;
  final String effectiveParticiple;
  final String subjectiveParticiple;
  final String presentParticiple;

  Verb({
    required this.infinitive,
    required this.stamp,
    required this.imperativeMood,
    required this.present,
    required this.presentPerfect,
    required this.pastPerfect,
    required this.pastContinious,
    required this.pastSimple,
    required this.futureSimple,
    required this.futureSimpleNegative,
    required this.goingTo,
    required this.effectiveParticiple,
    required this.subjectiveParticiple,
    required this.presentParticiple,
  });
}