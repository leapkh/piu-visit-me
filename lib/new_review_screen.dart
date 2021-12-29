import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewReviewScreen extends StatefulWidget {
  final String placeName;
  NewReviewScreen(this.placeName);

  @override
  _NewReviewScreenState createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
  double ratingValue = 0;
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: reviewScreenBody,
    );
  }

  Widget get reviewScreenBody {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add a review for ' + widget.placeName,
              textAlign: TextAlign.start,
            ),
          ),
          ratingBar,
          TextField(
            controller: feedbackController,
          ),
          submitButton
        ],
      ),
    );
  }

// Create a rating bar
  Widget get ratingBar {
    return RatingBar.builder(
      initialRating: ratingValue,
      itemBuilder: (_, __) {
        return Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      onRatingUpdate: (value) {
        ratingValue = value;
      },
    );
  }

  Widget get submitButton {
    return Center(
      child: ElevatedButton(
        onPressed: onSubmitButtonClick,
        child: Text('Submit'),
      ),
    );
  }

  void onSubmitButtonClick() {
    String feedback = feedbackController.text;
    final ratingData = {
      'rating': ratingValue,
      'feedback': feedback,
    };
    Navigator.pop(context, ratingData);
  }
}
