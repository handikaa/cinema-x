import '../ticket_page/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../extensions/build_extension_context.dart';
import '../../misc/assets.dart';
import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/bottom_navbar_item.dart';
import '../movie/movie_page.dart';
import '../profile/profile_page.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  PageController controller = PageController();
  int selectedPage = 0;
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    // double maxWidth = MediaQuery.of(context).size.width;
    // double maxHeight = MediaQuery.of(context).size.height;

    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed('login');
          context.showSnackbar('Berhasil Logout', SnackBarType.succes);
        } else if (next is AsyncError) {
          context.showSnackbar(next.error.toString(), SnackBarType.error);
        }
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              Center(child: MoviePage()),
              Center(child: TicketPage()),
              Center(child: ProfilePage()),
            ],
          ),
          BottomNavbar(
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              controller.animateToPage(selectedPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            selectedIndex: 0,
            items: [
              BottomNavbarItem(
                index: 0,
                isSelected: selectedPage == 0,
                title: 'Home',
                image: iconMovie,
                selectedImage: iconMovieSelected,
              ),
              BottomNavbarItem(
                index: 1,
                isSelected: selectedPage == 1,
                title: 'Ticket',
                image: iconTicket,
                selectedImage: iconTicketSelected,
              ),
              BottomNavbarItem(
                index: 2,
                isSelected: selectedPage == 2,
                title: 'Profile',
                image: iconProfile,
                selectedImage: iconProfileSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// inside _MyHomePageState scafold body:

//  final int leftRightRows = 6;
//   final int leftRightColumns = 4;
//   final int middleRows = 4;
//   final int middleColumns = 7;
//   final List<String> seatLetters = [
//     'A',
//     'B',
//     'C',
//     'D',
//     'E',
//     'F',
//     'G',
//     'H',
//     'J',
//     'K',
//     'L',
//     'M',
//     'N'
//   ];

  // body: Padding(
  //       padding: const EdgeInsets.only(top: 100),
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           children: [
  //             _buildSeatRow(leftRightRows, leftRightColumns,
  //                 isMiddle: false, isLeft: true),
  //             const SizedBox(
  //               width: 50,
  //             ),
  //             _buildSeatRow(middleRows, middleColumns, isMiddle: true),
  //             const SizedBox(
  //               width: 50,
  //             ),
  //             _buildSeatRow(leftRightRows, leftRightColumns,
  //                 isMiddle: false, isLeft: false),
  //           ],
  //         ),
  //       ),
  //     ),
  //     bottomNavigationBar: BottomAppBar(
  //       color: Colors.white,
  //       height: 250,
  //       child: Column(
  //         children: [
  //           Container(
  //             decoration: BoxDecoration(
  //               color: Colors.amberAccent,
  //               borderRadius: BorderRadius.circular(100),
  //             ),
  //             height: 20,
  //           ),
  //           const SizedBox(
  //             height: 50,
  //           ),
  //           SizedBox(
  //             height: 80,
  //             child: Column(
  //               children: [
  //                 if (selectedSeats.isNotEmpty)
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       const Text('Kursi : '),
  //                       Row(
  //                         children: List.generate(
  //                           selectedSeats.length,
  //                           (index) {
  //                             return Text(' ${selectedSeats[index]}, ');
  //                           },
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ElevatedButton(
  //                   style: const ButtonStyle(
  //                     backgroundColor: WidgetStatePropertyAll(Colors.cyan),
  //                   ),
  //                   onPressed: () {},
  //                   child: const Text(
  //                     'Booking',
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildSeatRow(
  //   int rows,
  //   int columns, {
  //   bool isMiddle = false,
  //   bool isLeft = false,
  // }) {
  //   List<Widget> seatRows = [];

  //   for (int i = 0; i < rows; i++) {
  //     List<Widget> seatRow = [];
  //     int seatNumber = 1;

  //     // Jika bagian tengah, nomor kursi dimulai setelah kursi kiri
  //     if (isMiddle) seatNumber += leftRightColumns;

  //     // Jika bagian kanan, nomor kursi dimulai setelah kursi tengah
  //     if (!isLeft && !isMiddle) seatNumber += leftRightColumns + middleColumns;

  //     for (int j = 0; j < columns; j++) {
  //       String seatId = '${seatLetters[i]}$seatNumber';
  //       seatRow.add(_buildSeat(seatId));
  //       seatNumber++;
  //     }

  //     seatRows.add(Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: seatRow,
  //     ));
  //   }

  //   return Column(
  //     children: seatRows,
  //   );
  // }

  // Widget _buildSeat(String seatId) {
  //   bool isSelected = selectedSeats.contains(seatId);

  //   return Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           if (isSelected) {
  //             selectedSeats.remove(seatId);
  //           } else {
  //             selectedSeats.add(seatId);
  //           }
  //         });
  //       },
  //       child: Container(
  //         width: 50,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: isSelected ? Colors.green : Colors.grey[300],
  //           borderRadius: BorderRadius.circular(100),
  //         ),
  //         child: Center(
  //           child: Text(
  //             seatId,
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold,
  //               color: isSelected ? Colors.white : Colors.black,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }