import 'package:namer_app/data/regular_verbs.dart';
import 'package:namer_app/data/verb.dart';

typedef Irregular = Map<
    String,
    ({
      ImperativeMood imperative,
      InflectedVerb present,
      InflectedVerb presentPerfect,
      InflectedVerb pastPerfect,
      InflectedVerb pastSimple,
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
        imperative: (singular: ['ասա'], plural: ['ասացեք', 'ասեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: (
          singular: (
            first: ['ասացի'],
            second: ['ասացիր'],
            third: ['ասաց'],
          ),
          plural: (
            first: ['ասացինք'],
            second: ['ասացիք'],
            third: ['ասացին'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'գալ': (
        imperative: (singular: ['արի'], plural: ['եկեք']),
        present: RegularVerbsCollection.mkPresent(['գալիս']),
        presentPerfect: RegularVerbsCollection.mkPresent(['եկել']),
        pastPerfect: RegularVerbsCollection.mkPast(['եկել']),
        pastSimple: (
          singular: (
            first: ['եկա'],
            second: ['եկար'],
            third: ['եկավ'],
          ),
          plural: (
            first: ['եկանք'],
            second: ['եկաք'],
            third: ['եկան'],
          )
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'անել': (
        imperative: (singular: ['արա'], plural: ['արեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: (
          singular: (
            first: ['արեցի'],
            second: ['արեցիր'],
            third: ['արեց'],
          ),
          plural: (
            first: ['արեցինք'],
            second: ['արեցիք'],
            third: ['արեցին'],
          )
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'առնել': (
        imperative: (singular: ['առ'], plural: ['առեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'բերել': (
        imperative: (singular: ['բեր'], plural: ['բերեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'դնել': (
        imperative: (singular: ['դիր'], plural: ['դրեք']),
        presentPerfect: RegularVerbsCollection.mkPresent(['դրել']),
        pastPerfect: RegularVerbsCollection.mkPast(['դրել']),
        present: regularVerbs.present,
        pastSimple: (
          singular: (
            first: ['դրեցի'],
            second: ['դրեցիր'],
            third: ['դրեց'],
          ),
          plural: (
            first: ['դրեցինք'],
            second: ['դրեցիք'],
            third: ['դրեցին'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'տալ': (
        imperative: (singular: ['տուր'], plural: ['տվեք']),
        present: RegularVerbsCollection.mkPresent(['տալիս']),
        presentPerfect: RegularVerbsCollection.mkPresent(['տվել']),
        pastPerfect: RegularVerbsCollection.mkPast(['տվել']),
        pastSimple: (
          singular: (
            first: ['տվեցի'],
            second: ['տվեցիր'],
            third: ['տվեց'],
          ),
          plural: (
            first: ['տվեցինք'],
            second: ['տվեցիք'],
            third: ['տվեցին'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'տանել': (
        imperative: (singular: ['տար'], plural: ['տարեք']),
        present: regularVerbs.present,
        presentPerfect: RegularVerbsCollection.mkPresent(['տարել']),
        pastPerfect: RegularVerbsCollection.mkPast(['տարել']),
        pastSimple: (
          singular: (
            first: ['տարա'],
            second: ['տարար'],
            third: ['տարավ'],
          ),
          plural: (
            first: ['տարանք'],
            second: ['տարաք'],
            third: ['տարան'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'տեսեք': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'ուտել': (
        imperative: (singular: ['կեր'], plural: ['կերեք']),
        present: regularVerbs.present,
        presentPerfect: RegularVerbsCollection.mkPresent(['կերել']),
        pastPerfect: RegularVerbsCollection.mkPast(['կերել']),
        pastSimple: (
          singular: (
            first: ['կերա'],
            second: ['կերար'],
            third: ['կերավ'],
          ),
          plural: (
            first: ['կերանք'],
            second: ['կերաք'],
            third: ['կերան'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'վեր կենալ': (
        imperative: (singular: ['վեր կաց'], plural: ['վեր կացեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: (
          singular: (
            first: ['վեր կացա'],
            second: ['վեր կացար'],
            third: ['վեր կացավ'],
          ),
          plural: (
            first: ['վեր կացանք'],
            second: ['վեր կացաք'],
            third: ['վեր կացան'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'լվանալ': (
        imperative: (singular: ['լվա'], plural: ['լվացեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'լինել': (
        imperative: (singular: ['եղիր'], plural: ['եղեք']),
        present: regularVerbs.present,
        presentPerfect: RegularVerbsCollection.mkPresent(['եղել']),
        pastPerfect: RegularVerbsCollection.mkPast(['եղել']),
        pastSimple: (
          singular: (
            first: ['եղա'],
            second: ['եղար'],
            third: ['եղավ'],
          ),
          plural: (
            first: ['եղանք'],
            second: ['եղաք'],
            third: ['եղան'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'թողնել': (
        imperative: (singular: ['թող'], plural: ['թողեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: (
          singular: (
            first: ['թողեցի'],
            second: ['թողեցիր'],
            third: ['թողեց'],
          ),
          plural: (
            first: ['թողեցինք'],
            second: ['թողեցիք'],
            third: ['թողեցին'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious,
      ),
      'բացել': (
        imperative: (singular: ['բաց', 'բացիր'], plural: ['բացարեք', 'բացեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'դառնալ': (
        imperative: (
          singular: ['դարձիր', 'դառիր'],
          plural: ['դարձեք', 'դառեք']
        ),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'լալ': (
        imperative: (singular: ['լաց'], plural: ['լաց']),
        present: RegularVerbsCollection.mkPresent(['լալիս']),
        pastPerfect: RegularVerbsCollection.mkPast(['լալիս']),
        presentPerfect: regularVerbs.presentPerfect,
        pastContinious: regularVerbs.pastContinious,
        pastSimple: regularVerbs.pastSimple,
      ),
      'ընկնել': (
        imperative: (singular: ['ընկի'], plural: ['ընկեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'տեսնել': (
        imperative: (singular: ['տես'], plural: ['տեսեք']),
        present: regularVerbs.present,
        presentPerfect: RegularVerbsCollection.mkPresent(['տեսել']),
        pastPerfect: RegularVerbsCollection.mkPast(['տեսել']),
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'գտնել': (
        imperative: (singular: ['գտի'], plural: ['գտեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'գրել': (
        imperative: (singular: ['գրու'], plural: ['գտեք']),
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'ունենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['ունեմ'], second: ['ունես'], third: ['ունի']),
          plural: (first: ['ունենք'], second: ['ունեք'], third: ['ունեն']),
        ),
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: IrregularVerbsCollection.pastContinious('ուն'),
      ),
      'գիտենալ': (
        imperative: regularVerbs.imperativeMood,
        present: (
          singular: (first: ['գիտեմ'], second: ['գիտես'], third: ['գիտի']),
          plural: (first: ['գիտենք'], second: ['գիտեք'], third: ['գիտեն']),
        ),
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
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
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: IrregularVerbsCollection.pastContinious('արժ'),
        presentPerfect: regularVerbs.presentPerfect,
      ),
      'ուզենալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['ուզում']),
        pastPerfect: regularVerbs.pastPerfect,
        presentPerfect: regularVerbs.presentPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'կարողանալ': (
        imperative: regularVerbs.imperativeMood,
        present: RegularVerbsCollection.mkPresent(['կարող', 'կարողանում']),
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      ),
      'վերադարձնել': (
        imperative: regularVerbs.imperativeMood,
        present: regularVerbs.present,
        presentPerfect: regularVerbs.presentPerfect,
        pastPerfect: regularVerbs.pastPerfect,
        pastSimple: (
          singular: (
            first: ['վերադարձրեցի', 'վերադարձրի'],
            second: ['վերադարձրեցիր', 'վերադարձրիր'],
            third: ['վերադարձրեց', 'վերադարձրեց']
          ),
          plural: (
            first: ['վերադարձրեցինք', 'վերադարձրինք'],
            second: ['վերադարձրեցիք', 'վերադարձրիք'],
            third: ['վերադարձրեցին', 'վերադարձրին'],
          ),
        ),
        pastContinious: regularVerbs.pastContinious
      ),
      'վերադառնալ': (
        imperative: regularVerbs.imperativeMood,
        present: regularVerbs.present,
        presentPerfect: RegularVerbsCollection.mkPresent(['վերադարձել']),
        pastPerfect: RegularVerbsCollection.mkPast(['վերադարձել']),
        pastSimple: regularVerbs.pastSimple,
        pastContinious: regularVerbs.pastContinious,
      )
    };
  }
}
