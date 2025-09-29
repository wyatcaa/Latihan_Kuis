import 'package:flutter/material.dart';
import 'package:latkuis_124230037/models/movie_data.dart';
import 'package:latkuis_124230037/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFE7F2D),
        title: Text(
          "Movie List",
          style: const TextStyle(
            color: Color(0xFF233D4D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //ni buat jumlah kolom
            crossAxisSpacing: 10, //jarak atas bawah
            mainAxisSpacing: 10, //jarak samping
            childAspectRatio: 0.65, //rasio
          ),
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return _movieCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _movieCard(BuildContext context, int index) {
    final movie = movieList[index];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(index: index),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //buat mulai text
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  movie.imgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF233D4D),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "⭐ ${movie.rating}",
                    style: const TextStyle(
                      color: Color(0xFF233D4D),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
