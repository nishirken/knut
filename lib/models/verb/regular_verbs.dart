import 'package:namer_app/models/verb/verb.dart';

class RegularVerbsCollection {
  final String infinitive;
  final String stamp;

  static InflectedVerb mkPresent(List<String> baseVerbs) {
    List<String> f(String face) {
      return baseVerbs.map((v) => '$v $face').toList();
    }

    return (
      singular: (
        first: f('եմ'),
        second: f('ես'),
        third: f('է'),
      ),
      plural: (
        first: f('ենք'),
        second: f('եք'),
        third: f('են'),
      ),
    );
  }

  static InflectedVerb mkPast(List<String> baseVerbs) {
    List<String> f(String face) {
      return baseVerbs.map((v) => '$v $face').toList();
    }

    return (
      singular: (
        first: f('էի'),
        second: f('էիր'),
        third: f('էր'),
      ),
      plural: (
        first: f('էինք'),
        second: f('էիք'),
        third: f('էին'),
      ),
    );
  }

  RegularVerbsCollection({
    required this.infinitive,
    required this.stamp,
  });

  static String _dropLast(String verb, {int n = 1}) {
    return verb.substring(0, n <= verb.length ? verb.length - n : 0);
  }

  String get _dropLastStamp {
    return _dropLast(stamp);
  }

  bool get hasElEnding {
    return infinitive.endsWith('ել');
  }

  bool get hasAlEnding {
    return infinitive.endsWith('ալ');
  }

  bool get regularAl {
    return hasAlEnding && !hasAnalSuffix;
  }

  bool get regularEl {
    return hasElEnding && !hasNelSuffix && !isCausative;
  }

  bool get hasAnSuffix {
    return infinitive.endsWith('անալ');
  }

  bool get hasEnSuffix {
    return infinitive.endsWith('ենալ');
  }

  bool get hasAnalSuffix {
    return hasAnSuffix || hasEnSuffix;
  }

  bool get hasNelSuffix {
    return infinitive.endsWith('նել') || infinitive.endsWith('չել');
  }

  bool get isCausative {
    return infinitive.endsWith('ցնել');
  }

  EndingsSets<ImperativeMood> _imperativeMoodCollection(String base) {
    return (
      al: (singular: ['$baseա'], plural: ['$baseացեք']),
      el: (singular: ['$baseիր', '$baseի'], plural: ['$baseեք', '$baseեցեք']),
    );
  }

  ImperativeMood get imperativeMood {
    if (hasAnalSuffix) {
      return (singular: ['$_dropLastStampցիր'], plural: ['$_dropLastStampցեք']);
    } else if (isCausative) {
      return (singular: ['$_dropLastStampրու'], plural: ['$_dropLastStampրեք']);
    } else if (hasNelSuffix) {
      return (singular: ['$_dropLastStampիր'], plural: ['$_dropLastStampեք']);
    } else if (regularAl) {
      return _imperativeMoodCollection(stamp).al;
    } else {
      return _imperativeMoodCollection(stamp).el;
    }
  }

  InflectedVerb get present {
    return RegularVerbsCollection.mkPresent(['$stampում']);
  }

  InflectedVerb get pastContinious {
    return RegularVerbsCollection.mkPast(['$stampում']);
  }

  InflectedVerb get pastSimple {
    List<String> f(String regular, String nel, String causativeShort) {
      if (isCausative) {
        return [
          '$_dropLastStampրե$regular',
          '${_dropLast(stamp, n: 2)}$causativeShort'
        ];
      } else if (hasNelSuffix) {
        return ['$_dropLastStamp$nel'];
      } else if (hasAnalSuffix) {
        return ['$_dropLastStampց$nel'];
      }
      return ['${_dropLast(infinitive)}$regular'];
    }

    return (
      singular: (
        first: f('ցի', 'ա', 'ցրի'),
        second: f('ցիր', 'ար', 'ցրիր'),
        third: f('ց', 'ավ', 'ցրեց'),
      ),
      plural: (
        first: f('ցինք', 'անք', 'ցրինք'),
        second: f('ցիք', 'աք', 'ցրիք'),
        third: f('ցին', 'ան', 'ցրին'),
      ),
    );
  }

  List<String> get _perfectBase {
    if (isCausative) {
      return ['$_dropLastStampրել'];
    } else if (hasNelSuffix) {
      return ['$_dropLastStampել'];
    } else if (hasAnalSuffix) {
      return ['$_dropLastStampցել'];
    } else if (regularAl) {
      return ['${_dropLast(infinitive)}ցել'];
    } else {
      return [infinitive];
    }
  }

  InflectedVerb get presentPerfect {
    return mkPresent(_perfectBase);
  }

  InflectedVerb get pastPerfect {
    return mkPast(_perfectBase);
  }

  InflectedVerb get futureSimple {
    List<String> f(String endingEl, String endingAl) {
      return ['կ$stamp${regularAl ? endingAl : endingEl}'];
    }

    return (
      singular: (
        first: f('եմ', 'ամ'),
        second: f('ես', 'աս'),
        third: f('ի', 'ա'),
      ),
      plural: (
        first: f('ենք', 'անք'),
        second: f('եք', 'աք'),
        third: f('են', 'ան'),
      ),
    );
  }

  InflectedVerb get futureSimpleNegative {
    List<String> f(String face) {
      return ['չ$face $stamp${regularAl ? 'ա' : 'ի'}'];
    }

    return (
      singular: (
        first: f('եմ'),
        second: f('ես'),
        third: f('ի'),
      ),
      plural: (
        first: f('ենք'),
        second: f('եք'),
        third: f('են'),
      ),
    );
  }

  InflectedVerb get goingTo {
    return mkPresent(['$infinitiveու']);
  }

  String get effectiveParticiple {
    if (isCausative) {
      return '$_dropLastStampրած';
    } else if (regularEl) {
      return '$stampած';
    } else {
      return '${pastSimple.singular.third[0]}ած';
    }
  }

  String get subjectiveParticiple {
    if (hasElEnding) {
      return '$stampող';
    } else if (hasAnalSuffix) {
      return '$_dropLastStampցող';
    } else {
      return '${pastSimple.singular.third[0]}ող';
    }
  }

  String get presentParticiple {
    return '$infinitiveիս';
  }
}
