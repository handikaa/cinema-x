import '../../data/dio_client/api_constant.dart';
import '../../domain/transaction.dart';
import '../misc/method.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  final Transaction transaction;
  const TicketCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF252836),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: FittedBox(
              child: Text(
                transaction.id.toString(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${ApiConstant.baseUrlImage}${transaction.transactionImage}'),
                        fit: BoxFit.cover),
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(10),
                      Text(
                        transaction.teatherName!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        DateFormat('EEE, d, MMM yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              transaction.watchingTime!),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        DateFormat('HH:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              transaction.watchingTime!),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        '${transaction.ticketAmount} Ticket(s) (${transaction.seat.join(', ')})',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
