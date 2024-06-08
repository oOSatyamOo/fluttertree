import 'dart:async';

void main() {
  final controller = new StreamController();

  final order = Order('Banana');

  final baker =
      new StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'Chocolate') {
      sink.add(new Cake());
    } else {
      sink.addError('I can not bake that Type of Cake !!!');
    }
  });

  controller.sink.add(order);

  controller.stream
      .map((order) => order.type)
      .transform(baker)
      .listen((cake) => print('Heares your cake'), onError: (e) => print(e));
}

class Cake {}

class Order {
  final String type;
  const Order(this.type);
}
