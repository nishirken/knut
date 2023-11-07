import 'package:namer_app/models/verb/regular_verbs.dart';
import 'package:namer_app/models/verb/verb.dart';

typedef IrregularVerbTenses = ({
  ImperativeMoodCollection? imperativeMood,
  InflectedTenseCollection? present,
  InflectedTenseCollection? presentPerfect,
  InflectedTenseCollection? pastPerfect,
  InflectedTenseCollection? pastSimple,
  InflectedTenseCollection? pastContinious,
});

typedef Irregular = Map<String, IrregularVerbTenses>;

class IrregularVerbsCollection {
  final String infinitive;
  final String stamp;

  IrregularVerbsCollection({
    required this.infinitive,
    required this.stamp,
  });

  static InflectedTenseCollection pastContinious(String base) {
    return (
      singular: (first: ['$baseեի'], second: ['$baseեիր'], third: ['$baseեր']),
      plural: (first: ['$baseեինք'], second: ['$baseեիք'], third: ['$baseեին']),
    );
  }

  static InflectedTenseCollection present(String base) {
    return (
      singular: (first: ['$baseեմ'], second: ['$baseես'], third: ['$baseի']),
      plural: (first: ['$baseենք'], second: ['$baseեք'], third: ['$baseեն']),
    );
  }

  Irregular get collection {
    return {
      'ասել': (
        imperativeMood: (singular: ['ասա'], plural: ['ասացեք', 'ասեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
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
        pastContinious: null,
      ),
      'գալ': (
        imperativeMood: (singular: ['արի'], plural: ['եկեք']),
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
        pastContinious: null,
      ),
      'անել': (
        imperativeMood: (singular: ['արա'], plural: ['արեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
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
        pastContinious: null,
      ),
      'առնել': (
        imperativeMood: (singular: ['առ'], plural: ['առեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'բերել': (
        imperativeMood: (singular: ['բեր'], plural: ['բերեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'դնել': (
        imperativeMood: (singular: ['դիր'], plural: ['դրեք']),
        presentPerfect: RegularVerbsCollection.mkPresent(['դրել']),
        pastPerfect: RegularVerbsCollection.mkPast(['դրել']),
        present: null,
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
        pastContinious: null,
      ),
      'տալ': (
        imperativeMood: (singular: ['տուր'], plural: ['տվեք']),
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
        pastContinious: null,
      ),
      'տանել': (
        imperativeMood: (singular: ['տար'], plural: ['տարեք']),
        present: null,
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
        pastContinious: null,
      ),
      'տեսեք': (
        imperativeMood: (singular: ['տես'], plural: ['տեսեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'ուտել': (
        imperativeMood: (singular: ['կեր'], plural: ['կերեք']),
        present: null,
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
        pastContinious: null,
      ),
      'վեր կենալ': (
        imperativeMood: (singular: ['վեր կաց'], plural: ['վեր կացեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
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
        pastContinious: null,
      ),
      'լվանալ': (
        imperativeMood: (singular: ['լվա'], plural: ['լվացեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'լինել': (
        imperativeMood: (singular: ['եղիր'], plural: ['եղեք']),
        present: null,
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
        pastContinious: null,
      ),
      'թողնել': (
        imperativeMood: (singular: ['թող'], plural: ['թողեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
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
        pastContinious: null,
      ),
      'բացել': (
        imperativeMood: (
          singular: ['բաց', 'բացիր'],
          plural: ['բացարեք', 'բացեք']
        ),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'դառնալ': (
        imperativeMood: (
          singular: ['դարձիր', 'դառիր'],
          plural: ['դարձեք', 'դառեք']
        ),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'լալ': (
        imperativeMood: (singular: ['լաց'], plural: ['լաց']),
        present: RegularVerbsCollection.mkPresent(['լալիս']),
        pastPerfect: RegularVerbsCollection.mkPast(['լալիս']),
        presentPerfect: null,
        pastContinious: null,
        pastSimple: null,
      ),
      'ընկնել': (
        imperativeMood: (singular: ['ընկի'], plural: ['ընկեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'տեսնել': (
        imperativeMood: (singular: ['տես'], plural: ['տեսեք']),
        present: null,
        presentPerfect: RegularVerbsCollection.mkPresent(['տեսել']),
        pastPerfect: RegularVerbsCollection.mkPast(['տեսել']),
        pastSimple: null,
        pastContinious: null,
      ),
      'գտնել': (
        imperativeMood: (singular: ['գտի'], plural: ['գտեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'գրել': (
        imperativeMood: (singular: ['գրու'], plural: ['գտեք']),
        present: null,
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'ունենալ': (
        imperativeMood: null,
        present: (
          singular: (first: ['ունեմ'], second: ['ունես'], third: ['ունի']),
          plural: (first: ['ունենք'], second: ['ունեք'], third: ['ունեն']),
        ),
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: IrregularVerbsCollection.pastContinious('ուն'),
      ),
      'գիտենալ': (
        imperativeMood: null,
        present: (
          singular: (first: ['գիտեմ'], second: ['գիտես'], third: ['գիտի']),
          plural: (first: ['գիտենք'], second: ['գիտեք'], third: ['գիտեն']),
        ),
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
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
        imperativeMood: null,
        present: IrregularVerbsCollection.present('արժ'),
        pastPerfect: null,
        pastSimple: null,
        pastContinious: IrregularVerbsCollection.pastContinious('արժ'),
        presentPerfect: null,
      ),
      'ուզենալ': (
        imperativeMood: null,
        present: RegularVerbsCollection.mkPresent(['ուզում']),
        pastPerfect: null,
        presentPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'կարողանալ': (
        imperativeMood: null,
        present: RegularVerbsCollection.mkPresent(['կարող', 'կարողանում']),
        presentPerfect: null,
        pastPerfect: null,
        pastSimple: null,
        pastContinious: null,
      ),
      'վերադարձնել': (
        imperativeMood: null,
        present: null,
        presentPerfect: null,
        pastPerfect: null,
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
        pastContinious: null
      ),
      'վերադառնալ': (
        imperativeMood: null,
        present: null,
        presentPerfect: RegularVerbsCollection.mkPresent(['վերադարձել']),
        pastPerfect: RegularVerbsCollection.mkPast(['վերադարձել']),
        pastSimple: null,
        pastContinious: null,
      )
    };
  }
}
