import "dart:math";

/// Generates answers to the question "Is it the weekend?"
class AnswerGenerator {

  /// Maps days of the week to their DateTime representations.
  static const monday = 1;
  static const tuesday = 2;
  static const wednesday = 3;
  static const thursday = 4;
  static const friday = 5;
  static const saturday = 6;
  static const sunday = 7;

  static const _no = [
    'No.',
    'Nope.',
    'Nah.',
    'Negative.',
    'No way, José.',
    'Regrettably, no.',
  ];

  static const _almost = [
    'Almost...',
    'So close...',
    'Can\'t wait...',
    'Soon...',
  ];

  static const _yes = [
    'Yes!',
    'Yeah!',
    'Hooray!',
    'Yippee!',
    'Affirmative!',
    'Indeed, it is!',
  ];

  /// Returns an answer to "Is it the weekend?" based on the given weekday.
  static String getAnswer(int weekday) {
    if (weekday <= wednesday) {
      return _getRandom(_no);
    } else if (weekday <= friday) {
      return _getRandom(_almost);
    } else {
      return _getRandom(_yes);
    }
  }

  /// Returns a random element from a given list of strings.
  static String _getRandom(var answers) {
    final _random = new Random();
    return answers[_random.nextInt(answers.length)];
  }
}