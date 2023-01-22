/*
- 자식 클래스는 super를 통해서 부모 클래스에 접근할 수 있음
- 자식 클래스는 부모 클래스를 상속하는 순간 부모 클래스의 인스턴스가 되는 거임
- mixin의 역할은 단순히 다른 클래스의 프로퍼티나 메서드들을 가져오는 것 뿐
*/

// Enums, 미리 값을 정해놓아서 오류가 발생할 가능성을 낮춰줌
// ex) flutter에서 enum으로 색상 지정해놓기
enum Type { fire, water, grass }

enum Get { yes, no }

// 추상 클래스, 다른 클래스들이 직접 구현해야 하는 메서드들을 모아놓은 일종의 청사진 같은 개념임
// 상속 받는 클래스가 가지고 있어야 하는 메서드들을 정의하고 있음
// 따라서 추상 클래스 자체로부터는 인스턴스 생성 불가
abstract class Action {
  // 메서드를 선언은 하되 완성은 시키지 않는다.
  // 다만, 시그니처는 만들어 둔다.
  void fight(Type type) {}
}

// 특정 추상 클래스를 상속할 경우, 상속받는 클래스가 해당 추상 클래스의 메서드를 무조건 구현해야 함
class Pokemon_1 extends Action {
  String name;
  int power;
  Type type;
  bool shiny;

  Pokemon_1({
    required this.name,
    required this.power,
    required this.type,
    required this.shiny,
  });

  void fight(Type type) {
    if (type == Type.fire) {
      print('불꽃 세례');
    } else {
      print('물대포');
    }
  }

  String getPokemon_1Info() =>
      '이름: $name | 종족값: $power | 타입: $type | 이로치: $shiny';

  void printPokemon_1Info() {
    print('이름: $name | 종족값: $power | 타입: $type | 이로치: $shiny');
  }
}

class Pokedex extends Pokemon_1 {
  Get get;

  // 특정 클래스를 상속할 경우, 부모 클래스의 생성자(super())도 호출해서 프로퍼티를 초기화 시켜줘여 함
  Pokedex({
    required this.get,
    required String name,
    required int power,
    required Type type,
    required bool shiny,
  }) : super(name: name, type: type, power: power, shiny: shiny);

  // 부모 클래스의 메서드를 내가 재정의 해서 사용하고 싶다면 @override
  // 메서드 이름이 같아야 덮어쓰기 가능함
  @override
  void printPokemon_1Info() {
    // 부모 클래스의 메서드에 정의된 코드 그대로 실행한 다음
    super.printPokemon_1Info();

    // 덧붙이기
    print('잡은 포켓몬인가요 => $get');
  }
}

// 생성자가 없는 클래스는 mixin 클래스라고 함
// 클래스에 프로퍼티나 메서드를 추가할 때 사용
class Skill_1 {
  String fire = '불꽃세례';
  String water = '물대포';
  String grass = '잎날가르기';
}

class Skill_2 {
  void print_fire() {
    print('불꽃세례');
  }

  void print_water() {
    print('물대포');
  }

  void peint_grass() {
    print('잎날가르기');
  }
}

// with 키워드는 단지 다른 클래스의 프로퍼티와 메서드를 긁어오는 것 뿐임. 상속 x
// mixin 클래스의 핵심은 여러 클래스에 재사용 할만한 프로퍼티 또는 메서드를 정의해두는 것
class Pokemon_2 with Skill_1, Skill_2 {
  String name;
  int power;
  Type type;
  bool shiny;

  Pokemon_2({
    required this.name,
    required this.power,
    required this.type,
    required this.shiny,
  });

  String getPokemon_2Info() =>
      '이름: $name | 종족값: $power | 타입: $type | 이로치: $shiny';
}

void main() {
  // 인스턴스의 프로퍼티를 변경하는 코드를 간략하게 작성하고 싶다면 cascade operator
  var newPokemon_1 =
      Pokemon_1(name: '리자몽', power: 534, type: Type.fire, shiny: true)
        ..name = '거북왕'
        ..power = 530
        ..type = Type.water
        ..shiny = false
        ..getPokemon_1Info();

  /* 이거랑 같음 ㅋ, 앞에 있는 '.'은 바로 직전에 생성한 인스턴스를 가리킴
  newPokemon_1.name = '거북왕';
  newPokemon_1.power = 530;
  newPokemon_1.type = '물';
  newPokemon_1.shiny = false;
  newPokemon_1.getPokemon_1Info();
  */

  print(newPokemon_1.getPokemon_1Info());

  newPokemon_1.fight(Type.fire);

  var pokedex = Pokedex(
    get: Get.yes,
    name: '이상해꽃',
    power: 530,
    type: Type.grass,
    shiny: false,
  );

  print(
      '${pokedex.name}, ${pokedex.type == Type.grass ? '풀' : '헉'}, ${pokedex.get}');

  pokedex.printPokemon_1Info();

  var newPokemon_2 =
      Pokemon_2(name: '파이리', power: 250, type: Type.fire, shiny: true);

  print(newPokemon_2.fire);

  newPokemon_2.print_fire();
}
