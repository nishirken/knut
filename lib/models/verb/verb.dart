import 'package:namer_app/models/verb/irregular_verbs.dart';
import 'package:namer_app/models/verb/regular_verbs.dart';

typedef InflectedFacialTense = ({
  List<String> first,
  List<String> second,
  List<String> third,
});

typedef InflectedTenseCollection = ({
  InflectedFacialTense singular,
  InflectedFacialTense plural,
});

class InflectedTense {
  final InflectedFacialTense singular;
  final InflectedFacialTense plural;

  InflectedTense({required InflectedTenseCollection collection})
      : singular = collection.singular,
        plural = collection.plural;
}

class IrregularInflectedTense extends InflectedTense {
  IrregularInflectedTense({required super.collection});
}

class RegularInflectedTense extends InflectedTense {
  RegularInflectedTense({required super.collection});
}

typedef EndingsSets<T> = ({
  T al,
  T el,
});

typedef ImperativeMoodCollection = ({
  List<String> singular,
  List<String> plural
});

class ImperativeMood {
  final List<String> singular;
  final List<String> plural;

  ImperativeMood({required ImperativeMoodCollection collection})
      : singular = collection.singular,
        plural = collection.plural;
}

class IrregularImperativeMood extends ImperativeMood {
  IrregularImperativeMood({required super.collection});
}

class RegularImperativeMood extends ImperativeMood {
  RegularImperativeMood({required super.collection});
}

enum Tense {
  infinitive,
  imperativeMood,
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
  final InflectedTense present;
  final InflectedTense pastContinious;
  final InflectedTense pastSimple;
  final InflectedTense presentPerfect;
  final InflectedTense pastPerfect;
  final InflectedTense futureSimple;
  final InflectedTense futureSimpleNegative;
  final InflectedTense goingTo;
  final String effectiveParticiple;
  final String subjectiveParticiple;
  final String presentParticiple;
  final bool isRegular;

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
    required this.isRegular,
  });

  static Verb create(String rawValue) {
    final effectiveRawValue = rawValue.toLowerCase().trim();

    final infinitive = effectiveRawValue;
    final stamp = effectiveRawValue.substring(0, effectiveRawValue.length - 2);
    final irregularVerbs =
        IrregularVerbsCollection(infinitive: infinitive, stamp: stamp);
    final regularVerbs =
        RegularVerbsCollection(infinitive: infinitive, stamp: stamp);
    final irregular = irregularVerbs.collection[infinitive];

    if (irregular != null) {
      return Verb(
        infinitive: infinitive,
        stamp: stamp,
        imperativeMood: irregular.imperativeMood != null
            ? IrregularImperativeMood(collection: irregular.imperativeMood!)
            : RegularImperativeMood(collection: regularVerbs.imperativeMood),
        present: irregular.present != null
            ? IrregularInflectedTense(collection: irregular.present!)
            : RegularInflectedTense(collection: regularVerbs.present),
        presentPerfect: irregular.presentPerfect != null
            ? IrregularInflectedTense(collection: irregular.presentPerfect!)
            : RegularInflectedTense(collection: regularVerbs.presentPerfect),
        pastPerfect: irregular.pastPerfect != null
            ? IrregularInflectedTense(collection: irregular.pastPerfect!)
            : RegularInflectedTense(collection: regularVerbs.pastPerfect),
        pastSimple: irregular.pastSimple != null
            ? IrregularInflectedTense(collection: irregular.pastSimple!)
            : RegularInflectedTense(collection: regularVerbs.pastSimple),
        pastContinious: irregular.pastContinious != null
            ? IrregularInflectedTense(collection: irregular.pastContinious!)
            : RegularInflectedTense(collection: regularVerbs.pastContinious),
        futureSimple:
            RegularInflectedTense(collection: regularVerbs.futureSimple),
        futureSimpleNegative: RegularInflectedTense(
            collection: regularVerbs.futureSimpleNegative),
        goingTo: RegularInflectedTense(collection: regularVerbs.goingTo),
        effectiveParticiple: regularVerbs.effectiveParticiple,
        subjectiveParticiple: regularVerbs.subjectiveParticiple,
        presentParticiple: regularVerbs.presentParticiple,
        isRegular: false,
      );
    } else if (effectiveRawValue.length < 4) {
      throw AssertionError();
    } else {
      return Verb(
        infinitive: infinitive,
        stamp: stamp,
        imperativeMood:
            RegularImperativeMood(collection: regularVerbs.imperativeMood),
        present: RegularInflectedTense(collection: regularVerbs.present),
        presentPerfect:
            RegularInflectedTense(collection: regularVerbs.presentPerfect),
        pastPerfect:
            RegularInflectedTense(collection: regularVerbs.pastPerfect),
        pastSimple: RegularInflectedTense(collection: regularVerbs.pastSimple),
        pastContinious:
            RegularInflectedTense(collection: regularVerbs.pastContinious),
        futureSimple:
            RegularInflectedTense(collection: regularVerbs.futureSimple),
        futureSimpleNegative: RegularInflectedTense(
            collection: regularVerbs.futureSimpleNegative),
        goingTo: RegularInflectedTense(collection: regularVerbs.goingTo),
        effectiveParticiple: regularVerbs.effectiveParticiple,
        subjectiveParticiple: regularVerbs.subjectiveParticiple,
        presentParticiple: regularVerbs.presentParticiple,
        isRegular: true,
      );
    }
  }
}
