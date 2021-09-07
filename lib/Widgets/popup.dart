import 'package:flutter/material.dart';
import 'package:girafee/Widgets/button.dart';
import 'package:girafee/model/company.dart';
import 'package:girafee/model/job.dart';
import 'package:girafee/model/location_data.dart';
import 'package:girafee/provider/jobs_provider.dart';
import 'package:girafee/provider/user_provider.dart';
import 'package:girafee/ui/auth/loginPage.dart';
import 'package:girafee/ui/auth/signup_Page.dart';
import 'package:girafee/ui/shared/review/write_review.dart';
import 'package:girafee/ui/user/home/hire.dart';
import 'package:girafee/ui/user/home/home.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/routes.dart';
import 'package:girafee/utils/styles.dart';
import 'package:provider/provider.dart';

class JobRequestAcceptedDialog extends StatelessWidget {
  final Company? company;

  final AdLocationData? adLocationData;

  final Job job;

  const JobRequestAcceptedDialog({
    Key? key,
    required this.company,
    required this.adLocationData,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.red,
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      'CBA PLUMBING INC.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "has been accpeted your booking request:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(height: 15),
                    Container(
                      height: 2,
                      width: 300,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => HireJob(
                            job: this.job,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Track untill arrival',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(height: 10),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.halfWhite,
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      AppRoutes.popUntilHome(context);
                    },
                    child: Text(
                      'Go back to search',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobRequestDeniedDialog extends StatelessWidget {
  final Company? company;

  const JobRequestDeniedDialog({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.red,
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      this.company!.name!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "has denied your booking request:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 2,
                      width: 300,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              Container(height: 10),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.halfWhite,
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      AppRoutes.popUntilHome(context);
                    },
                    child: Text(
                      'Go back to search',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechnicianHasCompletedJobPopup extends StatelessWidget {
  final Company? company;
  final Job job;

  const TechnicianHasCompletedJobPopup({
    required this.company,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.red,
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      this.company!.name!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "has completed your Job",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 2,
                      width: 300,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              Container(height: 10),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.halfWhite,
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: Button(
                    buttonText: "Confirm",
                    buttonColor: AppColors.yellowColor,
                    onTap: () async {
                      await Provider.of<JobsProvider>(context, listen: false)
                          .completeJob(job);

                      Navigator.pop(context);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WriteReview(
                            revieweeID: job.advertiser,
                            revieweeName: job.company!.name,
                          ),
                        ),
                      );
                      AppRoutes.replace(context, HomePage());
                    },
                    buttonTextStyle: TextStyles.buttonFontText,
                    widthPercent: 0.4,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.halfWhite,
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  child: Button(
                    buttonText: "Job isn't done yet",
                    buttonColor: AppColors.greyButtonColor,
                    onTap: () async {
                      await Provider.of<JobsProvider>(context, listen: false)
                          .denyJobCompletion(job);
                      Navigator.pop(context);
                    },
                    buttonTextStyle: TextStyles.buttonFontText,
                    widthPercent: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuestUserLoginOrSignupDialog extends StatelessWidget {
  const GuestUserLoginOrSignupDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Login or Sign up to continue',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "This service is only available to registered users.\nPlease Login or Sign Up to Continue",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: AppColors.halfWhite,
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<UserProvider>().clearUserBox();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 10),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            AppRoutes.replace(
                                context,
                                SignUpPage(
                                  emailController: TextEditingController(),
                                  passwordContrller: TextEditingController(),
                                ));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
