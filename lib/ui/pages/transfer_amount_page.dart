// ignore_for_file: deprecated_member_use

import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

// fungsi tombol number < 6
  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
    // print(amountController.text);
  }

// fungsi tombol number delete Amount
  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 58,
        ),
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: greyColor,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              CustomInputButton(
                title: '1',
                onTap: () {
                  addAmount('1');
                },
              ),
              CustomInputButton(
                title: '2',
                onTap: () {
                  addAmount('2');
                },
              ),
              CustomInputButton(
                title: '3',
                onTap: () {
                  addAmount('3');
                },
              ),
              CustomInputButton(
                title: '4',
                onTap: () {
                  addAmount('4');
                },
              ),
              CustomInputButton(
                title: '5',
                onTap: () {
                  addAmount('5');
                },
              ),
              CustomInputButton(
                title: '6',
                onTap: () {
                  addAmount('6');
                },
              ),
              CustomInputButton(
                title: '7',
                onTap: () {
                  addAmount('7');
                },
              ),
              CustomInputButton(
                title: '8',
                onTap: () {
                  addAmount('8');
                },
              ),
              CustomInputButton(
                title: '9',
                onTap: () {
                  addAmount('9');
                },
              ),
              const SizedBox(
                width: 60,
                height: 60,
              ),
              CustomInputButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBackgroundColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                    context, '/transfer-success', (Route) => false);
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            title: 'Terms & Conditions',
            onPressed: () {},
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
