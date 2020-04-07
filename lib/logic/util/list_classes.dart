/*
this is for any list like utilities i have to create
 */
class MyStack<T>{

  List<T> stack = new List<T>();

  void push( T obj) => stack.add(obj);

  T pop() => stack.removeLast();

  bool hasNext() {
    return stack.last != null; 
  }

}