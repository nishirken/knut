import 'package:namer_app/data/verbs.dart';
import 'package:test/test.dart';

void main() {
  const regularVerbAl = 'կարդալ';
  const regularVerbEl = 'վազել';

  group('Regular', () {
    group('Imperative mood', () {
      test('ալ', () {
        expect(mkVerb(regularVerbAl).imperativeMood.singular, ['կարդա']);
        expect(mkVerb(regularVerbAl).imperativeMood.plural, ['կարդացեք']);
      });

      test('ել', () {
        expect(
            mkVerb(regularVerbEl).imperativeMood.singular, ['վազիր', 'վազի']);
        expect(
            mkVerb(regularVerbEl).imperativeMood.plural, ['վազեք', 'վազեցեք']);
      });

      test('նել', () {
        expect(mkVerb('թռչել').imperativeMood.singular, ['թռիր']);
        expect(mkVerb('մտնել').imperativeMood.plural, ['մտեք']);
      });

      test('անալ', () {
        expect(mkVerb('հասկանալ').imperativeMood.singular, ['հասկացիր']);
        expect(mkVerb('մոտենալ').imperativeMood.plural, ['մոտեցեք']);
      });

      test('ցնել', () {
        expect(mkVerb('հարցնել').imperativeMood.singular, ['հարցրու']);
        expect(mkVerb('բարձրացնել').imperativeMood.plural, ['բարձրացրեք']);
      });
    });

    test('Present', () {
      expect(mkVerb(regularVerbAl).present.singular.third, ['կարդում է']);
    });

    group('Present perfect', () {
      test('Regular', () {
        expect(
            mkVerb(regularVerbEl).presentPerfect.singular.first, ['վազել եմ']);
        expect(mkVerb(regularVerbAl).presentPerfect.singular.first,
            ['կարդացել եմ']);
      });

      test('նել չել', () {
        expect(mkVerb('մտնել').presentPerfect.singular.first, ['մտել եմ']);
        expect(mkVerb('փախչել').presentPerfect.singular.first, ['փախել եմ']);
      });

      test('Causative', () {
        expect(mkVerb('ուրախացնել').presentPerfect.singular.first,
            ['ուրախացրել եմ']);
        expect(mkVerb('հարցնել').presentPerfect.singular.first, ['հարցրել եմ']);
      });

      test('անալ ենալ', () {
        expect(mkVerb('ունենալ').presentPerfect.singular.first, ['ունեցել եմ']);
        expect(mkVerb('ուրախանալ').presentPerfect.singular.first,
            ['ուրախացել եմ']);
      });
    });

    test('Past continious', () {
      expect(
          mkVerb(regularVerbEl).pastContinious.singular.first, ['վազում էի']);
      expect(
          mkVerb(regularVerbAl).pastContinious.singular.third, ['կարդում էր']);
    });

    group('Past simple', () {
      test('Regular', () {
        expect(mkVerb(regularVerbEl).pastSimple.singular.first, ['վազեցի']);
        expect(mkVerb(regularVerbAl).pastSimple.plural.second, ['կարդացիք']);
      });

      test('նել չել', () {
        expect(mkVerb('մտնել').pastSimple.singular.first, ['մտա']);
        expect(mkVerb('փախչել').pastSimple.plural.second, ['փախաք']);
      });

      test('Causative', () {
        expect(mkVerb('ուրախացնել').pastSimple.singular.second,
            ['ուրախացրեցիր', 'ուրախացրիր']);
        expect(mkVerb('հարցնել').pastSimple.singular.first,
            ['հարցրեցի', 'հարցրի']);
      });

      test('անալ ենալ', () {
        expect(mkVerb('մոտենալ').pastSimple.singular.first, ['մոտեցա']);
        expect(mkVerb('ուզենալ').pastSimple.singular.third, ['ուզեցավ']);
      });
    });

    test('Past perfect', () {
      expect(mkVerb(regularVerbEl).pastPerfect.singular.first, ['վազել էի']);
      expect(mkVerb('կարդալ').pastPerfect.singular.first, ['կարդացել էի']);
      expect(mkVerb('մոռանալ').pastPerfect.singular.third, ['մոռացել էր']);
    });

    test('Future simple', () {
      expect(mkVerb(regularVerbEl).futureSimple.singular.first, ['կվազեմ']);
      expect(mkVerb(regularVerbAl).futureSimple.singular.third, ['կկարդա']);
    });

    test('Future simple negative', () {
      expect(mkVerb(regularVerbEl).futureSimpleNegative.plural.second,
          ['չեք վազի']);
      expect(mkVerb(regularVerbAl).futureSimpleNegative.plural.second,
          ['չեք կարդա']);
    });

    test('Going to', () {
      expect(mkVerb(regularVerbEl).goingTo.singular.first, ['վազելու եմ']);
      expect(mkVerb(regularVerbAl).goingTo.singular.third, ['կարդալու է']);
    });
  });

  group('Irregular', () {
    test('Imperative mood', () {
      expect(mkVerb('անել').imperativeMood.singular, ['արա']);
      expect(mkVerb('անել').imperativeMood.plural, ['արեք']);
      expect(mkVerb('գալ').imperativeMood.singular, ['արի']);
      expect(mkVerb('գալ').imperativeMood.plural, ['եկեք']);
    });

    test('Present', () {
      expect(mkVerb('գալ').present.singular.first, ['գալիս եմ']);
      expect(mkVerb('կարողանալ').present.plural.third,
          ['կարող են', 'կարողանում են']);
    });

    test('Past simple', () {
      expect(mkVerb('գալ').pastSimple.singular.first, ['եկա']);
      expect(mkVerb('վերադարձնել').pastSimple.singular.first,
          ['վերադարձրեցի', 'վերադարձրի']);
      expect(mkVerb('կարողանալ').pastSimple.plural.third, ['կարողացան']);
    });

    test('Present perfect', () {
      expect(mkVerb('լինել').presentPerfect.singular.first, ['եղել եմ']);
      expect(mkVerb('գալ').presentPerfect.plural.first, ['եկել ենք']);
      expect(mkVerb('տալ').presentPerfect.singular.first, ['տվել եմ']);
    });

    test('Past perfect', () {
      expect(mkVerb('գալ').pastPerfect.singular.first, ['եկել էի']);
    });
  });
}
