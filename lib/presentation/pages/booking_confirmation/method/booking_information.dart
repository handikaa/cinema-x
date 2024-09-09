import '../../../extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/transaction.dart';

Table bookingInformatiion(Transaction transaction) {
  return Table(
    // border: TableBorder.all(color: Colors.white),

    columnWidths: const {
      0: FlexColumnWidth(2),
      1: FlexColumnWidth(3),
    },
    children: [
      TableRow(
        children: [
          const Text('Showing Date'),
          Text(DateFormat('EE, d MMMM y').format(
            DateTime.fromMillisecondsSinceEpoch(transaction.watchingTime ?? 0),
          )),
        ],
      ),
      TableRow(
        children: [
          const Text('Time'),
          Text(DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(transaction.watchingTime ?? 0),
          )),
        ],
      ),
      TableRow(
        children: [
          const Text('Theater'),
          Text('${transaction.teatherName}'),
        ],
      ),
      TableRow(
        children: [
          const Text('Seat Number'),
          Text('${transaction.seat.join(', ')}'),
        ],
      ),
      TableRow(
        children: [
          const Text('# of Ticket'),
          Text('${transaction.seat.length} Ticket(s)'),
        ],
      ),
      TableRow(
        children: [
          const Text('Ticket Price'),
          Text(transaction.ticketPrcie!.toIdrCurrencyFormat()),
        ],
      ),
      TableRow(
        children: [
          const Text('Adm. Fee'),
          Text(transaction.adminFee.toIdrCurrencyFormat()),
        ],
      ),
    ],
  );
}
