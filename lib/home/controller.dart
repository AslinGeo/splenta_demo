import 'package:sample_project/home/variables.dart';

class HomeController extends HomeVariables {
 get totalQuantity {
    total.value = products
        .map((product) => product.value.quantity)
        .reduce((total, quantity) => total + quantity);
    return total.value;
  }

  increment(product) {
    product.update((val) {
      product.value.quantity++;
    });
    totalQuantity();
  }

  decrement(product) {
    if (product.value.quantity != 0) {
      product.update((val) {
        product.value.quantity--;
      });
       totalQuantity();
    }
  }
}
