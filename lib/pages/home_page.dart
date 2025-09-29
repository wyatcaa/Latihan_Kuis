import 'package:flutter/material.dart';
import 'package:latkuis_124230037/models/movie_data.dart';
import 'package:latkuis_124230037/pages/detail_page.dart';
import 'package:latkuis_124230037/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: const Color(0xFFFE7F2D),
  //       title: Text(
  //         "Movie List",
  //         style: const TextStyle(
  //           color: Color(0xFF233D4D),
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
//aktifin yang atas buat yg tanpa sorted


//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, //ni buat jumlah kolom
//             crossAxisSpacing: 10, //jarak atas bawah
//             mainAxisSpacing: 10, //jarak samping
//             childAspectRatio: 0.65, //rasio
//           ),
//           itemCount: movieList.length,
//           itemBuilder: (context, index) {
//             return _movieCard(context, index);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _movieCard(BuildContext context, int index) {
//     final movie = movieList[index];
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailPage(index: index),
//           ),
//         );
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         elevation: 5,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, //buat mulai text
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(20),
//                 ),
//                 child: Image.network(
//                   movie.imgUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     movie.title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF233D4D),
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "⭐ ${movie.rating}",
//                     style: const TextStyle(
//                       color: Color(0xFF233D4D),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//listview

    // body: ListView.builder(
    //         itemCount: movieList.length,
    //         itemBuilder: (context, index) {
    //           return _movieCard(context, index);
    //         },
    //       ),
    //     );
    //   }

    //   Widget _movieCard(BuildContext context, int index) {
    //     final movie = movieList[index];
    //     return InkWell(
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => DetailPage(index: index),
    //           ),
    //         );
    //       },
    //       child: Card(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    //         elevation: 5,
    //         child: Row(
    //           children: [
    //             ClipRRect(
    //               borderRadius: const BorderRadius.horizontal(
    //                 left: Radius.circular(12),
    //               ),
    //               child: Image.network(
    //                 movie.imgUrl,
    //                 fit: BoxFit.cover,
    //                 width: 100,
    //                 height: 140,
    //               ),
    //             ),

    //             Expanded(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(12.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       movie.title,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 18,
    //                         color: Color(0xFF233D4D),
    //                       ),
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     const SizedBox(height: 8),

    //                     // Rating
    //                     Row(
    //                       children: [
    //                         const Icon(Icons.star,
    //                             size: 18, color: Colors.amber),
    //                         const SizedBox(width: 4),
    //                         Text(
    //                           movie.rating.toString(),
    //                           style: const TextStyle(
    //                             fontSize: 15,
    //                             color: Color(0xFF233D4D),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   }
    // }


    // sorted

  Widget build(BuildContext context) {
    final sortedMovies = List.from(movieList)
      ..sort((a, b) => b.rating.compareTo(a.rating));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFE7F2D),
        title: const Text(
          "Movie List",
          style: TextStyle(
            color: Color(0xFF233D4D),
            fontWeight: FontWeight.bold,
          ),
        ),
         actions: [
          IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context){
                  return LoginPage();
                }),
                (route)=> false);
            },
            icon: Icon(Icons.logout_outlined, 
              color: const Color(0xFF233D4D),)),
          
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sortedMovies.length,
        itemBuilder: (context, index) {
          final movie = sortedMovies[index];
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
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                  
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.imgUrl,
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF233D4D),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "⭐ ${movie.rating}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF233D4D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}