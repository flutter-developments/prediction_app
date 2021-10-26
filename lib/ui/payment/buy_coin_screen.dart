// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:provider/provider.dart';

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:in_app_purchase_android/billing_client_wrappers.dart';
// import 'package:in_app_purchase_android/in_app_purchase_android.dart';
// import 'package:in_app_purchase_ios/in_app_purchase_ios.dart';
// import 'package:in_app_purchase_ios/store_kit_wrappers.dart';
// import 'consumable_store.dart';

// import 'buy_coin_view_model.dart';

// ProductDetails? productDetails;

// class BuyCoinScreen extends StatefulWidget {
//   // ignore: unused_element
//   @override
//   _BuyCoinScreenState createState() => _BuyCoinScreenState();
// }

// const bool _kAutoConsume = true;

// const String _kConsumableId = 'consumable';
// const String _kUpgradeId = 'upgrade';
// const String _kSilverSubscriptionId = 'subscription_silver';
// const String _kGoldSubscriptionId = 'subscription_gold';
// const List<String> _kProductIds = <String>[
//   '200coins',
//   '500coins',
//   '1000coins',
//   '2000coins',
//   '5000coins'
// ];

// class _BuyCoinScreenState extends State<BuyCoinScreen> {
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;
//   late StreamSubscription<List<PurchaseDetails>> _subscription;
//   List<String> _notFoundIds = [];
//   List<ProductDetails> _products = [];
//   List<PurchaseDetails> _purchases = [];
//   List<String> _consumables = [];
//   bool _isAvailable = false;
//   bool _purchasePending = false;
//   bool _loading = true;
//   String? _queryProductError;

//   bool isPayment = true;
//   // ignore: unused_element
//   _updateState(bool isTrue) {
//     setState(() {
//       isPayment = isTrue;
//     });
//   }

//   double _selectedPackage = 0.0;

//   @override
//   void initState() {
//     final Stream<List<PurchaseDetails>> purchaseUpdated =
//         _inAppPurchase.purchaseStream;
//     _subscription = purchaseUpdated.listen((purchaseDetailsList) {
//       _listenToPurchaseUpdated(purchaseDetailsList);
//     }, onDone: () {
//       _subscription.cancel();
//     }, onError: (error) {
//       // handle error here.
//     });
//     initStoreInfo();
//     super.initState();
//   }

//   Future<void> initStoreInfo() async {
//     final bool isAvailable = await _inAppPurchase.isAvailable();
//     if (!isAvailable) {
//       setState(() {
//         _isAvailable = isAvailable;
//         _products = [];
//         _purchases = [];
//         _notFoundIds = [];
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     if (Platform.isIOS) {
//       var iosPlatformAddition = _inAppPurchase
//           .getPlatformAddition<InAppPurchaseIosPlatformAddition>();
//       await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
//     }

//     ProductDetailsResponse productDetailResponse =
//         await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
//     if (productDetailResponse.error != null) {
//       setState(() {
//         _queryProductError = productDetailResponse.error!.message;
//         _isAvailable = isAvailable;
//         _products = productDetailResponse.productDetails;
//         _purchases = [];
//         _notFoundIds = productDetailResponse.notFoundIDs;
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     if (productDetailResponse.productDetails.isEmpty) {
//       setState(() {
//         _queryProductError = null;
//         _isAvailable = isAvailable;
//         _products = productDetailResponse.productDetails;
//         _purchases = [];
//         _notFoundIds = productDetailResponse.notFoundIDs;
//         _consumables = [];
//         _purchasePending = false;
//         _loading = false;
//       });
//       return;
//     }

//     List<String> consumables = await ConsumableStore.load();
//     setState(() {
//       _isAvailable = isAvailable;
//       _products = productDetailResponse.productDetails;
//       _notFoundIds = productDetailResponse.notFoundIDs;
//       _consumables = consumables;
//       _purchasePending = false;
//       _loading = false;
//     });
//   }

//   @override
//   void dispose() {
//     if (Platform.isIOS) {
//       var iosPlatformAddition = _inAppPurchase
//           .getPlatformAddition<InAppPurchaseIosPlatformAddition>();
//       iosPlatformAddition.setDelegate(null);
//     }
//     _subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> stack = [];
//     if (_queryProductError == null) {
//       stack.add(
//         ListView(
//           children: [
//             _buildConnectionCheckTile(),
//             _buildProductList(),
//             _buildConsumableBox(),
//             _buildRestoreButton(),
//           ],
//         ),
//       );
//     } else {
//       stack.add(Center(
//         child: Text(_queryProductError!),
//       ));
//     }
//     if (_purchasePending) {
//       stack.add(
//         Stack(
//           children: [
//             Opacity(
//               opacity: 0.3,
//               child: const ModalBarrier(dismissible: false, color: Colors.grey),
//             ),
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//           ],
//         ),
//       );
//     }

//     // return MaterialApp(
//     //   home: Scaffold(
//     //     appBar: AppBar(
//     //       title: const Text('IAP Example'),
//     //     ),
//     //     body: Stack(
//     //       children: stack,
//     //     ),
//     //   ),
//     // );

//     // ORIGINAL VIEW OF APPLICATION

//     return ChangeNotifierProvider(
//       create: (context) => BuyCoinViewModel(),
//       child: Consumer<BuyCoinViewModel>(
//         builder: (context, model, child) => SafeArea(
//           child: Scaffold(
//             backgroundColor: backgroundColor,
//             body: SingleChildScrollView(
//               padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ///
//                     /// Appbar of Screen
//                     ///
//                     CustomAppBar(
//                         iconColor: light_black,
//                         textColor: light_black,
//                         appBarTitle: "Buy coins"),

//                     SizedBox(
//                       height: 42.h,
//                     ),

//                     ImageContainer(
//                       width: 108.w,
//                       height: 108.h,
//                       assets: ImagesPath.coin_vector,
//                       radius: 0.r,
//                     ),

//                     SizedBox(
//                       height: 20.h,
//                     ),

//                     Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
//                       style: kufamTextStyle.copyWith(
//                         fontSize: 14.sp,
//                         height: 1.5,
//                       ),
//                     ),

//                     ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       padding: EdgeInsets.symmetric(vertical: 40),
//                       shrinkWrap: true,
//                       itemCount: _products.length,
//                       itemBuilder: (context, index) => _coinTile(
//                         name: _products[index].title,
//                         onTap: () {
//                           model.onCoinSelection(index);
//                           _selectedPackage = model.coins[index].totalCoins!;
//                           print("selected coin = $_selectedPackage");
//                           productDetails = _products[index];
//                         },
//                         haveBorder: index != model.coins.length - 1 &&
//                                 !model.coins[index].isSelected!
//                             ? true
//                             : false,
//                         iconPath: model.coins[index].isSelected!
//                             ? model.coins[index].selectedIcon!
//                             : model.coins[index].unselectedIcon!,
//                         isSelected: model.coins[index].isSelected!,
//                         coins: model.coins[index].totalCoins!,
//                         price: index == model.coins.length - 1
//                             ? Row(
//                                 children: [
//                                   Text(
//                                     "Watch Video",
//                                     style: kufamTextStyle.copyWith(
//                                         fontSize: 14.sp),
//                                   ),
//                                   SizedBox(
//                                     width: 6.w,
//                                   ),
//                                   ImageContainer(
//                                     width: 20.w,
//                                     height: 15.w,
//                                     assets: IconsPath.video_camera_icon,
//                                     radius: 0.r,
//                                   ),
//                                 ],
//                               )
//                             : Text(
//                                 "${_products[index].price}",
//                                 style: kufamTextStyle.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                   color: model.coins[index].isSelected!
//                                       ? light_red_color
//                                       : light_black,
//                                   fontSize: 18.sp,
//                                 ),
//                               ),
//                       ),
//                     ),

//                     isPayment == true
//                         ? RoundedButton(
//                             press: () => _buyCoins(_selectedPackage, context),
//                             text: "Purchase",
//                             color: unActive_button_silver_color,
//                             textColor: light_black,
//                             width: 314.w)
//                         : Center(
//                             child: buildCircularProgressIndicator(),
//                           ),

//                     SizedBox(
//                       height: 18.h,
//                     ),

//                     RoundedButton(
//                         text: "Become premium",
//                         color: blue,
//                         textColor: Colors.white,
//                         width: 314.w),

//                     SizedBox(
//                       height: 50.h,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _coinTile(
//       {bool isSelected = false,
//       double? coins,
//       String? name,
//       Widget? price,
//       required bool haveBorder,
//       required String iconPath,
//       required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.only(top: 20, bottom: 16, left: 18, right: 18),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? light_red_color.withOpacity(0.3)
//               : Colors.transparent,
//           border: isSelected
//               ? Border.all(color: Colors.transparent)
//               : Border(
//                   bottom: BorderSide(
//                       color: haveBorder
//                           ? light_black.withOpacity(0.4)
//                           : Colors.transparent)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             isSelected
//                 ? Padding(
//                     padding: EdgeInsets.only(left: 28.w),
//                     child: Text(
//                       "Best Choice",
//                       style: kufamTextStyle.copyWith(
//                         color: light_red_color,
//                         fontSize: 14.sp,
//                         height: 1.5,
//                       ),
//                     ),
//                   )
//                 : SizedBox.shrink(),
//             Row(
//               children: [
//                 ImageContainer(
//                   width: 17.w,
//                   height: 14.w,
//                   assets: iconPath,
//                   radius: 0.r,
//                 ),
//                 SizedBox(
//                   width: 11.w,
//                 ),
//                 Text(
//                   // "${coins!} Coins",
//                   "${name!.substring(0, name.indexOf("("))} ",
//                   style: kufamTextStyle.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: isSelected ? light_red_color : light_black,
//                     fontSize: 18.sp,
//                   ),
//                 ),
//                 Spacer(),
//                 price!,
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   updatecoin(
//     double buyCoin,
//   ) async {
//     _updateState(false);
//     if (buyCoin != 0) {
//       String coin = '''
//        mutation{
//        buyCoins(coins:${buyCoin.toInt()}, description:"Test purchase")
//        }
//        ''';
//       print(coin);
//       try {
//         GraphQlClass graphQlClass = GraphQlClass();
//         GraphQLClient graphQLClient = graphQlClass.clientToQuery();
//         QueryResult result =
//             await graphQLClient.query(QueryOptions(document: gql(coin)));
//         _updateState(true);
//         if (result.data != null) {
//           showMessageSuccess(result.data!["buyCoins"]);
//           AppRoutes.pop(context);
//         } else
//           showMessageError(result.data!["buyCoins"]);
//       } catch (e, s) {
//         print("Exception $e");
//         print(s);
//       }
//     } else {
//       showMessageError("Please Select Package");
//     }
//   }

//   Future<void> _buyCoins(double buyCoin, context) async {
//     late PurchaseParam purchaseParam;
//     Map<String, PurchaseDetails> purchases =
//         Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
//       if (purchase.pendingCompletePurchase) {
//         _inAppPurchase.completePurchase(purchase);
//       }
//       return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
//     }));
//     if (Platform.isAndroid) {
//       // NOTE: If you are making a subscription purchase/upgrade/downgrade, we recommend you to
//       // verify the latest status of you your subscription by using server side receipt validation
//       // and update the UI accordingly. The subscription purchase status shown
//       // inside the app may not be accurate.
//       final oldSubscription = _getOldSubscription(productDetails!, purchases);

//       purchaseParam = GooglePlayPurchaseParam(
//           productDetails: productDetails!,
//           applicationUserName: null,
//           changeSubscriptionParam: (oldSubscription != null)
//               ? ChangeSubscriptionParam(
//                   oldPurchaseDetails: oldSubscription,
//                   prorationMode: ProrationMode.immediateWithTimeProration,
//                 )
//               : null);
//     } else {
//       purchaseParam = PurchaseParam(
//         productDetails: productDetails!,
//         applicationUserName: null,
//       );
//     }

//     if (productDetails!.id == _kConsumableId) {
//       _inAppPurchase
//           .buyConsumable(
//               purchaseParam: purchaseParam,
//               autoConsume: _kAutoConsume || Platform.isIOS)
//           .then((value) => (updatecoin(
//                 buyCoin,
//               )));
//     } else {
//       _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
//     }
//   }

//   Card _buildConnectionCheckTile() {
//     if (_loading) {
//       return Card(child: ListTile(title: const Text('Trying to connect...')));
//     }
//     final Widget storeHeader = ListTile(
//       leading: Icon(_isAvailable ? Icons.check : Icons.block,
//           color: _isAvailable ? Colors.green : ThemeData.light().errorColor),
//       title: Text(
//           'The store is ' + (_isAvailable ? 'available' : 'unavailable') + '.'),
//     );
//     final List<Widget> children = <Widget>[storeHeader];

//     if (!_isAvailable) {
//       children.addAll([
//         Divider(),
//         ListTile(
//           title: Text('Not connected',
//               style: TextStyle(color: ThemeData.light().errorColor)),
//           subtitle: const Text(
//               'Unable to connect to the payments processor. Has this app been configured correctly? See the example README for instructions.'),
//         ),
//       ]);
//     }
//     return Card(child: Column(children: children));
//   }

//   Card _buildProductList() {
//     if (_loading) {
//       return Card(
//           child: (ListTile(
//               leading: CircularProgressIndicator(),
//               title: Text('Fetching products...'))));
//     }
//     if (!_isAvailable) {
//       return Card();
//     }
//     final ListTile productHeader = ListTile(title: Text('Products for Sale'));
//     List<ListTile> productList = <ListTile>[];
//     if (_notFoundIds.isNotEmpty) {
//       productList.add(ListTile(
//           title: Text('[${_notFoundIds.join(", ")}] not found',
//               style: TextStyle(color: ThemeData.light().errorColor)),
//           subtitle: Text(
//               'This app needs special configuration to run. Please see example/README.md for instructions.')));
//     }

//     // This loading previous purchases code is just a demo. Please do not use this as it is.
//     // In your app you should always verify the purchase data using the `verificationData` inside the [PurchaseDetails] object before trusting it.
//     // We recommend that you use your own server to verify the purchase data.
//     Map<String, PurchaseDetails> purchases =
//         Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
//       if (purchase.pendingCompletePurchase) {
//         _inAppPurchase.completePurchase(purchase);
//       }
//       return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
//     }));

//     _products.sort((a, b) => a.price.compareTo(b.price));

//     productList.addAll(_products.map(
//       (ProductDetails productDetails) {
//         PurchaseDetails? previousPurchase = purchases[productDetails.id];
//         return ListTile(
//             title: Text(
//               productDetails.title,
//             ),
//             subtitle: Text(
//               productDetails.description,
//             ),
//             trailing: previousPurchase != null
//                 ? IconButton(
//                     onPressed: () => confirmPriceChange(context),
//                     icon: Icon(Icons.upgrade))
//                 : TextButton(
//                     child: Text(productDetails.price),
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.green[800],
//                       primary: Colors.white,
//                     ),
//                     onPressed: () {
//                       late PurchaseParam purchaseParam;

//                       if (Platform.isAndroid) {
//                         // NOTE: If you are making a subscription purchase/upgrade/downgrade, we recommend you to
//                         // verify the latest status of you your subscription by using server side receipt validation
//                         // and update the UI accordingly. The subscription purchase status shown
//                         // inside the app may not be accurate.
//                         final oldSubscription =
//                             _getOldSubscription(productDetails, purchases);

//                         purchaseParam = GooglePlayPurchaseParam(
//                             productDetails: productDetails,
//                             applicationUserName: null,
//                             changeSubscriptionParam: (oldSubscription != null)
//                                 ? ChangeSubscriptionParam(
//                                     oldPurchaseDetails: oldSubscription,
//                                     prorationMode: ProrationMode
//                                         .immediateWithTimeProration,
//                                   )
//                                 : null);
//                       } else {
//                         purchaseParam = PurchaseParam(
//                           productDetails: productDetails,
//                           applicationUserName: null,
//                         );
//                       }

//                       if (productDetails.id == _kConsumableId) {
//                         _inAppPurchase.buyConsumable(
//                             purchaseParam: purchaseParam,
//                             autoConsume: _kAutoConsume || Platform.isIOS);
//                       } else {
//                         _inAppPurchase.buyNonConsumable(
//                             purchaseParam: purchaseParam);
//                       }
//                     },
//                   ));
//       },
//     ));

//     return Card(
//         child:
//             Column(children: <Widget>[productHeader, Divider()] + productList));
//   }

//   Card _buildConsumableBox() {
//     if (_loading) {
//       return Card(
//           child: (ListTile(
//               leading: CircularProgressIndicator(),
//               title: Text('Fetching consumables...'))));
//     }
//     if (!_isAvailable || _notFoundIds.contains(_kConsumableId)) {
//       return Card();
//     }
//     final ListTile consumableHeader =
//         ListTile(title: Text('Purchased consumables'));
//     final List<Widget> tokens = _consumables.map((String id) {
//       return GridTile(
//         child: IconButton(
//           icon: Icon(
//             Icons.stars,
//             size: 42.0,
//             color: Colors.orange,
//           ),
//           splashColor: Colors.yellowAccent,
//           onPressed: () => consume(id),
//         ),
//       );
//     }).toList();
//     return Card(
//         child: Column(children: <Widget>[
//       consumableHeader,
//       Divider(),
//       GridView.count(
//         crossAxisCount: 5,
//         children: tokens,
//         shrinkWrap: true,
//         padding: EdgeInsets.all(16.0),
//       )
//     ]));
//   }

//   Widget _buildRestoreButton() {
//     if (_loading) {
//       return Container();
//     }

//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           TextButton(
//             child: Text('Restore purchases'),
//             style: TextButton.styleFrom(
//               backgroundColor: Theme.of(context).primaryColor,
//               primary: Colors.white,
//             ),
//             onPressed: () => _inAppPurchase.restorePurchases(),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> consume(String id) async {
//     await ConsumableStore.consume(id);
//     final List<String> consumables = await ConsumableStore.load();
//     setState(() {
//       _consumables = consumables;
//     });
//   }

//   void showPendingUI() {
//     setState(() {
//       _purchasePending = true;
//     });
//   }

//   void deliverProduct(PurchaseDetails purchaseDetails) async {
//     // IMPORTANT!! Always verify purchase details before delivering the product.
//     if (purchaseDetails.productID == _kConsumableId) {
//       await ConsumableStore.save(purchaseDetails.purchaseID!);
//       List<String> consumables = await ConsumableStore.load();
//       setState(() {
//         _purchasePending = false;
//         _consumables = consumables;
//       });
//     } else {
//       setState(() {
//         _purchases.add(purchaseDetails);
//         _purchasePending = false;
//       });
//     }
//   }

//   void handleError(IAPError error) {
//     setState(() {
//       _purchasePending = false;
//     });
//   }

//   Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
//     // IMPORTANT!! Always verify a purchase before delivering the product.
//     // For the purpose of an example, we directly return true.
//     return Future<bool>.value(true);
//   }

//   void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
//     // handle invalid purchase here if  _verifyPurchase` failed.
//   }

//   void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//     purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//       if (purchaseDetails.status == PurchaseStatus.pending) {
//         showPendingUI();
//       } else {
//         if (purchaseDetails.status == PurchaseStatus.error) {
//           handleError(purchaseDetails.error!);
//         } else if (purchaseDetails.status == PurchaseStatus.purchased ||
//             purchaseDetails.status == PurchaseStatus.restored) {
//           bool valid = await _verifyPurchase(purchaseDetails);
//           if (valid) {
//             deliverProduct(purchaseDetails);
//           } else {
//             _handleInvalidPurchase(purchaseDetails);
//             return;
//           }
//         }
//         if (Platform.isAndroid) {
//           if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
//             final InAppPurchaseAndroidPlatformAddition androidAddition =
//                 _inAppPurchase.getPlatformAddition<
//                     InAppPurchaseAndroidPlatformAddition>();
//             await androidAddition.consumePurchase(purchaseDetails);
//           }
//         }
//         if (purchaseDetails.pendingCompletePurchase) {
//           await _inAppPurchase.completePurchase(purchaseDetails);
//         }
//       }
//     });
//   }

//   Future<void> confirmPriceChange(BuildContext context) async {
//     if (Platform.isAndroid) {
//       final InAppPurchaseAndroidPlatformAddition androidAddition =
//           _inAppPurchase
//               .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
//       var priceChangeConfirmationResult =
//           await androidAddition.launchPriceChangeConfirmationFlow(
//         sku: 'purchaseId',
//       );
//       if (priceChangeConfirmationResult.responseCode == BillingResponse.ok) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Price change accepted'),
//         ));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//             priceChangeConfirmationResult.debugMessage ??
//                 "Price change failed with code ${priceChangeConfirmationResult.responseCode}",
//           ),
//         ));
//       }
//     }
//     if (Platform.isIOS) {
//       var iapIosPlatformAddition = _inAppPurchase
//           .getPlatformAddition<InAppPurchaseIosPlatformAddition>();
//       await iapIosPlatformAddition.showPriceConsentIfNeeded();
//     }
//   }

//   GooglePlayPurchaseDetails? _getOldSubscription(
//       ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
//     // This is just to demonstrate a subscription upgrade or downgrade.
//     // This method assumes that you have only 2 subscriptions under a group, 'subscription_silver' & 'subscription_gold'.
//     // The 'subscription_silver' subscription can be upgraded to 'subscription_gold' and
//     // the 'subscription_gold' subscription can be downgraded to 'subscription_silver'.
//     // Please remember to replace the logic of finding the old subscription Id as per your app.
//     // The old subscription is only required on Android since Apple handles this internally
//     // by using the subscription group feature in iTunesConnect.
//     GooglePlayPurchaseDetails? oldSubscription;
//     if (productDetails.id == _kSilverSubscriptionId &&
//         purchases[_kGoldSubscriptionId] != null) {
//       oldSubscription =
//           purchases[_kGoldSubscriptionId] as GooglePlayPurchaseDetails;
//     } else if (productDetails.id == _kGoldSubscriptionId &&
//         purchases[_kSilverSubscriptionId] != null) {
//       oldSubscription =
//           purchases[_kSilverSubscriptionId] as GooglePlayPurchaseDetails;
//     }
//     return oldSubscription;
//   }
// }

// /// Example implementation of the
// /// [`SKPaymentQueueDelegate`](https://developer.apple.com/documentation/storekit/skpaymentqueuedelegate?language=objc).
// ///
// /// The payment queue delegate can be implementated to provide information
// /// needed to complete transactions.
// class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
//   @override
//   bool shouldContinueTransaction(
//       SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
//     return true;
//   }

//   @override
//   bool shouldShowPriceConsent() {
//     return false;
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:graphql_flutter/graphql_flutter.dart';
// // import 'package:letter_bird_project/core/assets/icons.dart';
// // import 'package:letter_bird_project/core/assets/images.dart';
// // import 'package:letter_bird_project/core/constants/colors.dart';
// // import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
// // import 'package:letter_bird_project/core/text_styles.dart';
// // import 'package:letter_bird_project/ui/components/loader.dart';
// // import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
// // import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
// // import 'package:letter_bird_project/ui/custom_widgets/routes.dart';
// // import 'package:letter_bird_project/ui/screens/auth/sign_up/profiles/DOB.dart';
// // import 'package:provider/provider.dart';
// // import 'buy_coin_view_model.dart';

// // class BuyCoinScreen extends StatefulWidget {
// //   // ignore: unused_element
// //   @override
// //   _BuyCoinScreenState createState() => _BuyCoinScreenState();
// // }

// // class _BuyCoinScreenState extends State<BuyCoinScreen> {
// //   bool isPayment = true;
// //   // ignore: unused_element
// //   _updateState(bool isTrue) {
// //     setState(() {
// //       isPayment = isTrue;
// //     });
// //   }

// //   double _selectedPackage = 0.0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => BuyCoinViewModel(),
// //       child: Consumer<BuyCoinViewModel>(
// //         builder: (context, model, child) => SafeArea(
// //           child: Scaffold(
// //             backgroundColor: backgroundColor,
// //             body: SingleChildScrollView(
// //               padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
// //               child: Center(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     ///
// //                     /// Appbar of Screen
// //                     ///
// //                     CustomAppBar(
// //                         iconColor: light_black,
// //                         textColor: light_black,
// //                         appBarTitle: "Buy coins"),

// //                     SizedBox(
// //                       height: 42.h,
// //                     ),

// //                     ImageContainer(
// //                       width: 108.w,
// //                       height: 108.h,
// //                       assets: ImagesPath.coin_vector,
// //                       radius: 0.r,
// //                     ),

// //                     SizedBox(
// //                       height: 20.h,
// //                     ),

// //                     Text(
// //                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
// //                       style: kufamTextStyle.copyWith(
// //                         fontSize: 14.sp,
// //                         height: 1.5,
// //                       ),
// //                     ),

// //                     ListView.builder(
// //                       physics: NeverScrollableScrollPhysics(),
// //                       padding: EdgeInsets.symmetric(vertical: 40),
// //                       shrinkWrap: true,
// //                       itemCount: model.coins.length,
// //                       itemBuilder: (context, index) => _coinTile(
// //                         onTap: () {
// //                           model.onCoinSelection(index);
// //                           _selectedPackage = model.coins[index].totalCoins!;
// //                           print("selected coin = $_selectedPackage");
// //                         },
// //                         haveBorder: index != model.coins.length - 1 &&
// //                                 !model.coins[index].isSelected!
// //                             ? true
// //                             : false,
// //                         iconPath: model.coins[index].isSelected!
// //                             ? model.coins[index].selectedIcon!
// //                             : model.coins[index].unselectedIcon!,
// //                         isSelected: model.coins[index].isSelected!,
// //                         coins: model.coins[index].totalCoins!,
// //                         price: index == model.coins.length - 1
// //                             ? Row(
// //                                 children: [
// //                                   Text(
// //                                     "Watch Video",
// //                                     style: kufamTextStyle.copyWith(
// //                                         fontSize: 14.sp),
// //                                   ),
// //                                   SizedBox(
// //                                     width: 6.w,
// //                                   ),
// //                                   ImageContainer(
// //                                     width: 20.w,
// //                                     height: 15.w,
// //                                     assets: IconsPath.video_camera_icon,
// //                                     radius: 0.r,
// //                                   ),
// //                                 ],
// //                               )
// //                             : Text(
// //                                 "${model.coins[index].totalPrice!}",
// //                                 style: kufamTextStyle.copyWith(
// //                                   fontWeight: FontWeight.w500,
// //                                   color: model.coins[index].isSelected!
// //                                       ? light_red_color
// //                                       : light_black,
// //                                   fontSize: 18.sp,
// //                                 ),
// //                               ),
// //                       ),
// //                     ),

// //                     isPayment == true
// //                         ? RoundedButton(
// //                             press: () => _buyCoins(_selectedPackage, context),
// //                             text: "Purchase",
// //                             color: unActive_button_silver_color,
// //                             textColor: light_black,
// //                             width: 314.w)
// //                         : Center(
// //                             child: buildCircularProgressIndicator(),
// //                           ),

// //                     SizedBox(
// //                       height: 18.h,
// //                     ),

// //                     RoundedButton(
// //                         text: "Become premium",
// //                         color: blue,
// //                         textColor: Colors.white,
// //                         width: 314.w),

// //                     SizedBox(
// //                       height: 50.h,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _coinTile(
// //       {bool isSelected = false,
// //       double? coins,
// //       Widget? price,
// //       required bool haveBorder,
// //       required String iconPath,
// //       required VoidCallback onTap}) {
// //     return InkWell(
// //       onTap: onTap,
// //       child: Container(
// //         padding: EdgeInsets.only(top: 20, bottom: 16, left: 18, right: 18),
// //         decoration: BoxDecoration(
// //           color: isSelected
// //               ? light_red_color.withOpacity(0.3)
// //               : Colors.transparent,
// //           border: isSelected
// //               ? Border.all(color: Colors.transparent)
// //               : Border(
// //                   bottom: BorderSide(
// //                       color: haveBorder
// //                           ? light_black.withOpacity(0.4)
// //                           : Colors.transparent)),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             isSelected
// //                 ? Padding(
// //                     padding: EdgeInsets.only(left: 28.w),
// //                     child: Text(
// //                       "Best Choice",
// //                       style: kufamTextStyle.copyWith(
// //                         color: light_red_color,
// //                         fontSize: 14.sp,
// //                         height: 1.5,
// //                       ),
// //                     ),
// //                   )
// //                 : Container(),
// //             Row(
// //               children: [
// //                 ImageContainer(
// //                   width: 17.w,
// //                   height: 14.w,
// //                   assets: iconPath,
// //                   radius: 0.r,
// //                 ),
// //                 SizedBox(
// //                   width: 11.w,
// //                 ),
// //                 Text(
// //                   "${coins!} Coins",
// //                   style: kufamTextStyle.copyWith(
// //                     fontWeight: FontWeight.w500,
// //                     color: isSelected ? light_red_color : light_black,
// //                     fontSize: 18.sp,
// //                   ),
// //                 ),
// //                 Spacer(),
// //                 price!,
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _buyCoins(double buyCoin, context) async {
// //     _updateState(false);
// //     if (buyCoin != 0) {
// //       String coin = '''
// //        mutation{
// //        buyCoins(coins:${buyCoin.toInt()}, description:"Test purchase")
// //        }
// //        ''';
// //       print(coin);
// //       try {
// //         GraphQlClass graphQlClass = GraphQlClass();
// //         GraphQLClient graphQLClient = graphQlClass.clientToQuery();
// //         QueryResult result =
// //             await graphQLClient.query(QueryOptions(document: gql(coin)));
// //         _updateState(true);
// //         if (result.data != null) {
// //           showMessageSuccess(result.data!["buyCoins"]);
// //           AppRoutes.pop(context);
// //         } else
// //           showMessageError(result.data!["buyCoins"]);
// //       } catch (e, s) {
// //         print("Exception $e");
// //         print(s);
// //       }
// //     } else {
// //       showMessageError("Please Select Package");
// //     }
// //   }
// // }
