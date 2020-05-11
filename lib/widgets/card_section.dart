import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediapp/utils/const.dart';
import 'package:mediapp/widgets/custom_clipper.dart';

class CardSection extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String time;
  final ImageProvider image;
  final bool isDone;

  CardSection(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.unit,
      @required this.time,
      @required this.image,
      this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(right: 15.0),
            width: 240,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                    child: ClipPath(
                        clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Constants.lightBlue.withOpacity(0.1),
                          ),
                          height: 120,
                          width: 120,
                        ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: image,
                            width: 24,
                            height: 24,
                            color: Theme.of(context).accentColor,
                          ),
                          Text(
                              time,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Constants.textPrimary
                              ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.textPrimary
                                    ),
                                ),
                                SizedBox(height: 5),
                                Text('$value $unit',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Constants.textPrimary
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: isDone ? Theme.of(context).accentColor : Color(0xFFF0F4F8),
                              ),
                              width: 44,
                              height: 44,
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: isDone ? Colors.white : Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            onTap: () {
                              debugPrint("Button clicked. Handle button setState");
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
    );
  }
}
