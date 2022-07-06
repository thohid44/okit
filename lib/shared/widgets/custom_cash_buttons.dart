import 'package:flutter/material.dart';
import 'package:okit/state%20management/cash_page_state.dart';
import 'package:provider/provider.dart';

class CustomCashButton extends StatelessWidget {
  String title;
  final onTap;

  CustomCashButton(
      {Key? key,
      required this.title,
      required this.onTap,
      height,
      width,
      circular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 135,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow.shade700, //background color of button
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

customSingleButton({required String value, required onTap}) {
  TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  return SizedBox(
      height: 40,
      width: 40,
      child: InkWell(
        child: Center(
            child: Text(value, textAlign: TextAlign.center, style: textStyle)),
        onTap: onTap,
      ));
}

class CustomRowButton extends StatefulWidget {
  String firstValue;
  String secondValue;
  String thirdValue;
  // final onTapFirstValue;
  // final onTapSecondValue;
  // final onTapThirdValue;
  CustomRowButton({
    Key? key,
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
  }) : super(key: key);

  @override
  State<CustomRowButton> createState() => _CustomRowButtonState();
}

class _CustomRowButtonState extends State<CustomRowButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CashPageMoneyState>(
        create: (context) => CashPageMoneyState(),
        child: Consumer<CashPageMoneyState>(
          builder: (context, provider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customSingleButton(
                  value: widget.firstValue,
                  onTap: () {
                    provider.add(value: widget.firstValue);
                  },
                ),
                customSingleButton(
                  value: widget.secondValue,
                  onTap: () {
                    provider.add(value: widget.secondValue);
                  },
                ),
                customSingleButton(
                  value: widget.thirdValue,
                  onTap: () {
                    provider.add(value: widget.thirdValue);
                  },
                ),
              ],
            );
          },
        ));
  }
}
