import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyContent() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  )),
            )
          ]),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: const [
                ChatTile(),
              ],
            )),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
