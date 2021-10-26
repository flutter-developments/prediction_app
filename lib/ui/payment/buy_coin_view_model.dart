import 'package:prediction_app/database/base_view_model.dart';
import 'package:prediction_app/database/view_state.dart';

class BuyCoinViewModel extends BaseViewModel {
  List<PackagesTestClass> coins = [
    PackagesTestClass(
      totalPrice: "4,99₺",
      totalCoins: 200,
      isSelected: false,
      hasBorder: true,
    ),
    PackagesTestClass(
      totalPrice: "7,99₺",
      totalCoins: 500,
      isSelected: false,
      hasBorder: true,
    ),
    PackagesTestClass(
      totalPrice: "13,99₺",
      totalCoins: 1000,
      isSelected: false,
      hasBorder: true,
    ),
    PackagesTestClass(
      totalPrice: "24,99₺",
      totalCoins: 2000,
      isSelected: false,
      hasBorder: true,
    ),
    PackagesTestClass(
      totalPrice: "4,99₺",
      totalCoins: 25,
      isSelected: false,
      hasBorder: true,
    ),
  ];
  onCoinSelection(int index) {
    setState(ViewState.busy);

    for (int i = 0; i < coins.length; i++) {
      coins[i].isSelected = false;
    }
    coins[index].isSelected = true;
    setState(ViewState.idle);
  }
}

class PackagesTestClass {
  String? totalPrice;
  double? totalCoins;
  bool? isSelected;
  bool? hasBorder;
  PackagesTestClass(
      {this.totalPrice, this.totalCoins, this.isSelected, this.hasBorder});
}
