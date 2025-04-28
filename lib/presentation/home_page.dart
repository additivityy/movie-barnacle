import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/movies_bloc.dart';
import 'package:flutter_application_1/presentation/widgets/category_list.dart';
import 'package:flutter_application_1/presentation/details_page.dart';
import 'package:flutter_application_1/presentation/widgets/genre_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF20224D), size: 40),
          onPressed: () {
            // TODO: Handle menu button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF20224D), size: 40),
            onPressed: () {
              // TODO: Handle search button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24.0),
        child: Column(
          children: [
            const CategoryList(categories: ['In Theatre', 'Box Office', 'Coming Soon']),
            const GenreList(genres: ['Action', 'Crime', 'Comedy', 'Drama', 'Horror']),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
                if (state is MoviesInitial) {
                  BlocProvider.of<MoviesBloc>(context).add(MoviesInitialEvent());
                }
                if (state is MoviesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MoviesIFetched) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetails(movieModel: state.movieList[index]),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ListTile(
                            title: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.blue, Colors.purple],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: state.movieList[index].thumbnail == null
                                  ? const Center(
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        state.movieList[index].thumbnail!,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                            ),
                            subtitle: Text(
                              state.movieList[index].title ?? ' ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Color(0xFF20224D),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
