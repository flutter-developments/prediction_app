import 'package:flutter/material.dart';
import 'package:girafee/model/job.dart';
import 'package:girafee/provider/jobs_provider.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:provider/provider.dart';

class JobCancelDialogue extends StatelessWidget {
  final Job job;

  final TextEditingController _cancelReasonController = TextEditingController();

  JobCancelDialogue({required this.job});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 18,
          ),
          height: 440,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 18, right: 19, top: 49),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: width * 0.5,
                      child: Text(
                        '"You are cancelling a booked job. \nPlease complete the "Reason for cancellation" form below to inform your customer.\n Your customer will be permitted to\n rate and review your service"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(),
                      child: TextField(
                        controller: _cancelReasonController,
                        decoration: InputDecoration(
                          hintText: "Reason for cancellation",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyLocationIconColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(
                            'Exit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: [null, ''].contains(_cancelReasonController.text)
                            ? Colors.blueGrey
                            : Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 50,
                      child: InkWell(
                        onTap: [null, ''].contains(_cancelReasonController.text)
                            ? null
                            : () {
                                Provider.of<JobsProvider>(
                                  context,
                                  listen: false,
                                ).cancelJobRequest(
                                  this.job,
                                  cancellationReason:
                                      _cancelReasonController.text,
                                );
                                Navigator.pop(context);
                              },
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
