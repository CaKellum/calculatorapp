/*
this is is where the input will be parsed in to a operation tree
*/
class OperationParsing {
  static double _getNumber(String number) {
    double nummer;
    try {
      nummer = double.tryParse(number);
    } catch (e) {
      throw new Exception('expected number got' + e.toString());
    }
    return nummer;
  }

  static String operate(String operation) {
    List<String> opArr = operation.split(' ');
    double x = _getNumber(opArr[0]);
    double y = _getNumber(opArr[2]);
    Map<String, double> operators = {
      r'/': (x / y),
      r'X': (x * y),
      r'-': (x - y),
      r'+': (x + y),
    };
    double n = operators[opArr[1]];
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
