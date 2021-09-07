import 'package:flutter/material.dart';
import 'package:girafee/Widgets/custom_dialogue.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/routes.dart';
import 'package:numberpicker/numberpicker.dart';

class SpecialPromotion extends StatefulWidget {
  const SpecialPromotion({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _SpecialPromotionState createState() => _SpecialPromotionState();
}

class _SpecialPromotionState extends State<SpecialPromotion> {
  int _currentIntValue = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.yellowColor,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 19),
                  child: Row(
                    children: <Widget>[Text('Limited Promotion')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 12,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: widget.width * 0.8,
                        height: 104,
                        child: TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: "Maximum 128 characters",
                              hintStyle: TextStyle(
                                  color: AppColors.greyLocationIconColor),
                              //filled: true,
                              fillColor: AppColors.greyLocationIconColor,
                              hoverColor: AppColors.greyLocationIconColor,
                              focusColor: AppColors.greyLocationIconColor,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Duration(days):',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.greyLocationIconColor),
                      ),
                      Text(
                        '$_currentIntValue',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greenColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\n\$ $_currentIntValue',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.blackTextColor,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: widget.height / 4.4,
                  decoration: BoxDecoration(gradient: AppColors.timebackground),
                  child: NumberPicker(
                    value: _currentIntValue,
                    minValue: 0,
                    maxValue: 10,
                    axis: Axis.horizontal,
                    step: 1,
                    haptics: true,
                    onChanged: (value) =>
                        setState(() => _currentIntValue = value),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AppRoutes.pop(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _permissionDialogue(context);
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Purchase',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'PROMOTION',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _permissionDialogue(context) {
    return CustomDialogue(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    'The cost for your',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'SPECIAL PROMOTION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 1.2, fontSize: 16),
                  ),
                  Text(
                    'will be charged to you using\nyour preferred payment\nmethod.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  AppRoutes.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _successDialogue(context);
                      });
                },
                child: Text('I Accept'),
              ),
            ),
          ],
        ),
        height: widget.height);
  }

  _successDialogue(context) {
    return CustomDialogue(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Text(
              'SUCCESS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Your ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'SPECIAL PROMOTION',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                    text: '\n',
                    style: TextStyle(height: 1.2, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'has been Activated!',
                    style: TextStyle(height: 1.2, color: Colors.black),
                  )
                ])),
            Text(
              '\n\nEnd date: MM/DD/YYYY',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.yellowColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  AppRoutes.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _failDialogue(context);
                      });
                },
                child: Text('Ok'),
              ),
            ),
          ],
        ),
        height: widget.height);
  }

  _failDialogue(context) {
    return CustomDialogue(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Text(
              'OOPS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.redColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\nSomething went wrong...',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
                fontSize: 14,
              ),
            ),
            Text(
              '\nPlease verify your payment method\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
                fontSize: 14,
              ),
            ),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.redColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {},
                child: Text('Go check'),
              ),
            ),
          ],
        ),
        height: widget.height);
  }
}
