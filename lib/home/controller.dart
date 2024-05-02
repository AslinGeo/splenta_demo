import 'package:sample_project/home/variables.dart';

class HomeController extends HomeVariables {
  int get totalQuantity {
    return products
        .map((product) => product.value.quantity)
        .reduce((total, quantity) => total + quantity);
  }
}
