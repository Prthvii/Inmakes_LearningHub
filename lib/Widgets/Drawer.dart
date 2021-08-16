import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: SafeArea(
        child: SizedBox(
          child: Drawer(
            elevation: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Stack(children: [
                  Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    runSpacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _createDrawerItem(
                          iccon: Icons.credit_card,
                          text: "My Cards",
                          onTap: () {}),
                      _createDrawerItem(
                          iccon: Icons.bar_chart, text: "Budget", onTap: () {}),
                      _createDrawerItem(
                          iccon: Icons.swap_horiz_outlined,
                          text: "Saving",
                          onTap: () {}),
                      _createDrawerItem(
                          iccon: Icons.swap_horiz_outlined,
                          text: "Transfer",
                          onTap: () {}),
                    ],
                  ),
                  Align(
                      child: _createDrawerItem(
                          iccon: Icons.logout, text: "SignOut", onTap: () {}),
                      alignment: Alignment.bottomLeft)
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {String text, IconData iccon, GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iccon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
