import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/PlayerScreen.dart';

class Videostab extends StatefulWidget {
  final array;
  Videostab({
    this.array,
  });

  @override
  _VideostabState createState() => _VideostabState();
}

class _VideostabState extends State<Videostab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
        child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          shrinkWrap: true,
          itemCount: widget.array != null ? widget.array.length : 0,
          itemBuilder: (context, index) {
            final item = widget.array != null ? widget.array[index] : null;

            return VideosList(item, index);
          },
        ),
      ),
    );
  }

  VideosList(var item, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(
                  ContentID: widget.array[0]["contentId"].toString())),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item["coverImage"].toString()),
                          fit: BoxFit.cover)),
                  height: 160,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonGreen,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Text(
                        item["subjectName"].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                item["sectionHeading"].toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: BlckColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.radio_button_checked,
                    color: GreyTxtClr,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "12 Chapters",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: GreyTxtClr),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.radio_button_checked,
                    color: GreyTxtClr,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "124 hours",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: GreyTxtClr),
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
