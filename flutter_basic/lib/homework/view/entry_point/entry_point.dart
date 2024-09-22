import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic/homework/view/about/about.dart';
import 'package:flutter_basic/homework/view/session/sessions.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // Define the color with 70% opacity
    Color appBarAndContainerColor = const Color(0xFF1F293D);
    Color tabWordColor = const Color(0xFF637394);
    Color tabWordClickColor = const Color(0xFFFF8036);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndContainerColor, // Use the same color here
        elevation: 0, // Remove shadow under the AppBar
        leading: IconButton(
            onPressed: () => Navigator.pop(
                  context,
                ),
            icon: Icon(Icons.arrow_back_ios, color: tabWordColor)),
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 56),
          child: const Text(
            'Peaky Blinders',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: tabWordClickColor, // Tab underline color
          labelColor: tabWordClickColor, // Selected tab text color
          unselectedLabelColor: tabWordColor,
          dividerColor: tabWordColor, // Unselected tab text color
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Sessions',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: appBarAndContainerColor, // Use the same color for the Container
        child: TabBarView(
          controller: _tabController,
          children: const [About(), Sessions()],
        ),
      ),
    );
  }
}
