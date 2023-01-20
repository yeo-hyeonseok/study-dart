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
}
