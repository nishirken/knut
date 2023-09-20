import 'package:namer_app/data/regular_verbs.dart';
import 'package:namer_app/data/verb.dart';

typedef Irregular = Map<
    String,
    ({
      ImperativeMood imperative,
      InflectedVerb present,
      InflectedVerb pastContinious,
    })>;

class IrregularVerbsCollection {
  final String infinitive;
  final String stamp;

  IrregularVerbsCollection({
    required this.infinitive,
    required this.stamp,
  });

  static InflectedVerb pastContinious(String base) {
    return (
      singular: (first: ['$baseեի'], second: ['$baseեիր'], third: ['$baseեր']),
      plural: (first: ['$baseեինք'], second: ['$baseեիք'], third: ['$baseեին']),
    );
  }

  static InflectedVerb present(String base) {
    return (
      singular: (first: ['$baseեմ'], second: ['$baseես'], third: ['$baseի']),
      plural: (first: ['$baseենք'], second: ['$baseեք'], third: ['$baseեն']),
    );
  }

  Irregular get collection {
    final regularVerbs =
        RegularVerbsCollection(infinitive: infinitive, stamp: stamp);

    return {
      'ասել': (
        imperative: (singular: ['ասա'], plural: ['ասացեք', 'ասաեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'գալ': (
        imperative: (singular: ['արի'], plural: ['եկեք']),
        present: RegularVerbsCollection.mkPresent(['գալիս']),
        pastContinious: regularVerbs.pastContinious,
      ),
      'անել': (
        imperative: (singular: ['արա'], plural: ['արեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'առնել': (
        imperative: (singular: ['առ'], plural: ['առեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'բերել': (
        imperative: (singular: ['բեր'], plural: ['բերեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'դնել': (
        imperative: (singular: ['դիր'], plural: ['դրեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'տալ': (
        imperative: (singular: ['տուր'], plural: ['տվեք']),
        present: RegularVerbsCollection.mkPresent(['տալիս']),
        pastContinious: regularVerbs.pastContinious,
      ),
      'տանալ': (
        imperative: (singular: ['տար'], plural: ['տարեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'տեսեք': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'ուտել': (
        imperative: (singular: ['կեր'], plural: ['կերեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'վեր կենալ': (
        imperative: (singular: ['վեր կաց'], plural: ['վեր կացեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'լվանալ': (
        imperative: (singular: ['լվա'], plural: ['լվացեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'լինել': (
        imperative: (singular: ['եղիր'], plural: ['եղեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'թողնել': (
        imperative: (singular: ['թող'], plural: ['թողեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'բացել': (
        imperative: (singular: ['բաց', 'բացիր'], plural: ['բացարեք', 'բացեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'դառնալ': (
        imperative: (
          singular: ['դարձիր', 'դառիր'],
          plural: ['դարձեք', 'դառեք']
        ),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'լալ': (
        imperative: (singular: ['լաց'], plural: ['լաց']),
        present: RegularVerbsCollection.mkPresent(['լալիս']),
        pastContinious: regularVerbs.pastContinious,
      ),
      'ընկնել': (
        imperative: (singular: ['ընկի'], plural: ['ընկեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'տեսնել': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'գտնել': (
        imperative: (singular: ['գտի'], plural: ['գտեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'գրել': (
        imperative: (singular: ['գրու'], plural: ['գտեք']),
        present: regularVerbs.present,
        pastContinious: regularVerbs.pastContinious,
      ),
      'ունենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['ունեմ'], second: ['ունես'], third: ['ունի']),
          plural: (first: ['ունենք'], second: ['ունեք'], third: ['ունեն']),
        ),
        pastContinious: IrregularVerbsCollection.pastContinious('ուն'),
      ),
      'գիտենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['գիտեմ'], second: ['գիտես'], third: ['գիտի']),
          plural: (first: ['գիտենք'], second: ['գիտեք'], third: ['գիտեն']),
        ),
        pastContinious: (
          singular: (first: ['գիտեյի'], second: ['գիտեյիր'], third: ['գիտեր']),
          plural: (
            first: ['գիտեյինք'],
            second: ['գիտեյիք'],
            third: ['գիտեյին'],
          ),
        ),
      ),
      'արժել': (
        imperative: regularVerbs.imperativeMood,
        present: IrregularVerbsCollection.present('արժ'),
        pastContinious: IrregularVerbsCollection.pastContinious('արժ'),
      ),
      'ուզենալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['ուզում']),
        pastContinious: regularVerbs.pastContinious,
      ),
      'կարողանալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['կարող', 'կարողանում']),
        pastContinious: regularVerbs.pastContinious,
      ),
    };
  }
}
