import '../../misc/assets.dart';
import '../../providers/transaction_data_provider/transactio_data_provider.dart';
import '../../widgets/ticket_card..dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
          child: ref.watch(transactioDataProvider).when(
                data: (transactions) {
                  // Filter transaksi dan cek jika kosong
                  final filteredTransactions = transactions
                      .where((element) => element.title != 'Top Up')
                      .toList()
                    ..sort(
                      (a, b) =>
                          b.transactionTime!.compareTo(a.transactionTime!),
                    );

                  if (filteredTransactions.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding: const EdgeInsets.only(left: 20),
                            height: 200,
                            width: 200,
                            child: LottieBuilder.asset(
                              iconEmpty,
                              repeat: true,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text('Let\'s watch a movie')
                        ],
                      ),
                    );
                  }

                  // Jika ada data transaksi, tampilkan tiket
                  return Column(
                    children: filteredTransactions
                        .map(
                          (transaction) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TicketCard(transaction: transaction),
                          ),
                        )
                        .toList(),
                  );
                },
                error: (error, stackTrace) => const Center(
                  child: Text(
                    'Terjadi kesalahan',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        )
      ],
    );
  }
}
