import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primaryTextColor),
                strokeWidth: 2,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Loading',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
