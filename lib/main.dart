import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:visit_me/place_detail_screen.dart';

void main() {
  // Create an application
  Widget app = MaterialApp(
    title: 'Visit Me',
    home: PlaceDetailScreen(),
    debugShowCheckedModeBanner: false,
  );

  // Run the app
  runApp(app);
}

Widget get accountScreen {
  return Scaffold(
    body: accountScreenBody,
    bottomNavigationBar: bottomNavigationBar,
  );
}

Widget get accountScreenBody {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topBlock,
        profileName,
        SizedBox(
          height: 32,
        ),
        sectionTitleWidget('Preferences'),
        preferenceWrap,
        SizedBox(
          height: 32,
        ),
        sectionTitleWidget('Favorites'),
        favoritePalcesListView
      ],
    ),
  );
}

Widget get profileName {
  return Center(child: Text('Sok Sao'));
}

Widget get bottomNavigationBar {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Provinces'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Account'),
      BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: 3,
  );
}

Widget get topBlock {
  return SizedBox(
    height: 240,
    child: Stack(
      children: [
        coverImage,
        profileImage,
        editIconButton,
      ],
    ),
  );
}

Widget get coverImage {
  return Positioned.fill(
      child: Padding(
    padding: const EdgeInsets.only(bottom: 60),
    child: Image.asset(
      'lib/images/royal-palace.jpg',
      fit: BoxFit.cover,
    ),
  ));
}

Widget get profileImage {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.asset(
          'lib/images/central-market.jpg',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget get editIconButton {
  return Positioned(
    child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
    right: 0,
    bottom: 16,
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

Widget get preferenceWrap {
  return Wrap(
    children: [
      preferenceItem('Natural'),
      preferenceItem('Temple'),
      preferenceItem('Mountain & Waterfall'),
      preferenceItem('Sea & River'),
    ],
  );
}

Widget preferenceItem(String preference) {
  return Padding(
    padding: EdgeInsets.all(4),
    child: Chip(
      label: Text(preference),
    ),
  );
}

Widget get favoritePalcesListView {
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
