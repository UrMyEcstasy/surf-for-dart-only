import 'dart:math';

String chooseRandom(List<String> teams){

  var i = Random().nextInt(teams.length -1);

  return teams[i];
}

abstract class Person {
  final String name;
  final String surname;
  final int height;
  final int weight;

  Person(
      {required this.name,
        required this.surname,
        required this.height,
        required this.weight
      });

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname}';
  }

  void whoIAm(){
    print('Hello, my name is $name $surname');
  }
}


class Boxer extends Person{
  int wins;
  int losses;
  int draws;
  List<String> teams = ["Tiger muai thai", "City King Boxing", "Arena Don"];
  Boxer({required super.name, required super.surname, required super.height, required super.weight,
    required this.wins, required this.draws, required this.losses});
  @override
  void whoIAm(){
    super.whoIAm();
    print('my record is $wins - $losses - $draws');
    print("my gym is ${chooseRandom(teams)}");
    print('I am the greatest boxer in the world\n');
  }

}

class Grappler extends Person{

  int wins;
  int losses;
  int draws;
  final String style;

  List<String> teams = ['Jackson Wink', 'AKA', 'Kings MMA'];
  Grappler({required super.name, required super.surname, required super.height, required super.weight,
    required this.wins, required this.draws, required this.losses, required this.style});
  @override
  void whoIAm(){
    super.whoIAm();
    print('my style is $style');
    print("my gym is ${chooseRandom(teams)}");
    print('I am the best grappler\n');
  }

}
void main() {

  var boxer = Boxer(name: "Andrey", surname: "Balboa",
      weight: 90, height: 190, wins: 10, losses: 3, draws: 1);
  boxer.whoIAm();

  print('-' * 40);

  var grappler = Grappler(name: 'Demian', surname: 'Maya', height: 185,
      weight: 80, wins: 28, draws: 11, losses: 0, style: "jiu - jujitsu");
  grappler.whoIAm();
}
