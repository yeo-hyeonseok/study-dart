/*
- dart는 세미콜론을 일부러 달아주지 않는 경우도 있음. 항상 세미콜론 신경쓸 것
*/

// main() - 모든 dart 프로젝트에서의 entry point, 반드시 존재해야 함
void main() {
  print('안녕 ㅋ');

  // 변수 선언 시, 타입 구체화 필요 x, 관습적으로 함수나 메서드 내부에서 지역 변수를 선언할 때에는 해당 방식 사용
  var bride = '아낙수나문';
  var groom = '이모텝';

  // 타입을 명시적으로 지정해서 변수를 선언할 수도 있음, 관습적으로 클래스에서 변수나 property를 선언할 때는 해당 방식 사용
  String marriage = bride + '❤️' + groom;
  int count = 0;
  bool isRegisterd = true;

  // 여러가지 타입을 가질 수 있는 변수에 사용하는 키워드, 특정 데이터의 타입을 알기 힘들 때 사용
  dynamic freedom = '자유';
  freedom = 1;
  freedom = false;

  // null safety - 개발자가 null 값을 참조할 수 없도록 하는 dart의 기능, 또는 어떤 변수나 데이터가 null이 될 수가 있다는 것을 명시하는 것
  // 타입 뒤에 물음표를 붙이면 해당 키워드의 변수는 null 값일 수도 있다는 말
  // 기본적으로 모든 변수는 nullable이 아님 (null이 될 수가 없다는 뜻)
  String? name = '까를로스';
  name = null;

  if (name != null) print(name.length);
  print(name?.length);

  // 상수를 만들고 싶다면 final 키워드
  // 자바스크립트의 const랑 같음
  final score = 65;

  // 요런 식으로 타입까지 지정해줄 수 있음. 필수는 아님
  final int realScore = 100;

  // 초기값 없이 변수를 선언하고 싶다면 late 키워드
  late final String address;
  address = '000-0000';

  // 사실 dart에도 const는 있음. 근데 자바스크립트의 const와는 좀 다름
  // dart에서 const는 compile-time constant
  // const 변수는 재할당이 불가하며, 컴파일 하는 시점에서 알고 있는 값에 사용하는 거임
  // 예를 들어, 사용자가 입력해야하는 값이나 api 요청 함수가 반환하는 값은 const가 인식을 못한다는 거
  // 즉, 완전히 미리 정해진 값이 필요할 때 사용한는 거임
  const API_KEY = '000000000';
  const max_allowed_price = 200000;
  const limited_length = 200;
}
