import 'dart:math';

import 'package:flutter/cupertino.dart';

class QuestionProvider with ChangeNotifier {
  final rnd = Random();
  final List<List> _questions = [
    [
      'The construction of the Eiffel tower was completed on March 31, 1887',
      false,
      'It was completed on March 31, 1889'
    ],
    [
      "Lightning is seen before it's heard because light travels faster than sound.",
      true
    ],
    ['Vatican City is a country.', true],
    [
      'Penicillin was discovered in Vietnam to treat malaria.',
      false,
      "Alexander Fleming discovered penicillin at St. Mary's Hospital, London, UK in 1928."
    ],
    ['Melbourne is the capital of Australia.', false, 'It is Canberra.'],
    ['Mount Fuji is the highest mountain in Japan.', true],
    [
      'Broccoli contains more vitamin C than lemons.',
      true,
      'Broccoli contains 89 mg of vitamin C per 100 grams, while lemons contain only 77 mg of vitamin C per 100 grams.'
    ],
    [
      'The skull is the strongest bone in the human body.',
      false,
      'It is the femur or the thighbone.'
    ],
    [
      'Light bulbs were the invention of Thomas Edison.',
      false,
      'He only developed the first practical one.'
    ],
    ['Google was initially called BackRub.', true],
    ['The black box in a plane is black.', false, 'It is actually orange.'],
    ['Tomatoes are fruit.', true],
    [
      "Mercury's atmosphere is made up of Carbon Dioxide.",
      false,
      'It has no atmosphere at all.'
    ],
    ['Depression is the leading cause of disability worldwide.', true],
    ['Cleopatra was of Egyptian descent.', false, 'She was actually Greek.'],
    [
      'You can sneeze while asleep.',
      false,
      "When you're in REM sleep, the nerves that help you sneeze are at rest too."
    ],
    ["It's impossible to sneeze while you open your eyes.", true],
    ['Bananas are berries.', true],
    [
      'If you add the two numbers on the opposite sides of the dice together, the answer is always 7.',
      true
    ],
    [
      "Scallops can't see.",
      false,
      'Scallops have 200 eyes that function like a telescope.'
    ],
    ['A snail can sleep up to 1 month.', false, "It's actually three years"],
    ['Your nose produces almost one litre of mucus a day.', true],
    [
      "Mucus is healthy for your body.",
      true,
      "That’s why when you’re sick, your mucus increases nearly double."
    ],
    [
      'Coca Cola exists in every country around the world.',
      false,
      "Cuba and North Korea don’t have Coke."
    ],
    [
      "Spider silk was once used to make guitar strings.",
      false,
      "Spider silk was used to make violin strings."
    ],
    [
      "A coconut is a nut.",
      false,
      "It’s actually a one-seeded drupe like peaches."
    ],
    [
      "A chicken can live without a head long after it’s chopped off.",
      true,
      "Humans share 95 percent of their DNA with bananas."
    ],
    ['Giraffes say “moo”.', true],
    ['In Arizona, USA, you can get sentenced for cutting down a cactus', true],
    ['In Ohio, USA, it is illegal to get a fish drunk.', false],
    [
      'In Tuszyn Poland, Winnie the Pooh is banned from children’s playgrounds.',
      true,
      'The authority is concerned about him not wearing pants and having non-gender-specific genitalia.'
    ],
    [
      'In California, USA, you cannot wear cowboy boots unless you own at least two cows.',
      true
    ],
    [
      'All mammals live on land.',
      false,
      'Dolphins are mammals but they live under the sea.'
    ],
    [
      'It takes nine months for an elephant to be born.',
      false,
      'Elephant babies are born after 22 months.'
    ],
    ['Coffee is made from berries.', true],
    [
      'Pigs are dumb.',
      false,
      'Pigs are considered the fifth most intelligent animal in the world.'
    ],
    [
      'Being scared of clouds is called Coulrophobia.',
      false,
      "It’s the scare of clowns."
    ],
    [
      'Einstein failed his math class in university.',
      false,
      'He failed his first university exam.'
    ]
  ];
  int _selected = 0;
  List<dynamic> _displayedQuestions = [];

  int get selected => _selected;
  List<dynamic> get displayedQuestions => _displayedQuestions;

  List shuffleQuestions() {
    List<List<dynamic>> displayQuestions = _questions.toList()..shuffle();
    int start = rnd.nextInt(29);
    return displayQuestions.sublist(start, start + 10);
  }

  void getQuestions() {
    _displayedQuestions = shuffleQuestions();
    notifyListeners();
  }

  void nextQuestion() {
    _selected++;
    notifyListeners();
  }

  void resetQuestions() {
    _selected = 0;
  }
}
