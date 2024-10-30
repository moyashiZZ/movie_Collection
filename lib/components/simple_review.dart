import 'package:flutter/material.dart';
import 'package:movie_collection/model/review.dart';
import 'package:movie_collection/page/review_detail.dart';
import 'package:movie_collection/util.dart';

class SimpleReview extends StatefulWidget {
  const SimpleReview({super.key, required this.review});

  final Review review;
  @override
  State<StatefulWidget> createState() => _SimpleReviewState();
}

class _SimpleReviewState extends State<SimpleReview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewDetail(
              review: widget.review,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.1,
              blurRadius: 1,
              offset: Offset(
                4,
                4,
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    widget.review.name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  softWrap: true,
                  widget.review.title,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Util.formatDateTime(
                      dateTime: Util.timestampToDateTime(
                        timestamp: widget.review.dateTime,
                      ),
                    ),
                  ),
                  Text(widget.review.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
