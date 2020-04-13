/*
this is is where the input will be parsed in to a operation tree
*/
class OperationParsing {
  final String operationString;
  final List<String> operators = [r'\', r'X', r'-', r'+'];


  OperationParsing(this.operationString);

  OperationTree toTree(){
    OperationTree tree = new OperationTree();
    List<String> operationArray = getOpArray();
    return tree;
  }

  List<String> getOpArray() {
    return operationString.split(r' ');
  }

}
