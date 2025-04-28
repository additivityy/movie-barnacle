import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/presentation/widgets/rating.dart';
import 'package:flutter_application_1/presentation/widgets/cast_list.dart';
import 'package:flutter_application_1/presentation/widgets/genre_list.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movieModel;
  const MovieDetails({super.key, required this.movieModel});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ), // Optional rounded corners
                  ),
                  child: widget.movieModel.thumbnail == null
                      ? const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 50,
                          ),
                        )
                      : Image.network(
                          widget.movieModel.thumbnail!,
                          fit: BoxFit.fitHeight,
                        ),
                ),
                const Positioned(bottom: 30, right: 0, child: MovieRatingWidget()),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieModel.title ?? '...',
                    style: const TextStyle(
                      color: Color(0xFF20224D),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (widget.movieModel.genres?.isNotEmpty == true) GenreList(genres: widget.movieModel.genres ?? []),
                  const SizedBox(height: 8),
                  const Text(
                    'Plot Summary',
                    style: TextStyle(
                      color: Color(0xFF20224D),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.movieModel.extract ?? '...',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Cast and Crew',
                    style: TextStyle(
                      color: Color(0xFF20224D),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  widget.movieModel.cast?.isNotEmpty == true
                      ? CastList(
                          castList: widget.movieModel.cast ?? [],
                        )
                      : const Text(
                          '...',
                          style: TextStyle(
                            color: Color(0xFF20224D),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
