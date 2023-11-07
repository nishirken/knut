import 'package:namer_app/models/verb/verb.dart';
import 'package:test/test.dart';

void main() {
  const regularVerbAl = 'կարդալ';
  const regularVerbEl = 'վազել';

  group('Regular', () {
    test('isRegular', () {
      expect(Verb.create(regularVerbAl).imperativeMood is RegularImperativeMood,
          true);
      expect(Verb.create(regularVerbEl).present is RegularInflectedTense, true);
      expect(Verb.create(regularVerbEl).presentPerfect is RegularInflectedTense,
          true);
      expect(Verb.create(regularVerbEl).pastPerfect is RegularInflectedTense,
          true);
      expect(Verb.create(regularVerbEl).futureSimple is RegularInflectedTense,
          true);
      expect(
          Verb.create(regularVerbEl).futureSimpleNegative
              is RegularInflectedTense,
          true);
      expect(Verb.create(regularVerbEl).goingTo is RegularInflectedTense, true);
      expect(Verb.create(regularVerbEl).pastContinious is RegularInflectedTense,
          true);
    });

    group('Imperative mood', () {
      test('ալ', () {
        expect(Verb.create(regularVerbAl).imperativeMood.singular, ['կարդա']);
        expect(Verb.create(regularVerbAl).imperativeMood.plural, ['կարդացեք']);
      });

      test('ել', () {
        expect(Verb.create(regularVerbEl).imperativeMood.singular,
            ['վազիր', 'վազի']);
        expect(Verb.create(regularVerbEl).imperativeMood.plural,
            ['վազեք', 'վազեցեք']);
      });

      test('նել', () {
        expect(Verb.create('թռչել').imperativeMood.singular, ['թռիր']);
        expect(Verb.create('մտնել').imperativeMood.plural, ['մտեք']);
      });

      test('անալ', () {
        expect(Verb.create('հասկանալ').imperativeMood.singular, ['հասկացիր']);
        expect(Verb.create('մոտենալ').imperativeMood.plural, ['մոտեցեք']);
      });

      test('ցնել', () {
        expect(Verb.create('հարցնել').imperativeMood.singular, ['հարցրու']);
        expect(Verb.create('բարձրացնել').imperativeMood.plural, ['բարձրացրեք']);
      });
    });

    test('Present', () {
      expect(Verb.create(regularVerbAl).present.singular.third, ['կարդում է']);
    });

    group('Present perfect', () {
      test('Regular', () {
        expect(Verb.create(regularVerbEl).presentPerfect.singular.first,
            ['վազել եմ']);
        expect(Verb.create(regularVerbAl).presentPerfect.singular.first,
            ['կարդացել եմ']);
      });

      test('նել չել', () {
        expect(Verb.create('մտնել').presentPerfect.singular.first, ['մտել եմ']);
        expect(
            Verb.create('փախչել').presentPerfect.singular.first, ['փախել եմ']);
      });

      test('Causative', () {
        expect(Verb.create('ուրախացնել').presentPerfect.singular.first,
            ['ուրախացրել եմ']);
        expect(Verb.create('հարցնել').presentPerfect.singular.first,
            ['հարցրել եմ']);
      });

      test('անալ ենալ', () {
        expect(Verb.create('ունենալ').presentPerfect.singular.first,
            ['ունեցել եմ']);
        expect(Verb.create('ուրախանալ').presentPerfect.singular.first,
            ['ուրախացել եմ']);
      });
    });

    test('Past continious', () {
      expect(Verb.create(regularVerbEl).pastContinious.singular.first,
          ['վազում էի']);
      expect(Verb.create(regularVerbAl).pastContinious.singular.third,
          ['կարդում էր']);
    });

    group('Past simple', () {
      test('Regular', () {
        expect(
            Verb.create(regularVerbEl).pastSimple.singular.first, ['վազեցի']);
        expect(
            Verb.create(regularVerbAl).pastSimple.plural.second, ['կարդացիք']);
      });

      test('նել չել', () {
        expect(Verb.create('մտնել').pastSimple.singular.first, ['մտա']);
        expect(Verb.create('փախչել').pastSimple.plural.second, ['փախաք']);
      });

      test('Causative', () {
        expect(Verb.create('ուրախացնել').pastSimple.singular.second,
            ['ուրախացրեցիր', 'ուրախացրիր']);
        expect(Verb.create('հարցնել').pastSimple.singular.first,
            ['հարցրեցի', 'հարցրի']);
      });

      test('անալ ենալ', () {
        expect(Verb.create('մոտենալ').pastSimple.singular.first, ['մոտեցա']);
        expect(Verb.create('ուզենալ').pastSimple.singular.third, ['ուզեցավ']);
      });
    });

    test('Past perfect', () {
      expect(
          Verb.create(regularVerbEl).pastPerfect.singular.first, ['վազել էի']);
      expect(Verb.create('կարդալ').pastPerfect.singular.first, ['կարդացել էի']);
      expect(Verb.create('մոռանալ').pastPerfect.singular.third, ['մոռացել էր']);
    });

    test('Future simple', () {
      expect(
          Verb.create(regularVerbEl).futureSimple.singular.first, ['կվազեմ']);
      expect(
          Verb.create(regularVerbAl).futureSimple.singular.third, ['կկարդա']);
    });

    test('Future simple negative', () {
      expect(Verb.create(regularVerbEl).futureSimpleNegative.plural.second,
          ['չեք վազի']);
      expect(Verb.create(regularVerbAl).futureSimpleNegative.plural.second,
          ['չեք կարդա']);
    });

    test('Going to', () {
      expect(Verb.create(regularVerbEl).goingTo.singular.first, ['վազելու եմ']);
      expect(Verb.create(regularVerbAl).goingTo.singular.third, ['կարդալու է']);
    });

    test('Effective participle', () {
      expect(Verb.create(regularVerbEl).effectiveParticiple, 'վազած');
      expect(Verb.create(regularVerbAl).effectiveParticiple, 'կարդացած');
      expect(Verb.create('մոտեցնել').effectiveParticiple, 'մոտեցրած');
      expect(Verb.create('զարմացնել').effectiveParticiple, 'զարմացրած');
      expect(Verb.create('կուտակվել').effectiveParticiple, 'կուտակված');
      expect(Verb.create('դրվել').effectiveParticiple, 'դրված');
    });

    test('Subjective participle', () {
      expect(Verb.create(regularVerbEl).subjectiveParticiple, 'վազող');
      expect(Verb.create(regularVerbAl).subjectiveParticiple, 'կարդացող');
      expect(Verb.create('հասկանալ').subjectiveParticiple, 'հասկացող');
      expect(Verb.create('պահվել').subjectiveParticiple, 'պահվող');
    });

    test('Present participle', () {
      expect(Verb.create('կարդալ').presentParticiple, 'կարդալիս');
      expect(Verb.create('պատրաստել').presentParticiple, 'պատրաստելիս');
    });
  });

  group('Irregular', () {
    test('Imperative mood', () {
      expect(Verb.create('անել').imperativeMood.singular, ['արա']);
      expect(Verb.create('անել').imperativeMood.plural, ['արեք']);
      expect(Verb.create('գալ').imperativeMood.singular, ['արի']);
      expect(Verb.create('գալ').imperativeMood.plural, ['եկեք']);
      expect(
          Verb.create('ասել').imperativeMood is IrregularImperativeMood, true);
    });

    test('Present', () {
      expect(Verb.create('գալ').present.singular.first, ['գալիս եմ']);
      expect(Verb.create('կարողանալ').present.plural.third,
          ['կարող են', 'կարողանում են']);
      expect(Verb.create('գալ').present is IrregularInflectedTense, true);
    });

    test('Past simple', () {
      expect(Verb.create('գալ').pastSimple.singular.first, ['եկա']);
      expect(Verb.create('վերադարձնել').pastSimple.singular.first,
          ['վերադարձրեցի', 'վերադարձրի']);
      expect(Verb.create('կարողանալ').pastSimple.plural.third, ['կարողացան']);
      expect(Verb.create('գալ').pastSimple is IrregularInflectedTense, true);
    });

    test('Present perfect', () {
      expect(Verb.create('լինել').presentPerfect.singular.first, ['եղել եմ']);
      expect(Verb.create('գալ').presentPerfect.plural.first, ['եկել ենք']);
      expect(Verb.create('տալ').presentPerfect.singular.first, ['տվել եմ']);
      expect(
          Verb.create('գալ').presentPerfect is IrregularInflectedTense, true);
    });

    test('Past perfect', () {
      expect(Verb.create('գալ').pastPerfect.singular.first, ['եկել էի']);
      expect(Verb.create('գալ').pastPerfect is IrregularInflectedTense, true);
    });

    test('Subjective participle', () {
      expect(Verb.create('ասել').subjectiveParticiple, 'ասող');
    });
  });
}
