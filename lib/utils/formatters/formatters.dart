//intl library is used to format date and time

import 'package:intl/intl.dart';

class EFormatter {
  static formatDate(DateTime? date) {
    date ??= DateTime
        .now(); //get the date passed, else if null, get the current date now
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en-US', symbol: '\$')
        .format(amount); //customize currency as needed
  }

  static String phoneNumberFormatter(String phoneNumber) {
    //Assuming 10 digit US phone number format : (123) 456-7689
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) '
          '${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) '
          '${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }

    return phoneNumber;
  }

  // static String formatNumber(int number) {
  //   var i = 3;
  // }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    //Removing all non-digit from the passed string
    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    //Extract country code from digit only
    String countryCode = '+${digitOnly.substring(0, 2)}';
    //remaining numbers
    digitOnly = digitOnly.substring(2);

    //   Add the remaining digit with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode)');

    int i = 0;
    //while the initial index is less than total length
    while (i < digitOnly.length) {
      //let the letters be grouped in groups of 2
      int groupLength = 2;
      //unless when the i=0 and country code is +1 (Canada or Usa)
      if (i == 0 && countryCode == '+1') {
        //then should be grouped in length of 3
        groupLength = 3;
      }

      //then add up the i and the group length(0 + 3) to get the end of the current number
      int end = i + groupLength;
      //add it to the formattedNumber by writing that part
      formattedNumber.write(digitOnly.substring(i, end));

      //check if the end of the formatted number is less than the total number
      if (end < digitOnly.length) {
        //then add a space to it
        formattedNumber.write(' ');
      }
      //next number to start the loop from is the end index of the formatted number to write more numbers if available
      i = end;
    }

    return formattedNumber.toString();
  }
}
