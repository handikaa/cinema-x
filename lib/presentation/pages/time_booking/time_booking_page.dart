import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../domain/movie_detail.dart';
import '../../../domain/transaction.dart';
import '../../extensions/build_extension_context.dart';
import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/back_navigation_bar.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import 'method/backdrop_image.dart';
import 'method/theather.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  const TimeBookingPage(
    this.movieDetail, {
    super.key,
  });
  final MovieDetail movieDetail;
  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  List<String> bioskop = [
    'CCM',
    'Botani',
    'CGV',
    'Cinepolis',
    'Giant Square',
    'Carrefour'
  ];
  final List<DateTime> dates = List.generate(
    7,
    (index) {
      DateTime now = DateTime.now();
      DateTime date = DateTime(now.year, now.month, now.day);
      return date.add(
        Duration(days: index),
      );
    },
  );
  List<int> hours = List.generate(
    8,
    (index) => index + 15,
  );

  String? selectedTheater;
  DateTime? selectedDate;
  int? selectedhour;
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNavigationBar(
                  title: widget.movieDetail.title,
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                backdropimage(maxWidth, context,
                    movieDetail: widget.movieDetail),
                verticalSpace(24),
              ],
            ),
          ),
          ...selectItem(
            title: 'Select a theater',
            options: bioskop,
            selectedItem: selectedTheater,
            onTap: (object) {
              setState(() {
                selectedTheater = object;
              });
            },
          ),
          verticalSpace(24),
          ...selectItem(
            title: 'Select date',
            isOptionEnable: (object) => selectedTheater != null,
            converter: (date) => DateFormat('EEE, dd MMM yyy').format(date),
            options: dates,
            selectedItem: selectedDate,
            onTap: (object) {
              setState(() {
                selectedDate = object;
              });
            },
          ),
          verticalSpace(24),
          ...selectItem(
            title: 'Select show time',
            options: hours,
            converter: (object) => '$object:00',
            isOptionEnable: (hour) =>
                selectedDate != null &&
                DateTime(selectedDate!.year, selectedDate!.month,
                        selectedDate!.day, hour)
                    .isAfter(DateTime.now()),
            selectedItem: selectedhour,
            onTap: (object) {
              setState(() {
                selectedhour = object;
              });
            },
          ),
          verticalSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                buttonType: ButtonType.medium,
                text: 'Next',
                buttonColor: theme.colorScheme.primary,
                onPressed: () {
                  DateTime now = DateTime.now();
                  int currentHour = now.hour;
                  DateTime today = DateTime(now.year, now.month, now.day);
                  if (selectedDate == null ||
                      selectedTheater == null ||
                      selectedhour == null) {
                    context.showSnackbar(
                        'Please select the time', SnackBarType.error);
                    return;
                  }

                  if (today == selectedDate && selectedhour! <= currentHour) {
                    context.showSnackbar('Invalid Time', SnackBarType.error);
                    return;
                  }

                  Transaction transaction = Transaction(
                    uid: ref.read(userDataProvider).value!.uid,
                    title: widget.movieDetail.title,
                    adminFee: 10000,
                    total: 0,
                    teatherName: selectedTheater,
                    transactionImage: widget.movieDetail.posterPath,
                    watchingTime: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedhour!,
                    ).millisecondsSinceEpoch,
                  );

                  ref.read(routerProvider).pushNamed('seatBooking',
                      extra: (widget.movieDetail, transaction));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
