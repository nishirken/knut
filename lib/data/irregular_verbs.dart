import 'package:namer_app/data/regular_verbs.dart';
import 'package:namer_app/data/verb.dart';

typedef Irregular = Map<
    String,
    ({
      ImperativeMood imperative,
      InflectedVerb present,
    })>;

class IrregularVerbsCollection {
  final String infinitive;
  final String stamp;

  IrregularVerbsCollection({
    required this.infinitive,
    required this.stamp,
  });

  Irregular get collection {
    final regularVerbs =
        RegularVerbsCollection(infinitive: infinitive, stamp: stamp);

    return {
      'ասել': (
        imperative: (singular: ['ասա'], plural: ['ասացեք', 'ասաեք']),
        present: regularVerbs.present
      ),
      'գալ': (
        imperative: (singular: ['արի'], plural: ['եկեք']),
        present: RegularVerbsCollection.mkPresent(['գալիս']),
      ),
      'անել': (
        imperative: (singular: ['արա'], plural: ['արեք']),
        present: regularVerbs.present
      ),
      'առնել': (
        imperative: (singular: ['առ'], plural: ['առեք']),
        present: regularVerbs.present
      ),
      'բերել': (
        imperative: (singular: ['բեր'], plural: ['բերեք']),
        present: regularVerbs.present
      ),
      'դնել': (
        imperative: (singular: ['դիր'], plural: ['դրեք']),
        present: regularVerbs.present
      ),
      'տալ': (
        imperative: (singular: ['տուր'], plural: ['տվեք']),
        present: RegularVerbsCollection.mkPresent(['տալիս']),
      ),
      'տանալ': (
        imperative: (singular: ['տար'], plural: ['տարեք']),
        present: regularVerbs.present
      ),
      'տեսեք': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present
      ),
      'ուտել': (
        imperative: (singular: ['կեր'], plural: ['կերեք']),
        present: regularVerbs.present
      ),
      'վեր կենալ': (
        imperative: (singular: ['վեր կաց'], plural: ['վեր կացեք']),
        present: regularVerbs.present
      ),
      'լվանալ': (
        imperative: (singular: ['լվա'], plural: ['լվացեք']),
        present: regularVerbs.present
      ),
      'լինել': (
        imperative: (singular: ['եղիր'], plural: ['եղեք']),
        present: regularVerbs.present
      ),
      'թողնել': (
        imperative: (singular: ['թող'], plural: ['թողեք']),
        present: regularVerbs.present
      ),
      'բացել': (
        imperative: (singular: ['բաց', 'բացիր'], plural: ['բացարեք', 'բացեք']),
        present: regularVerbs.present
      ),
      'դառնալ': (
        imperative: (
          singular: ['դարձիր', 'դառիր'],
          plural: ['դարձեք', 'դառեք']
        ),
        present: regularVerbs.present,
      ),
      'լալ': (
        imperative: (singular: ['լաց'], plural: ['լաց']),
        present: RegularVerbsCollection.mkPresent(['լալիս']),
      ),
      'ընկնել': (
        imperative: (singular: ['ընկի'], plural: ['ընկեք']),
        present: regularVerbs.present,
      ),
      'տեսնել': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present,
      ),
      'գտնել': (
        imperative: (singular: ['գտի'], plural: ['գտեք']),
        present: regularVerbs.present,
      ),
      'գրել': (
        imperative: (singular: ['գրու'], plural: ['գտեք']),
        present: regularVerbs.present,
      ),
      'ունենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['ունեմ'], second: ['ունես'], third: ['ունի']),
          plural: (first: ['ունենք'], second: ['ունեք'], third: ['ունեն']),
        ),
      ),
      'գիտենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['գիտեմ'], second: ['գիտես'], third: ['գիտի']),
          plural: (first: ['գիտենք'], second: ['գիտեք'], third: ['գիտեն']),
        ),
      ),
      'արժել': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['արժեմ'], second: ['արժես'], third: ['արժի']),
          plural: (first: ['արժենք'], second: ['արժեք'], third: ['արժեն']),
        ),
      ),
      'ուզենալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['ուզում']),
      ),
      'կարողանալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['կարող', 'կարողանում']),
      ),
    };
  }
}
