import 'dart:io';

main() {
  final file_path = Directory.current.path + '/2_input.txt';
  final file = File(file_path);
  final val = <bool>[];
  file.readAsLinesSync().map(
        (e) => e
            .split(RegExp(r'\s+'))
            .map(
              (e2) => int.parse(e2),
            )
            .toList(),
      )
    ..forEach((e) =>
        _damperedList(e, (value) => val.add(value))); //solution for problem 2
  // ..forEach((e) => _validateSafe(e, (value) => val.add(value))); //solution for problem 1
  print(val.where((e) => e == true).length);
}

_validateSafe(List<int> e, void Function(bool) onEnd) {
  final dc = <int>[];
  for (var i = 0; i < e.length; i++) {
    if (i != e.length - 1) {
      dc.add(e[i + 1] - e[i]);
    }
  }
  final valNeg = dc.every((e) => e < 0 && [-1, -2, -3].contains(e));
  final valPos = dc.every((e) => e > 0 && [1, 2, 3].contains(e));
  onEnd(valNeg || valPos);
}

_damperedList(List<int> e, void Function(bool) onEnd) {
  final damperedVal = <bool>[];
  final damperedList = List.generate(
      e.length, (index) => [...e.sublist(0, index), ...e.sublist(index + 1)]);
  damperedList.forEach((e) => _validateSafe(e, (val) => damperedVal.add(val)));
  onEnd(damperedVal.any((e) => e == true));
}
