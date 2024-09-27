import 'package:flutter/material.dart';
import 'package:flutter_basic/Practice_UI/screems/view/home/widgets/header_session.dart';
import 'package:flutter_basic/Practice_UI/screems/view/home/widgets/movie_item.dart';
import 'package:flutter_basic/Practice_UI/screems/view/home/widgets/upcoming_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isLogin});
  final bool isLogin;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final listUpcommingMoviesPoster = [
    "https://i.ebayimg.com/images/g/4v4AAOSwa39fz003/s-l1200.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/k5wse4w0/poster/u/b/a/medium-artistic-movie-poster-thor-marvel-movie-poster-for-room-original-imafzgvb2xt8ptzx.jpeg?q=90&crop=false",
    "https://townsquare.media/site/442/files/2017/10/thor_ragnarok_ver2_xlg1.jpg?w=780&q=75",
    "https://static.wixstatic.com/media/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg/v1/fill/w_540,h_675,al_c,q_85,enc_auto/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
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
                      dotWidth: 8,
                    ),
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
                          color: Colors.white,
                        ),
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
                padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                sliver: SliverGrid.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 163 / 278,
                  ),
                  itemBuilder: (_, index) => MovieItem(
                    posterImgPath: listUpcommingMoviesPoster[index],
                    title: "Movie $index",
                    genre: "Action",
                    score: 8.2,
                  ),
                ),
              ),
            ],
          ),
          // HeaderSession nằm trên cùng nhưng bán trong suốt
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderSession(
              isLogin: widget.isLogin,
            ),
          ),
        ],
      ),
    );
  }
}
