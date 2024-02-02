import 'package:test/test.dart';

int getModusInNumber(List<int> arrayNumber) {
  Map<int, int> count = {};
  int currentModus = 0;
  int result = arrayNumber.first;
  for (var e in arrayNumber) {
    int currentCount = 0;
    if (!count.containsKey(e)) {
      currentCount = 1;
      count[e] = currentCount;
    } else {
      currentCount = count[e] ?? 1;
      currentCount++;
      count[e] = currentCount;
    }
    if (currentCount > currentModus) {
      currentModus = currentCount;
      result = e;
    }
  }
  return result;
}

String getModusInString(String content) {
  List<String> arr = content.split("");
  List<String> excluded = [" ", ",", "."];
  arr.removeWhere((e) => excluded.contains(e));
  Map<String, int> count = {};
  int currentModus = 0;
  String result = "";
  for (var e in arr) {
    int currentCount = 0;
    if (!count.containsKey(e)) {
      currentCount = 1;
      count[e] = currentCount;
    } else {
      currentCount = count[e] ?? 1;
      currentCount++;
      count[e] = currentCount;
    }
    if (currentCount > currentModus) {
      currentModus = currentCount;
      result = e;
    }
  }
  return result;
}

void main() {
  test('test find modus 1', () {
    const List<int> arrayNumber = [4, 7, 1, 8, 1, 0];
    final int result = getModusInNumber(arrayNumber);

    expect(result, equals(1));
  });

  test('test find modus 2', () {
    const List<int> arrayNumber = [4, 3, 2, 1, 8, 0, 2];
    final int result = getModusInNumber(arrayNumber);

    expect(result, equals(2));
  });

  test('test find modus 3', () {
    const List<int> arrayNumber = [3, 3, 2, 1, 8, 0, 3];
    final int result = getModusInNumber(arrayNumber);

    expect(result, equals(3));
  });

  test('test find modus a', () {
    const String content = "apa, kabar. dulur";
    final String result = getModusInString(content);

    expect(result, equals("a"));
  });

  test('test find modus b', () {
    const String content = "bebek . bermain,";
    final String result = getModusInString(content);

    expect(result, equals("b"));
  });

  test('test find modus c', () {
    const String content = "ciyus, cuka. coklat";
    final String result = getModusInString(content);

    expect(result, equals("c"));
  });

  test('test find modus number', () {
    const List<int> arrayNumber = [
      1,
      2,
      3,
      4,
      1,
      6,
      3,
      7,
      6,
      8,
      9,
      7,
      6,
      8,
      5,
      6,
      7,
      6,
      5,
      4,
      3,
      4,
      5,
      6,
      7,
      8,
      8,
      9,
      1,
      2,
      4,
      1,
      2,
      6,
      3,
      7,
      5,
      6,
      2,
      3,
      4,
      8,
      9,
      6,
      7,
      8,
      1,
      2,
      7,
      5,
      6,
      9,
      8,
      7,
      9,
      8,
      6,
      5,
      7,
      8,
      4,
      5,
      6,
      4,
      3,
      4,
      5,
      3,
      2,
      2,
      4,
      3,
      3,
      4,
      5,
      3,
      7,
      5,
      5,
      5,
      8,
      7,
      8,
      9,
      9,
      8,
      7,
      9,
      6,
      7,
      5,
      6,
      6,
      6,
      5,
      7,
      7,
      8,
      4,
      4,
      4,
      3,
      2,
      3,
      5,
      2,
      2,
      1,
      1,
      4,
      3,
      6,
      6,
      6,
      7,
      7,
      8,
      5,
      5,
      6,
      3,
      5,
      6,
      2,
      2,
      2,
      1,
      2,
      3
    ];
    final int result = getModusInNumber(arrayNumber);

    expect(result, equals(6));
  });

  test('test find modus ascii', () {
    const String content =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec lacinia nibh. Quisque lacinia lacinia tortor ac suscipit. Fusce quis euismod urna. Sed et neque vitae sapien pulvinar gravida eget congue risus. Sed mattis quam vel faucibus tempus. Morbi eget mi vel turpis blandit interdum. Maecenas egestas libero et ante sodales placerat. Nulla facilisi. Phasellus id nibh tempus, placerat mauris id, sodales nunc. Maecenas eleifend, neque ut viverra sodales, est lacus vestibulum nulla, ut malesuada est neque vitae est. Curabitur turpis ligula, consectetur vel nisi id, auctor pulvinar felis. Proin in nisl vel justo mattis semper a vel orci.";
    final String result = getModusInString(content);

    expect(result, equals("e"));
  });
}
