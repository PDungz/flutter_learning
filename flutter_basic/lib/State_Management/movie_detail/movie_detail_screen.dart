import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/movie_detail/widget/about_content.dart';
import 'package:flutter_basic/State_Management/movie_detail/widget/sessions_content.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text(
          "The Batman",
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2,
          tabs: const [
            Tab(
              text: "About",
            ),
            Tab(
              text: "Sessions",
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [AboutContent(), SessionsContent()]),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
}
