import 'package:flutter/material.dart';
import 'package:flutter_calculator/logic/util/list_classes.dart';
/*
this is a tree like structure that will structure the functions put in the calculator view
*/

enum OperationDescrip{
  Integer,
  Operator,
  end
}

class OperationTree{

  MyStack<OperationItem> equation = new MyStack<OperationItem>();

  void pushoperation(OperatorItem opitem){
    equation.push(opitem);
  }

   OperationItem getOperation(){
       if(equation.hasNext()){
         return equation.pop();
       } else{
         return OperationItem(descrip: OperationDescrip.end, item: null);
       }
  }
}

class OperationItem{
  OperationDescrip descrip;
  var item;
  OperationItem({@required this.descrip, @required this.item});
}

class OperatorItem extends OperationItem{
  OperationItem left, right;
  String operator;
  OperatorItem({@required this.left, @required this.right, this.operator});
}

class NumberOperatorItem extends OperationItem{
  double number;

  NumberOperatorItem({@required numString}){
    var temp = double.tryParse(numString);
    if(temp == null){
      throw new Exception('not a recognized number');
    }
    number = temp;
  }
}