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
  futureSimple,
  futureSimpleNegative,
  goingTo,
}

class Verb {
  final String infinitive;
  final String stamp;
  final ImperativeMood imperativeMood;
  final InflectedVerb present;
  final InflectedVerb pastContinious;
  final InflectedVerb futureSimple;
  final InflectedVerb futureSimpleNegative;
  final InflectedVerb goingTo;

  Verb({
    required this.infinitive,
    required this.stamp,
    required this.imperativeMood,
    required this.present,
    required this.pastContinious,
    required this.futureSimple,
    required this.futureSimpleNegative,
    required this.goingTo,
  });
}
