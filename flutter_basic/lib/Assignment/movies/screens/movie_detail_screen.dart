import 'package:flutter/material.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/about_content.dart';
import 'package:flutter_basic/Assignment/movies/screens/movie_detail/widgets/sessions_content.dart';
import 'package:flutter_basic/Assignment/movies/theme/my_theme.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.darkTheme(),
      home: const MovieDetailScreen(),
    );
  }
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
