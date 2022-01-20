import 'package:flutter/material.dart';
import 'package:visit_me/model/home_data.dart';
import 'package:visit_me/model/place.dart';
import 'package:visit_me/provider/data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeData? homeData;
  bool isError = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    DataProvider.loadHomeData().then((value) {
      setState(() {
        homeData = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Error while loading data. Please try again later.'),
      );
    }

    return bodyContentWidget;
  }

  Widget get bodyContentWidget {
    return Column(
      children: [
        Expanded(child: slideShowWidget, flex: 4,),
        Expanded(child: nearMeWidget, flex: 3,),
        Expanded(child: topPlacesWidget, flex: 3,),
      ],
    );
  }

  Widget get slideShowWidget {
    return Text('TODO');
  }
  Widget get nearMeWidget {
    return  Column(
      children: [
        sectionTitleWidget('Near Me'),
        Expanded(child: placeListWidget(homeData!.nearMePlaces))
      ],
    );
  }
  Widget get topPlacesWidget {
    return  Column(
      children: [
        sectionTitleWidget('Top Places'),
        Expanded(child: placeListWidget(homeData!.topPlaces))
      ],
    );
  }

  Widget sectionTitleWidget(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18),),
          const Text('More')
        ],
      ),
    );
  }

  Widget placeListWidget(List<Place> places){
    return ListView.builder(padding: const EdgeInsets.all(8), scrollDirection: Axis.horizontal, itemCount: places.length,  itemBuilder: (context, index){
      return placeItemWidget(places[index]);
    });
  }

  Widget placeItemWidget(Place place){
    return Column(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(child: Image.network(place.imageUrls.first, width: 200, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(8),),
        )),
        Text(place.name)
      ],
    );
  }

}
