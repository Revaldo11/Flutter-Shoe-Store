import 'package:flutter/material.dart';

import '../theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  whiteColor,
                ),
                strokeWidth: 2,
              ),
              width: 16,
              height: 16,
            ),
            Text(
              "Loading...",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
