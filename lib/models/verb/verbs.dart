import 'package:namer_app/models/verb/irregular_verbs.dart';
import 'package:namer_app/models/verb/regular_verbs.dart';
import 'package:namer_app/models/verb/verb.dart';

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
      presentPerfect: irregular.presentPerfect,
      pastPerfect: irregular.pastPerfect,
      pastSimple: irregular.pastSimple,
      pastContinious: irregular.pastContinious,
      futureSimple: regularVerbs.futureSimple,
      futureSimpleNegative: regularVerbs.futureSimpleNegative,
      goingTo: regularVerbs.goingTo,
      effectiveParticiple: regularVerbs.effectiveParticiple,
      subjectiveParticiple: regularVerbs.subjectiveParticiple,
      presentParticiple: regularVerbs.presentParticiple,
    );
  } else if (effectiveRawValue.length < 4) {
    throw AssertionError();
  } else {
    return Verb(
      infinitive: infinitive,
      stamp: stamp,
      imperativeMood: regularVerbs.imperativeMood,
      present: regularVerbs.present,
      presentPerfect: regularVerbs.presentPerfect,
      pastPerfect: regularVerbs.pastPerfect,
      pastSimple: regularVerbs.pastSimple,
      pastContinious: regularVerbs.pastContinious,
      futureSimple: regularVerbs.futureSimple,
      futureSimpleNegative: regularVerbs.futureSimpleNegative,
      goingTo: regularVerbs.goingTo,
      effectiveParticiple: regularVerbs.effectiveParticiple,
      subjectiveParticiple: regularVerbs.subjectiveParticiple,
      presentParticiple: regularVerbs.presentParticiple,
    );
  }
}
