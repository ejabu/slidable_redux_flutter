import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({
    Key key,
    this.onCategorySelected,
    this.categories,
  }) : super(key: key);

  final Function onCategorySelected;
  final List categories;

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  final tabBarKey = new GlobalKey<_MyTabbedPageState>();

  Function _onCategorySelected;
  final searchInput = TextEditingController();

  TabController _tabController;
  final List categories = [
    "Category A",
    "Category B",
    "Category C",
    "Category D",
    "Category E",
    "Category F",
  ];

  List<Tab> myTabs;
  @override
  void initState() {
    super.initState();

    _onCategorySelected = widget.onCategorySelected;
    _tabController = TabController(
      vsync: this,
      length: 30,
    );
    VoidCallback onChanged = () {
      _onCategorySelected(categories[this._tabController.index]);
    };

    _tabController.addListener(onChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchInput.dispose();

    super.dispose();
  }

  List<Widget> _buildTabs() {
    return List.generate(categories.length, (index) {
      return Tab(
        text: categories[index].toUpperCase(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      key: tabBarKey,
      isScrollable: true,
      controller: _tabController,
      tabs: _buildTabs(),
      labelColor: Colors.blue,
    );
  }
}
