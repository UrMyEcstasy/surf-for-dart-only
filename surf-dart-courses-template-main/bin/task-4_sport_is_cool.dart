class Team {
  final String name;
  final List<Person> members;

  Team(
    this.name,
    this.members,
  );
}

abstract class Person {
  final String name;
  final String surname;
  final int height;
  final int weight;
  final Team team;

  Person({
    required this.name,
    required this.surname,
    required this.height,
    required this.weight,
    required this.team,
  });

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname}';
  }

  void whoIAm() {
    print('Hello, my name is $name $surname');
  }
}

class Boxer extends Person {
  int wins;
  int losses;
  int draws;

  Boxer({
    required this.wins,
    required this.draws,
    required this.losses,
    required String name,
    required String surname,
    required int height,
    required int weight,
    required Team team,
  }) : super(
          name: name,
          surname: surname,
          height: height,
          weight: weight,
          team: team,
        );

  @override
  void whoIAm() {
    super.whoIAm();
    print('my record is $wins - $losses - $draws');
    print("my gym is ${team.name}");
    print('I am the greatest boxer in the world\n');
  }
}

class Grappler extends Person {
  int wins;
  int losses;
  int draws;
  final String style;

  Grappler({
    required this.wins,
    required this.draws,
    required this.losses,
    required this.style,
    required String name,
    required String surname,
    required int height,
    required int weight,
    required Team team,
  }) : super(
          name: name,
          surname: surname,
          height: height,
          weight: weight,
          team: team,
        );

  @override
  void whoIAm() {
    super.whoIAm();
    print('my style is $style');
    print("my gym is ${team.name}");
    print('I am the best grappler\n');
  }
}

void main() {
  var teams = [
    Team(
      'Tiger muai thai',
      [
        Boxer(
          name: "Andrey",
          surname: "Balboa",
          weight: 90,
          height: 190,
          wins: 10,
          losses: 3,
          draws: 1,
          team: Team('Tiger muai thai', []),
        ),
        Grappler(
          name: 'Demian',
          surname: 'Maya',
          height: 185,
          weight: 80,
          wins: 28,
          draws: 11,
          losses: 0,
          style: "jiu - jujitsu",
          team: Team('Tiger muai thai', []),
        ),
      ],
    ),
    Team(
      'City King Boxing',
      [
        Boxer(
            name: "Israel",
            surname: "Adesanya",
            weight: 83,
            height: 193,
            wins: 24,
            losses: 3,
            draws: 0,
            team: Team('City King Boxing', [])),
        Boxer(
            name: "Alexandr",
            surname: "Volkanovski",
            weight: 65,
            height: 167,
            wins: 26,
            losses: 4,
            draws: 0,
            team: Team('City King Boxing', [])),
      ],
    ),
  ];
  for (var team in teams) {
    print('-' * 40);
    print('Members of ${team.name}:\n');
    for (var member in team.members) {
      member.whoIAm();
    }
  }
}
