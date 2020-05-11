import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediapp/screens/detail_screen.dart';
import 'package:mediapp/utils/const.dart';
import 'package:mediapp/widgets/custom_clipper.dart';

class ProgressVertical extends StatelessWidget {
  final int value;
  final String date;
  final bool isShowDate;

  ProgressVertical(
      {Key key,
        @required this.value,
        @required this.date,
        @required this.isShowDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      width: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 10,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                shape: BoxShape.rectangle,
                color: Constants.lightGreen,
              ),
              child: new LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          child: Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                shape: BoxShape.rectangle,
                                color: Constants.darkGreen,
                              ),
                              height: constraints.maxHeight * (value / 100),
                              width: constraints.maxWidth,
                          ),
                        ),
                      ],
                    );
                  }
                  ),
            ),
          ),
          SizedBox(height: 10),
          Text( (isShowDate) ? date : ""),
        ],
      )
    );
  }
}
