import 'package:flix_id/domain/movie_detail.dart';
import 'package:flix_id/domain/result.dart';
import 'package:flix_id/domain/transaction.dart';
import 'package:flix_id/domain/usecase/create_transaction/create_transactio_params.dart';
import 'package:flix_id/domain/usecase/create_transaction/create_transaction.dart';
import 'package:flix_id/presentation/extensions/build_extension_context.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/providers/transaction_data_provider/transactio_data_provider.dart';
import 'package:flix_id/presentation/providers/usecase/create_transaction.dart/create_transaction_provider.dart';
import 'package:flix_id/presentation/providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../widgets/back_navigation_bar.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import '../time_booking/method/backdrop_image.dart';
import 'method/booking_information.dart';
import 'method/title_cinema.dart';

class BookingConfirmatioPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const BookingConfirmatioPage({required this.transactionDetail, super.key});

  @override
  ConsumerState<BookingConfirmatioPage> createState() =>
      _BookingConfirmatioPageState(transactionDetail: transactionDetail);
}

class _BookingConfirmatioPageState
    extends ConsumerState<BookingConfirmatioPage> {
  final (MovieDetail, Transaction) transactionDetail;
  _BookingConfirmatioPageState({required this.transactionDetail});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    var (movieDetail, transaction) = transactionDetail;
    transaction = transaction.copyWith(
      total: transaction.ticketAmount! * transaction.ticketPrcie! +
          transaction.adminFee,
    );

    int currentBalance = ref.watch(userDataProvider).valueOrNull!.balance;
    int lastBalance = currentBalance - transaction.total;

    void createTransaction() async {
      setState(() {
        isLoading = true;
      });
      int transactiontime = DateTime.now().millisecondsSinceEpoch;

      transaction = transaction.copyWith(
          transactionTime: transactiontime,
          id: 'flx-$transactiontime-${transaction.uid}');

      CreateTransaction createTransaction = ref.read(createTransactionProvider);
      await createTransaction(CreateTransactioParams(transaction: transaction))
          .then(
        (result) {
          switch (result) {
            case Success(value: _):
              ref
                  .read(transactioDataProvider.notifier)
                  .refreshTransactionData();
              ref.read(userDataProvider.notifier).refreshUserData();
              ref.read(routerProvider).goNamed('main');
              context.showSnackbar(
                  'Berhasil Membeli tiket', SnackBarType.succes);
            case Failed(:final message):
              context.showSnackbar(message, SnackBarType.error);
          }
        },
      );
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'Booking Confirmation',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(30),
                backdropimage(maxWidth, context, movieDetail: movieDetail),
                verticalSpace(20),
                titleCinema(title: movieDetail.title),
                verticalSpace(20),
                const Divider(
                  height: 10,
                  color: Colors.white,
                ),
                verticalSpace(20),
                bookingInformatiion(transaction),
                verticalSpace(20),
                const Divider(
                  height: 10,
                  color: Colors.white,
                ),
                verticalSpace(20),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(
                      children: [
                        const Text('Total Price'),
                        Text(transaction.total.toIdrCurrencyFormat()),
                      ],
                    ),
                  ],
                ),
                verticalSpace(10),
                balanceInfo(ref, context, lastBalance.toIdrCurrencyFormat()),
                verticalSpace(40),
                if (isLoading) CircularProgressIndicator(),
                if (!isLoading)
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      buttonType: ButtonType.medium,
                      text: 'Next',
                      buttonColor: theme.colorScheme.primary,
                      onPressed: isLoading
                          ? () {}
                          : () {
                              createTransaction();
                              print('di klik');
                            },
                    ),
                  ),
              ],
            ),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }

  Widget balanceInfo(WidgetRef ref, BuildContext context, String lasBalance) =>
      Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
        },
        children: [
          TableRow(
            children: [
              const Text('Your balance'),
              Text(
                ref.watch(userDataProvider).when(
                      data: (user) => user!.balance.toIdrCurrencyFormat(),
                      error: (error, stackTrace) => '',
                      loading: () => '',
                    ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(''),
              Text(
                lasBalance,
              ),
            ],
          ),
        ],
      );

  String greetingText() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
