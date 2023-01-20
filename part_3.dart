/* dart의 함수 선언 방법 */
// 함수를 선언할 때 파라미터의 타입도 지정해줄 수 있음
void sayHello(String name) {
  print('아 난... $name이라는 사람입니다.');
}

String sayHi(String name) {
  return '아 난... $name이라는 사람입니다.';
}

String sayBonjour(String name) => '아 난... $name이라는 사람입니다.';

String greeting_1(String name, int money, String country) {
  return '아 난... $name이라는 사람입니다. 우린 10년 만에 $money억을 벌었어. 그리고 $country 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

// named parameter를 사용하려면 파라미터를 중괄호로 감싸줘야 함, 리스트 형태의 파라미터
// 전달받지 않은 파라미터가 있을 때 파라미터의 기본값을 설정할 수도 있음
String greeting_2(
    {String name = '기본이름', int money = 0000, String country = '기본나라'}) {
  return '아 난... $name이라는 사람입니다. 우린 10년 만에 $money억을 벌었어. 그리고 $country 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

// 파라미터가 선택사항이라면
String greeting_3({String? name, int? money, String? country}) {
  return '아 난... $name이라는 사람입니다. 우린 10년 만에 $money억을 벌었어. 그리고 $country 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

// named parameter를 사용할 때, 필수로 받아야 하는 파라미터가 있다면
String greeting_4(
    {required String name, required int money, required String country}) {
  return '아 난... $name이라는 사람입니다. 우린 10년 만에 $money억을 벌었어. 그리고 $country 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

// positional parameter에서 특정 파라미터를 optional로 설정하는 방법
String greeting_5(String name, int money, [String? country = '필리핀']) {
  return '아 난... $name이라는 사람입니다. 우린 10년 만에 $money억을 벌었어. 그리고 $country 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

num plus(num a, num b) => a + b;

// dart에도 삼항 연산자 있음
String capitalizeName_1(String? name) =>
    name != null ? name.toUpperCase() : 'OMG';

// 더 간략하게 코드를 작성하고 싶다면 QQ 연산자 쓰셈
String capitalizeName_2(String? name) => name?.toUpperCase() ?? 'OMG';

// QQ assignment, 데이터가 null이면 특정값을 할당해주기
String capitalizeName_3(String? name) {
  name ??= 'OMG';
  return name.toUpperCase();
}

// 타입 자체를 변수처럼 미리 설정해두고 사용할 수도 있음
typedef ListType = List<int>;

ListType reverseList(ListType list) {
  var result = list.reversed;

  // 리스트를 reversed 하게 되면 리스트와는 다른 iterable이 돼서 다시 리스트로 만들어주는 과정이 필요함
  return result.toList();
}

// 만약 좀더 구조화된 친구를 만들고 싶다면 클래스를 쓰면 됨
typedef ProfileType = Map<String, Object>;

String introduce(ProfileType profile) {
  return '아 난... ${profile['name']}이라는 사람입니다. 우린 10년 만에 ${profile['money']}억을 벌었어. 그리고 ${[
    'country'
  ]} 정관계 인사들과 모두 친해졌지. 어떻게 그럴 수 있었을까?';
}

void main() {
  sayHello('차무식');

  print(greeting_1('차무식', 700, '필리핀'));

  // 해당 함수에 어떤 매개변수가 있는지 파악하기 힘들때, named argument를 사용해보세요
  // ex) 다른 파일에 있는 함수를 import해서 사용할 때
  print(greeting_2(name: '차무식', money: 700, country: '필리핀'));

  print(greeting_3(name: '차무식'));

  print(greeting_4(name: '차무식', money: 700, country: '필리핀'));

  print(greeting_5('차무식', 700));

  print(capitalizeName_1('cha moosik'));

  print(reverseList([1, 2, 3, 4]));

  print(introduce({'name': '차무식', 'money': 700, 'country': '필리핀'}));
}
