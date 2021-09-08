import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
 
import 'provider/providermodel.dart';
import 'ui/home_screen.dart';
 
void main() {
  InAppPurchaseConnection.enablePendingPurchases();
 
  runApp(ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: MaterialApp(
        home: MyApp(),
      )));
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    var provider = Provider.of<ProviderModel>(context, listen: false);
    provider.initialize();
    super.initState();
  }
 
  @override
  void dispose() {
    var provider = Provider.of<ProviderModel>(context, listen: false);
    provider.subscription.cancel();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}