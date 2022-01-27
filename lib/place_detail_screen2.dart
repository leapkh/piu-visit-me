import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:visit_me/model/place.dart';
import 'package:visit_me/model/review.dart';
import 'package:visit_me/new_review_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;

  PlaceDetailScreen(this.place);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PlaceDetailScreen> {
  String _currentMenuItem = 'About';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: placeDetailScreenBody,
    );
  }

  // Create PlaceDetailScreen body
  Widget get placeDetailScreenBody {
    List<Widget> columnChildren = [
      placeDetailTopBlock,
      placeDetailMenu,
      Divider(),
    ];

    if (_currentMenuItem == 'About') {
      columnChildren.addAll(aboutSectionWidgets);
    } else if (_currentMenuItem == 'Photos') {
      columnChildren.add(photosSectionWidget);
    } else {
      columnChildren.add(reviewsSectionWidget);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }

  Widget get loadingWidget => Center(child: CircularProgressIndicator());

  Widget get errorWidget => Center(
        child: Text('Server error. Please try again later.'),
      );

  Widget get successWidget {
    List<Widget> columnChildren = [
      placeDetailTopBlock,
      placeDetailMenu,
      Divider(),
    ];

    if (_currentMenuItem == 'About') {
      columnChildren.addAll(aboutSectionWidgets);
    } else if (_currentMenuItem == 'Photos') {
      columnChildren.add(photosSectionWidget);
    } else {
      columnChildren.add(reviewsSectionWidget);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
  }

  List<Widget> get aboutSectionWidgets => [
        sectionTitleWidget(widget.place.name),
        ratingAndReviews,
        iconAndTextRow(Icons.info, widget.place.description),
        iconAndTextRow(Icons.place, widget.place.address),
        sectionTitleWidget('Related Palces'),
        relatedPalcesListView,
      ];

  Widget get photosSectionWidget => Text('This is Photos section.');

  Widget get reviewsSectionWidget {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
          onPressed: onAddReviewClick, child: Text('Add Your Review')),
    );
  }

  Widget sectionTitleWidget(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget iconAndTextRow(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: Colors.green),
          SizedBox(
            width: 16,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }

// Create top block of the PlaceDetailScreen
  Widget get placeDetailTopBlock {
    return Stack(
      children: [
        Image.network(widget.place.imageUrls.first),
        placeDetailTopBar
      ],
    );
  }

// Create menu of the PlaceDetailScreen
  Widget get placeDetailMenu {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        placeMenuItem('About'),
        placeMenuItem('Photos'),
        placeMenuItem('Reviews'),
      ],
    );
  }

  void onMenuItemClick(String title) {
    setState(() {
      _currentMenuItem = title;
    });
  }

// Create place menu item
  Widget placeMenuItem(String title) {
    bool active = title == _currentMenuItem;
    return GestureDetector(
      onTap: () => onMenuItemClick(title),
      child: Container(
        child: Text(
          title,
          style: TextStyle(color: active ? Colors.green : Colors.white),
        ),
        height: 32,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.green,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

// Create top bar of the PlaceDetailScreen
  Widget get placeDetailTopBar {
    Widget row = Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ))
      ],
    );

    return Container(
      child: row,
      color: Colors.white.withAlpha(70),
      padding: EdgeInsets.all(4),
    );
  }

// Create NewReviewScreen
  Widget get newReviewScreen {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: reviewScreenBody,
    );
  }

// Create body of NewReviewScreen
  Widget get reviewScreenBody {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add a review for Royal Palace.',
              textAlign: TextAlign.start,
            ),
          ),
          ratingBar,
          TextField(),
          submitButton
        ],
      ),
    );
  }

// Create a rating bar
  Widget get ratingBar {
    return Row(
      children: [
        Icon(Icons.star_outline_outlined),
        Icon(Icons.star_outline_outlined),
        Icon(Icons.star_outline_outlined),
        Icon(Icons.star_outline_outlined),
        Icon(Icons.star_outline_outlined),
      ],
    );
  }

// Create submit button
// Widget get submitButton {
//   return ElevatedButton(
//     onPressed: () {
//       print('You click me.');
//     },
//     child: Text('Submit'),
//   );
// }
  Widget get submitButton {
    return Center(
      child: ElevatedButton(
        onPressed: onSubmitButtonClick,
        child: Text('Submit'),
      ),
    );
  }

  void onSubmitButtonClick() {
    print('You click me.');
  }

  Widget get relatedPalcesListView {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          placeItem('lib/images/national-museum.jpg',
              'National Museum sldkjf slfkj slkfj sdjk sdf s'),
          placeItem('lib/images/central-market.jpg', 'Central Market'),
          placeItem('lib/images/national-museum.jpg', 'National Museum'),
          placeItem('lib/images/central-market.jpg', 'Central Market'),
          placeItem('lib/images/national-museum.jpg', 'National Museum'),
          placeItem('lib/images/central-market.jpg', 'Central Market'),
        ],
      ),
    );
  }

  Widget placeItem(String imagePath, String placeName) {
    Widget image = ClipRRect(
      child: Image.asset(imagePath),
      borderRadius: BorderRadius.circular(4),
    );
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: image),
          Text(
            placeName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget get ratingAndReviews {
    Widget ratingBar = RatingBar.builder(
      itemBuilder: ratingBarBuilder,
      onRatingUpdate: (_) {},
      itemSize: 16,
      initialRating: 4.5,
      allowHalfRating: true,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ratingBar,
          SizedBox(
            width: 4,
          ),
          Text('7k reviews'),
        ],
      ),
    );
  }

  Widget ratingBarBuilder(BuildContext _, int __) {
    return Icon(
      Icons.star_outline,
      color: Colors.amber,
    );
  }

  Future<Place> _loadPlaceInfo() async {
    await Future.delayed(Duration(seconds: 2));
    //throw Exception();
    return Place(1, 'Royal Palace', 'This is Royal Palace.',
        ['http://somedomain.com/royal-palace.jpg'], 'Phnom Penh');
  }

  // Listeners
  void onAddReviewClick() async {
    // *** Using push()
    final placeName = 'Royal Palace';
    final route =
        MaterialPageRoute<Review>(builder: (_) => NewReviewScreen(placeName));
    final review = await Navigator.push(context, route);
    if (review != null) {
      print('${review.reviewer}-${review.comment}');
    }
    // *** Using pushName()
    //Navigator.pushNamed(context, '/NewReviewScreen');
  }
}
