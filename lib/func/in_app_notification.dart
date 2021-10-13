import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class InAppNotification extends StatelessWidget {
  const InAppNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'InAppNotification',
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showSimpleNotification(
                Text("Subscribe to FilledStacks"),
                background: Colors.purple,
                autoDismiss: false,
                trailing: Builder(builder: (context) {
                  return FlatButton(
                      textColor: Colors.yellow,
                      onPressed: () {
                        OverlaySupportEntry.of(context)!.dismiss();
                      },
                      child: Text('Dismiss'));
                }),
              );
            },
          ),
        ),
      )
    );
  }



}