import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/movie_detail.dart';
import '../../../domain/transaction.dart';
import '../../extensions/build_extension_context.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../widgets/back_navigation_bar.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import 'method/screen_widget.dart';
import 'method/seat_status_information.dart';

// class SeatBookingPage extends ConsumerStatefulWidget {
//   const SeatBookingPage({required this.transactionDetail, super.key});
//   final (MovieDetail, Transaction) transactionDetail;

//   @override
//   ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
// }

// class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
//   List<int> selectedSeats = [];
//   List<int> reservedSeats = [];
//   final List<String> seatRows = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

//   @override
//   Widget build(BuildContext context) {
//     final (movieDetail, transaction) = widget.transactionDetail;

//     return Scaffold(
//       body: ListView(
//         children: [
//           verticalSpace(10),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
//             child: BackNavigationBar(
//               title: movieDetail.title,
//               onTap: () => ref.read(routerProvider).pop(),
//             ),
//           ),
//           verticalSpace(30),
//           seatStatusInformation(),
//           verticalSpace(80),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               seatSection(
//                 seatNumbers: List.generate(18, (index) => index + 1),
//                 onTap: (seatNumber) {
//                   if (!selectedSeats.contains(seatNumber)) {
//                     setState(() {
//                       selectedSeats.add(seatNumber);
//                     });
//                   } else {
//                     setState(() {
//                       selectedSeats.remove(seatNumber);
//                     });
//                   }
//                 },
//                 seatStatusChecker: (seatNumber) =>
//                     reservedSeats.contains(seatNumber)
//                         ? SeatStatus.reserved
//                         : selectedSeats.contains(seatNumber)
//                             ? SeatStatus.selected
//                             : SeatStatus.available,
//               ),
//               horizontalSpace(30),
//               seatSection(
//                 seatNumbers: List.generate(18, (index) => index + 19),
//                 onTap: (seatNumber) {
//                   if (!selectedSeats.contains(seatNumber)) {
//                     setState(() {
//                       selectedSeats.add(seatNumber);
//                     });
//                   } else {
//                     setState(() {
//                       selectedSeats.remove(seatNumber);
//                     });
//                   }
//                 },
//                 seatStatusChecker: (seatNumber) =>
//                     reservedSeats.contains(seatNumber)
//                         ? SeatStatus.reserved
//                         : selectedSeats.contains(seatNumber)
//                             ? SeatStatus.selected
//                             : SeatStatus.available,
//               ),
//               horizontalSpace(30),
//               seatSection(
//                 seatNumbers: List.generate(18, (index) => index + 37),
//                 onTap: (seatNumber) {
//                   if (!selectedSeats.contains(seatNumber)) {
//                     setState(() {
//                       selectedSeats.add(seatNumber);
//                     });
//                   } else {
//                     setState(() {
//                       selectedSeats.remove(seatNumber);
//                     });
//                   }
//                 },
//                 seatStatusChecker: (seatNumber) =>
//                     reservedSeats.contains(seatNumber)
//                         ? SeatStatus.reserved
//                         : selectedSeats.contains(seatNumber)
//                             ? SeatStatus.selected
//                             : SeatStatus.available,
//               ),
//             ],
//           ),
//           verticalSpace(30),
//           ...screenWidget(),
//           verticalSpace(30),
//           Text(
//             '${selectedSeats.length} seats selected',
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SeatBookingPage extends ConsumerStatefulWidget {
  const SeatBookingPage({required this.transactionDetail, super.key});
  final (MovieDetail, Transaction) transactionDetail;

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  final int leftRightRows = 6;
  final int leftRightColumns = 4;
  final int middleRows = 6;
  final int middleColumns = 7;
  List<String> selectedSeats = [];
  Random random = Random();
  Map<String, bool> seatAvailability = {};

  final List<String> seatLetters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  @override
  void initState() {
    super.initState();
    // Inisialisasi status isEnable untuk semua kursi saat halaman dibuka
    _initializeSeatAvailability();
  }

  void _initializeSeatAvailability() {
    for (var letter in seatLetters) {
      for (int i = 1; i <= leftRightColumns + middleColumns; i++) {
        // Buat ID kursi (misalnya, 'A1', 'B2', dll.)
        String seatId = '$letter$i';
        // Tentukan secara acak apakah kursi ini tersedia atau tidak
        bool isEnable = random.nextBool();
        // Simpan status ke dalam map
        seatAvailability[seatId] = isEnable;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: BackNavigationBar(
              title: movieDetail.title,
              onTap: () => ref.read(routerProvider).pop(),
            ),
          ),
          verticalSpace(50),
          seatStatusInformation(theme: theme),
          verticalSpace(50),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                buildSeatRow(leftRightRows, leftRightColumns,
                    isMiddle: false, isLeft: true, theme: theme),
                const SizedBox(
                  width: 50,
                ),
                buildSeatRow(middleRows, middleColumns,
                    isMiddle: true, theme: theme),
                const SizedBox(
                  width: 50,
                ),
                buildSeatRow(
                    theme: theme,
                    leftRightRows,
                    leftRightColumns,
                    isMiddle: false,
                    isLeft: false),
              ],
            ),
          ),
          verticalSpace(60),
          ...screenWidget(),
          verticalSpace(30),
          Text(
            '${selectedSeats.length} seats selected',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                buttonType: ButtonType.medium,
                text: 'Next',
                buttonColor: theme.colorScheme.primary,
                onPressed: () {
                  if (selectedSeats.isNotEmpty) {
                    var updatetransaction = transaction.copyWith(
                        seat: (selectedSeats..sort()).map((e) => e).toList(),
                        ticketAmount: selectedSeats.length,
                        ticketPrcie: 30000);
                    ref.read(routerProvider).pushNamed('confirmation',
                        extra: (movieDetail, updatetransaction));
                  } else {
                    context.showSnackbar(
                        'Please choose a seat first', SnackBarType.error);
                  }
                },
              ),
            ),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }

  Widget buildSeat(String seatId, {required ThemeData theme}) {
    bool isEnable = seatAvailability[seatId] ?? true; // Ambil status dari map
    bool isSelected = selectedSeats.contains(seatId);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          if (isEnable) {
            setState(() {
              if (isSelected) {
                selectedSeats.remove(seatId);
              } else {
                selectedSeats.add(seatId);
              }
            });
          }
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isEnable
                ? isSelected
                    ? theme.colorScheme.primary
                    : Colors.white
                : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              seatId,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatRow(
    int rows,
    int columns, {
    bool isMiddle = false,
    bool isLeft = false,
    required ThemeData theme,
  }) {
    List<Widget> seatRows = [];

    for (int i = 0; i < rows; i++) {
      List<Widget> seatRow = [];
      int seatNumber = 1;

      // Jika bagian tengah, nomor kursi dimulai setelah kursi kiri
      if (isMiddle) seatNumber += leftRightColumns;

      // Jika bagian kanan, nomor kursi dimulai setelah kursi tengah
      if (!isLeft && !isMiddle) seatNumber += leftRightColumns + middleColumns;

      for (int j = 0; j < columns; j++) {
        String seatId = '${seatLetters[i]}$seatNumber';

        // Tentukan secara acak apakah kursi ini tersedia atau tidak

        seatRow.add(buildSeat(seatId, theme: theme));
        seatNumber++;
      }

      seatRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: seatRow,
      ));
    }

    return Column(
      children: seatRows,
    );
  }
}
