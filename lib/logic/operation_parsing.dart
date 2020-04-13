/*
this is is where the input will be parsed in to a operation tree
*/
class OperationParsing {
  static Map<String, String> operators = {r'/': (_list[0]/_list[1]).toString(), r'X': (_list[0]*_list[1]).toString(), r'-': (_list[0]-_list[1]).toString(), r'+': (_list[0]+_list[1]).toString()};
  static List<double> _list = new List(2);

  static void _getNumber(String number){
    double nummer;
    try{
      nummer = double.parse(number);
    }catch(e){
      throw new Exception('expected number');
    }
    _list.add(nummer);
  }

  static String operate(String operation){
    var opArr = operation.split(' ');
    _getNumber(opArr[0]);
    _getNumber(opArr[2]);
    String retString = operators[opArr[1]];
    _list.clear();
    return retString;
  }

}
