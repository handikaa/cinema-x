import 'package:flutter/material.dart';

import '../../../widgets/seat.dart';

Widget seatSection({
  required List<int> seatNumbers,
  required void Function(int seatNumber) onTap,
  required SeatStatus Function(int seatNumber) seatStatusChecker,
}) =>
    SizedBox(
      height: 240,
      width: 110,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: seatNumbers
            .map((number) => Seat(
                  number: number,
                  status: seatStatusChecker(number),
                  onTap: () => onTap(number),
                ))
            .toList(),
      ),
    );
