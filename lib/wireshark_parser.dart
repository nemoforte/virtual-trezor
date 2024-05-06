import 'dart:typed_data';

import 'package:virtual_trezor/interpreter/interpreter.dart';

void main() {
  List<String> inputs = <String>[
    '3f2323003b0000004610001a20dcd71a2ef0a2cbe16d29381456180b7fe05a852e611039a95226d1b59bad6ab122201289428af60582d41bd52887700b0bf50e',
    '3f63ce1151907b15705e367bc3edc5f42ef0a2cbe16d29381456180b7fe05a852e611039a95226d1b59bad6ab122201289428af60582d41bd52887700b0bf50e',
  ];

  List<int> mergedDecimalValues = <int>[];

  for (int i = 0; i < inputs.length; i++) {
    String input = inputs[i];
    if (i > 0) {
      input = input.substring(2); // Remove the first two characters
    }
    for (int j = 0; j < input.length; j += 2) {
      String pair = input.substring(j, j + 2);
      int decimalValue = int.parse(pair, radix: 16);
      mergedDecimalValues.add(decimalValue);
    }
  }

  Interpreter.interpret(Uint8List.fromList(mergedDecimalValues));
}
