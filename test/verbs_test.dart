import 'package:namer_app/data/verbs.dart';
import 'package:test/test.dart';

void main() {
  const regularVerbAl = 'կարդալ';
  const regularVerbEl = 'վազել';

  group('Regular', () {
    group('Imperative mood', () {
      test('ալ', () {
        expect(getVerb(regularVerbAl).imperativeMood.singular, ['կարդա']);
        expect(getVerb(regularVerbAl).imperativeMood.plural, ['կարդացեք']);
      });

      test('ել', () {
        expect(
            getVerb(regularVerbEl).imperativeMood.singular, ['վազիր', 'վազի']);
        expect(
            getVerb(regularVerbEl).imperativeMood.plural, ['վազեք', 'վազեցեք']);
      });

      test('նել', () {
        expect(getVerb('թռչել').imperativeMood.singular, ['թռիր']);
        expect(getVerb('մտնել').imperativeMood.plural, ['մտեք']);
      });

      test('անալ', () {
        expect(getVerb('հասկանալ').imperativeMood.singular, ['հասկացիր']);
        expect(getVerb('մոտենալ').imperativeMood.plural, ['մոտեցեք']);
      });

      test('ցնել', () {
        expect(getVerb('հարցնել').imperativeMood.singular, ['հարցրու']);
        expect(getVerb('բարձրացնել').imperativeMood.plural, ['բարձրացրեք']);
      });
    });

    test('Present', () {
      expect(getVerb(regularVerbAl).present.singular.third, ['կարդում է']);
    });
  });

  group('Irregular', () {
    test('Imperative mood', () {
      expect(getVerb('անել').imperativeMood.singular, ['արա']);
      expect(getVerb('անել').imperativeMood.plural, ['արեք']);
      expect(getVerb('գալ').imperativeMood.singular, ['արի']);
      expect(getVerb('գալ').imperativeMood.plural, ['եկեք']);
    });

    test('Present', () {
      expect(getVerb('գալ').present.singular.first, ['գալիս եմ']);
      expect(getVerb('կարողանալ').present.plural.third,
          ['կարող են', 'կարողանում են']);
    });
  });
}
