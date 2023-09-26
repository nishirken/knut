import 'package:namer_app/data/irregular_verbs.dart';
import 'package:namer_app/data/regular_verbs.dart';
import 'package:namer_app/data/verb.dart';

Verb mkVerb(String rawValue) {
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
      imperativeMood: irregular.imperative,
      present: irregular.present,
      pastSimple: irregular.pastSimple,
      pastContinious: irregular.pastContinious,
      futureSimple: regularVerbs.futureSimple,
      futureSimpleNegative: regularVerbs.futureSimpleNegative,
      goingTo: regularVerbs.goingTo,
    );
  } else if (effectiveRawValue.length < 4) {
    throw AssertionError();
  } else {
    return Verb(
      infinitive: infinitive,
      stamp: stamp,
      imperativeMood: regularVerbs.imperativeMood,
      present: regularVerbs.present,
      pastSimple: regularVerbs.pastSimple,
      pastContinious: regularVerbs.pastContinious,
      futureSimple: regularVerbs.futureSimple,
      futureSimpleNegative: regularVerbs.futureSimpleNegative,
      goingTo: regularVerbs.goingTo,
    );
  }
}
