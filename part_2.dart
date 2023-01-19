void main() {
  /* dart의 자료형들 */
  String word = '문자열';
  int count = 0;
  double ratio = 55.55;
  bool isTrue = false;

  // 그 중에서도 num 자료형은 int가 될 수도 있고, double이 될 수도 있음.
  // int와 double이 num 클래스를 상속하고 있기 때문
  late num number;
  number = 0;
  number = 55.55;

  // 리스트
  var numbers = [0, 1, 2, 3, 4, 5];
  List<int> numbers_t = [0, 1, 2, 3, 4, 5];

  var strings = ['ㄱ', 'ㄴ', 'ㄷ'];
  List<String> strings_t = ['ㄱ', 'ㄴ', 'ㄷ'];

  var mixed = [
    0,
    1,
    2,
    'ㄱ',
    'ㄴ',
  ];

  // Object는 최상위 클래스로 기본적으로 어떤 자료형이든지 될 수 있음.
  // 타입스크립트의 any처럼 사용하면 될듯
  List<Object> mixed_t = [
    0,
    1,
    2,
    'ㄱ',
    'ㄴ',
  ];

  /* 리스트의 메서드들 */
  // 첫번째 원소 반환
  print(numbers.first);

  // 마지막 원소 반환
  print(numbers.last);

  // 원소의 개수 반환
  print(numbers.length);

  // 리스트의 순서를 바꿔서 반환 (원본 변경 x)
  print(numbers.reversed);
  print(numbers);

  // 리스트가 비어 있는지 검사
  print(numbers.isEmpty);

  // 리스트의 런타임 시점에서의 타입
  print(numbers.runtimeType);

  // 리스트에 원소 추가 (원본 변경 o)
  numbers.add(6);
  print(numbers);

  numbers.addAll([7, 8, 9]);
  print(numbers);

  // 특정 원소를 포함하고 있는지 확인
  print(numbers.contains(0));

  // 리스트 비우기 (원본 변경 o)
  numbers.clear();
  print(numbers);

  /* ⭐collection if */
  // 리스트의 특정 원소를 조건에 따라 추가할 지 안할 지 설정할 수 있음 ㄷㄷ
  var isPublished = true;
  var books = [
    '이말년시리즈',
    '신과 함께',
    '찌질의 역사',
    if (isPublished) '패션왕',
  ];

  // 사실 요거랑 같다고 보면 됨
  if (isPublished) {
    books.add('패션왕');
  }
  print(books);

  // 문자열 사이에 변수를 끼워서 사용하고 싶다면 String interpolation
  // 최종적으로 String으로 변환해줄 것이기 때문에 데이터 타입이 일치할 필요는 없음
  var name = '김아낙수나문';
  print('안녕 친구들 나는 $name이라고 해');

  var age = 26;
  print('내 나이 $age 인생을 알다.');

  var really = true;
  print('진짜가? (Is $really?)');

  // 로직이 필요하다면 중괄호를
  print('미안 사실 \'${age + 9}\'살이야');

  // 특정 리스트에 다른 리스트를 삽입하는데, 원소 각각에 로직을 포함하고 싶다면 collection for
  var bestsellers = ['이말년서유기', '무한동력', '내일은 럭키곰스타'];
  var webtoons = [
    '쇼미더럭키짱',
    '소녀재판',
    '지옥급식',
    for (var item in bestsellers) '👍 ${item}',
  ];
  print(webtoons);

  // 키와 값으로 이루어진 Map, 자바스크립트의 object랑 같은 개념임
  var user = {
    'username': '홍수몬',
    'age': 21,
    'shiny': false,
  };

  // String => 키, Object => 값
  Map<String, Object> user_t = {
    'username': '홍수몬',
    'age': 21,
    'shiny': false,
  };

  // Map에 제너릭 타입을 명시할 경우 해당 타입의 키와 값만 설정 가능
  // 뭔가 인터페이스하고 닮은 것 같기도 함
  Map<int, String> rating = {
    1: '시라소몬',
    2: '홍수몬',
    3: '이금기',
  };

  // Set, 리스트와 차이는 Set의 모든 원소들은 unique함
  var new_set = {0, 1, 2, 3, 4};
  Set<int> new_set_t = {0, 1, 2, 3, 4};

  // 중복되는 값이 없음 ㅋ
  // 원소가 항상 하나씩만 존재해야 할 때, Set을 사용하면 됨
  new_set.add(5);
  new_set.add(5);
  print(new_set);
}
