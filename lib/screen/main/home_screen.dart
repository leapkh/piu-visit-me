import 'package:flutter/material.dart';
import 'package:visit_me/model/home_data.dart';
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

    return const Text('TODO');
  }
}
