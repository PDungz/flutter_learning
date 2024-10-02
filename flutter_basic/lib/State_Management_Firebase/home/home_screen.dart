// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management_Firebase/home/widgets/header_section.dart';
import 'package:flutter_basic/State_Management_Firebase/home/widgets/movie_item.dart';
import 'package:flutter_basic/State_Management_Firebase/home/widgets/upcoming_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listUpcommingMoviesPoster = [
    "https://i.ebayimg.com/images/g/4v4AAOSwa39fz003/s-l1200.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/k5wse4w0/poster/u/b/a/medium-artistic-movie-poster-thor-marvel-movie-poster-for-room-original-imafzgvb2xt8ptzx.jpeg?q=90&crop=false",
    "https://townsquare.media/site/442/files/2017/10/thor_ragnarok_ver2_xlg1.jpg?w=780&q=75",
    "https://static.wixstatic.com/media/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg/v1/fill/w_540,h_675,al_c,q_85,enc_auto/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg"
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderSection(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: UpcomingSection(
                    listUpcommingMoviesPoster: listUpcommingMoviesPoster,
                    setStateFunc: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: listUpcommingMoviesPoster.length,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xffFF8036),
                          expansionFactor: 2.5,
                          spacing: 6,
                          dotHeight: 8,
                          dotColor: Color(0xff637394),
                          dotWidth: 8),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Now in cinemas",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xff637394),
                          size: 28,
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  sliver: SliverGrid.builder(
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 163 / 278,
                    ),
                    itemBuilder: (_, index) => const MovieItem(
                      posterImgPath:
                          "https://rukminim2.flixcart.com/image/850/1000/k5wse4w0/poster/u/b/a/medium-artistic-movie-poster-thor-marvel-movie-poster-for-room-original-imafzgvb2xt8ptzx.jpeg?q=90&crop=false",
                      title: "Thor",
                      genre: "Action",
                      score: 8.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
