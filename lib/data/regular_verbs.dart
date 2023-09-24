import 'package:namer_app/data/verb.dart';

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

  String get _dropLast {
    return stamp.substring(0, stamp.length - 1);
  }

  bool get regularAl {
    return infinitive.endsWith('ալ') && !hasAnalSuffix;
  }

  bool get regularEl {
    return infinitive.endsWith('ել') && !hasNelSuffix && !hasCNSuffix;
  }

  bool get hasAnalSuffix {
    return infinitive.endsWith('անալ') || infinitive.endsWith('ենալ');
  }

  bool get hasNelSuffix {
    return infinitive.endsWith('նել') || infinitive.endsWith('չել');
  }

  bool get hasCNSuffix {
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
      return (singular: ['$_dropLastցիր'], plural: ['$_dropLastցեք']);
    } else if (hasCNSuffix) {
      return (singular: ['$_dropLastրու'], plural: ['$_dropLastրեք']);
    } else if (hasNelSuffix) {
      return (singular: ['$_dropLastիր'], plural: ['$_dropLastեք']);
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
    List<String> f(String face) {
      return ['$infinitiveու $face'];
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
}
