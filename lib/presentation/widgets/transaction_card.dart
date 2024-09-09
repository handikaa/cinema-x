import 'package:flix_id/data/dio_client/api_constant.dart';
import 'package:flix_id/domain/transaction.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/misc/method.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../misc/assets.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: transaction.title != 'Top Up'
                      ? NetworkImage(
                          '${ApiConstant.baseUrlImage}${transaction.transactionImage}')
                      : AssetImage(iconTopUp),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat('EE, d MMM y').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        transaction.transactionTime!,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                  ),
                  Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    transaction.title == 'Top Up'
                        ? '+ ${(-transaction.total).toIdrCurrencyFormat()}'
                        : transaction.total.toIdrCurrencyFormat(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: transaction.title == 'Top Up'
                            ? Colors.green
                            : Colors.amber),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
