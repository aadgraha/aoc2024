import 'dart:io';

void main() {
  final file_path = Directory.current.path + '/1_input.txt';
  final file = File(file_path);
  final content = file.readAsLinesSync();
  final leftNum = <int>[];
  final rightNum = <int>[];
  final val = <int>[];
  final numbers =
      content.map((e) => e.split('   ').map((e2) => int.parse(e2))).toList();
  for (var i = 0; i < numbers.length; i++) {
    final data = numbers[i].toList();
    leftNum.add(data[0]);
    rightNum.add(data[1]);
  }

  if (rightNum.length == leftNum.length) {
    for (var i = 0; i < leftNum.length; i++) {
      final dif = leftNum[i] * rightNum.where((e) => e == leftNum[i]).length;
      val.add(dif);
    }
  }

  print(val.fold<int>(0, (p, e) => p + e));
}
