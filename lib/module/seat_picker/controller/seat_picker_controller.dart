import 'package:flutter/material.dart';

import '../../../state_util.dart';
import '../view/seat_picker_view.dart';

class SeatPickerController extends State<SeatPickerView>
    implements MvcController {
  static late SeatPickerController instance;
  late SeatPickerView view;

  // Define a variable to store the selected seat
  int? selectedSeat;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<int> usedSeats = [11];
  List<int> selectedSeats = [
    0,
    1,
    2,
    3,
    4,
    7,
    8,
    9,
    12,
    16,
    18,
    19,
    20,
    21,
    23,
    24,
    27
  ];

  // Update the method to take the selected seat as a parameter
  updateSeat(int index) {
    if (selectedSeats.contains(index)) return;

    if (!usedSeats.contains(index)) {
      usedSeats.add(index);
      // Update the selected seat variable
      selectedSeat = index;
    } else {
      usedSeats.remove(index);
      // Clear the selected seat variable
      selectedSeat = null;
    }
    setState(() {});
  }
}
