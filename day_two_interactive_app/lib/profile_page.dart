import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Ini Snack Bar"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text("SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                    );
                  },
                );
              },
              child: Text("Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return Container(
                          width: .infinity,
                          child: Column(children: [Text("Ini Bottom Sheet")]),
                        );
                      },
                    );
                  },
                );
              },
              child: Text("Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}
