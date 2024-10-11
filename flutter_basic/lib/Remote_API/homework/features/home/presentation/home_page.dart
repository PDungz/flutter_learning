import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic/Remote_API/homework/core/apis/dio_client.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/data/repositories/movie_repository_impl.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/usecase/global_info_usecases.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/presentation/logic_holders/global_info_bloc/global_info_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/convert_util.dart';
import '../domain/usecase/movie_usecase.dart';
import 'logic_holders/movie_info_bloc/movie_info_bloc.dart';
import 'widgets/header_session.dart';
import 'widgets/movie_item.dart';
import 'widgets/upcoming_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isLogin});
  final bool isLogin;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final dioClient = DioClient();

  final listUpcommingMoviesPoster = [
    "https://i.ebayimg.com/images/g/4v4AAOSwa39fz003/s-l1200.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/k5wse4w0/poster/u/b/a/medium-artistic-movie-poster-thor-marvel-movie-poster-for-room-original-imafzgvb2xt8ptzx.jpeg?q=90&crop=false",
    "https://townsquare.media/site/442/files/2017/10/thor_ragnarok_ver2_xlg1.jpg?w=780&q=75",
    "https://static.wixstatic.com/media/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg/v1/fill/w_540,h_675,al_c,q_85,enc_auto/c0ca52_861cbfbd84344362a233f609406354cd~mv2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GlobalInfoBloc>(
        create: (_) => GlobalInfoBloc(GlobalInfoUsecases(MovieRepositoryImpl(
            remoteDataSource: MovieRemoteDataSourceImpl(dio: dioClient.dio))))
          ..add(GetGlobalInfo()),
        child: BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
          builder: (_, state) {
            if (state is GlobalInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GlobalInfoLoaded) {
              return BlocProvider<MovieInfoBloc>(
                create: (context) => MovieInfoBloc(GetMovies(
                    MovieRepositoryImpl(
                        remoteDataSource:
                            MovieRemoteDataSourceImpl(dio: DioClient().dio))))
                  ..add(LoadMovies()),
                child: Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 120),
                        ),
                        SliverToBoxAdapter(
                          child: UpcomingSection(
                            listUpcommingMoviesPoster:
                                listUpcommingMoviesPoster,
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
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, right: 16),
                          sliver: BlocBuilder<MovieInfoBloc, MoviesState>(
                            builder: (context, state) {
                              if (state is MoviesLoading) {
                                return const SliverToBoxAdapter(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (state is MoviesLoaded) {
                                final movies = state.movies;
                                return BlocBuilder<GlobalInfoBloc,
                                    GlobalInfoState>(
                                  builder: (context, state) {
                                    if (state is GlobalInfoLoaded) {
                                      final imageConfigInfo =
                                          state.imageConfigInfo;
                                      return SliverGrid.builder(
                                          itemCount: movies.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 163 / 282,
                                          ),
                                          itemBuilder: (_, index) {
                                            final genreTextsList =
                                                convertGenreIdsToGenreStrings(
                                                    movies[index].genreIds,
                                                    state.genreList!);
                                            final selectedGenreTexts =
                                                genreTextsList
                                                    .map((e) => e.name)
                                                    .toList();
                                            return MovieItem(
                                              posterImgPath:
                                                  imageConfigInfo!.baseUrl +
                                                      imageConfigInfo
                                                          .getPosterSizeText(
                                                              "w342") +
                                                      movies[index].posterPath,
                                              title: movies[index].title,
                                              genre:
                                                  selectedGenreTexts.join(", "),
                                              score: movies[index].voteAverage,
                                            );
                                          });
                                    }
                                    return const SliverToBoxAdapter(
                                      child: Center(
                                        child:
                                            Text("Error occurred. Check again"),
                                      ),
                                    );
                                  },
                                );
                              }
                              return const SliverToBoxAdapter(
                                child: Center(
                                  child: Text("Error occurred. Check again"),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
            return Container(
              color: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
