class Character_1 {
  String name = '차무식';
  // 프로퍼티를 수정할 수 없게 만들고 싶다면 final
  final String nickname = 'CHA MOOSIK';
  int money = 700;

  // dart에서는 같은 클래스 내의 프로퍼티를 참조할 때 this 키워드를 쓸 필요 없음
  String sayHello() => '아 난... ${name}이라는 사람입니다.';

  // 하지만 아래의 경우와 같이 클래스의 전역 변수에 접근하고 싶을 때는 this 키워드를 사용하면 됨
  String sayHi() {
    var name = '차차무식';

    return '아 난... ${this.name}이라는 사람입니다. ';
  }
}

class Character_2 {
  late final String name;
  late int money;

  Character_2(String name, int money) {
    this.name = name;
    this.money = money;
  }

  String sayHello() => '아 난... ${name}이라는 사람입니다. 우린 10년 만에 $money억을 벌었어.';
}

// 생성자를 더 간략하게 작성하고 싶다면 이렇게 하면 됨 ㄷㄷ
class Character_3 {
  final String name;
  int money;

  Character_3(this.money, this.name);

  String sayHello() => '아 난... ${name}이라는 사람입니다. 우린 10년 만에 $money억을 벌었어.';
}

// 생성자도 named parameter를 할 수 있음.
class Character_4 {
  final String name;
  int money;

  Character_4({
    required this.money,
    required this.name,
  });

  String sayHello() => '아 난... ${name}이라는 사람입니다. 우린 10년 만에 $money억을 벌었어.';
}

class Player {
  final String name;
  int power;
  String team;

  Player({required this.name, required this.power, required this.team});

  // named 생성자, 콜론의 의미는 해당 프로퍼티들을 초기화 해주겠다는 말
  // final 키워드와 무관
  Player.createRedTeam({
    required String name,
    required int power,
  })  : this.name = name,
        this.power = power,
        this.team = 'RED';

  Player.createBlueTeam(
    String name,
    int power,
  )   : this.name = name,
        this.power = power,
        this.team = 'BLUE';

  String getPlayerInfo() => '이름: $name \n 전투력: $power \n 소속: $team';
}

class RealPlayer {
  final String name;
  int power;
  String team;

  RealPlayer.fromJson(Map<String, dynamic> item)
      : name = item['name'],
        power = item['power'],
        team = item['team'];

  String sayHello() => '$name, $power, $team';
}

void main() {
  // dart에서는 인스턴스 생성 시 꼭 new 키워드 붙일 필요 없음
  var actor_1 = Character_1();
  print(actor_1.name);

  actor_1.name = '최민식';
  print(actor_1.name);

  print(actor_1.sayHello());

  print(actor_1.sayHi());

  var actor_2 = Character_2('차무식', 700);
  print(actor_2.sayHello());

  var actor_3 = Character_3(700, '차무식');
  print(actor_3.sayHello());

  var actor_4 = Character_4(money: 700, name: '차무식');
  print(actor_4.sayHello());

  var player = Player(name: '차무식', power: 700, team: 'RED');

  var RedPlayer = Player.createRedTeam(name: '레드무식', power: 800);

  var Blue = Player.createBlueTeam('블루무식', 600);

  var apiData = [
    {
      "name": "차무식",
      "power": 700,
      "team": "RED",
    },
    {
      "name": "최익현",
      "power": 500,
      "team": "BLUE",
    },
    {
      "name": "최민식",
      "power": 600,
      "team": "YELLOW",
    }
  ];

  apiData.forEach((item) {
    var temp = RealPlayer.fromJson(item);
    print(temp.sayHello());
  });
}
