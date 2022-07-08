void main() async {
  for (int i = 1; i <= 10; i++) {
    int value=await display(i);
    print(value);
  }
  print('hello');
}

Future<int> display(int num) {
  return Future.delayed(Duration(seconds: 2)).then((value) => num);
}
