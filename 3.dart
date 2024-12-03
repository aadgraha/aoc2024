import 'dart:io';

import 'package:collection/collection.dart';

void main() {
  final file_path = Directory.current.path + '/3_input.txt';
  final file = File(file_path);
  final content = file.readAsStringSync();
  final regex = RegExp(r'mul\((\d+),(\d+)\)');
  print(regex
      .allMatches(content)
      .map((e) => int.parse(e.group(1)!) * int.parse(e.group(2)!))
      .sum);
}
