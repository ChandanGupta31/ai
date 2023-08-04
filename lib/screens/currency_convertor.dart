import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class CurrencyConvertor extends StatefulWidget {
  CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {

  var amount = TextEditingController();
  var finalCurrency =TextEditingController();
  var  visibility = false;
  var data;
  var newAmount = 0.0;
  String selectedCurrencyFrom =  'INR	Indian Rupee';
   String selectedCurrencyTo = 'USD	United States';

  var currencyFrom = [
    'AED	UAE Dirham',
    'AFN  Afghan Afghani',
    'ALL	Albanian Lek',
    'AMD  Armenian Dram',
    'ANG	Netherlands ',
    'AOA	Angolan Kwanza' ,
    'ARS	Argentine Peso'	  ,
    'AUD	Australian Dollar',
    'AWG	Aruban Florin' ,
    'AZN	Azerbaijani Manat',
    'BAM	Bosnia And Herzegovina',
    'BBD	Barbadian Dollar',
    'BDT	Bangladeshi Taka',
    'BGN	Bulgarian Lev',
    'BHD	Bahraini Dinar'   ,
    'BIF	Burundi Franc',
    'BMD	Bermudan Dollar'   ,
    'BND	Brunei Dollar',
    'BOB	Bolivian Boliviano',
    'BRL	Brazilian Real',
    'BSD	Bahamian Dollar',
    'BTC	Bitcoin',
    'BTN	Bhutanese Ngultrum',
    'BWP	Botswana Pula',
    'BYN	New Belarusian'     ,
    'BYR	Belarusian ',
    'BZD	Belize Dollar'	     ,
    'CAD	Canadian Dollar',
    'CDF	Congolese Franc'      ,
    'CHF	Swiss Franc',
    'CLF	Chilean Unit Of Account',
    'CLP	Chilean Peso',
    'CNY	Chinese Yuan'     ,
    'COP	Colombian Peso',
    'CRC	Costa Rican Colon',
    'CUC	Cuban Convertible Peso',
    'CUP	Cuban Peso'	   ,
    'CVE	Cape Verdean Escudo',
    'CZK	Czech Koruna'	    ,
    'DJF	Djiboutian Franc',
    'DKK	Danish Krone'	,
    'DOP	Dominican Peso',
    'DZD	Algerian Dinar'	,
    'EGP	Egyptian Pound',
    'ERN	Eritrean Nakfa'  ,
    'ETB	Ethiopian Birr',
    'EUR	Euro'	,
    'FJD	Fijian Dollar',
    'FKP	Falkland Islands ',
    'GBP	British Pound',
    'GEL	Georgian Lari'	     ,
    'GGP	Guernsey Pound',
    'GHS	Ghanaian Cedi'	     ,
    'GIP	Gibraltar Pound',
    'GMD	Gambian Dalasi'	     ,
    'GNF	Guinean Franc',
    'GTQ	Guatemalan Quetzal',
    'GYD	Guyanese Dollar',
    'HKD	Hong Kong Dollar',
    'HNL	Honduran Lempira',
    'HRK	Croatian Kuna'    ,
    'HTG	Haitian Gourde',
    'HUF	Hungarian Forint',
    'IDR	Indonesian Rupiah',
    'ILS	Israeli New Sheqel',
    'IMP	Manx pound',
    'INR	Indian Rupee'	,
    'IQD	Iraqi Dinar',
    'IRR	Iranian Rial'	  ,
    'ISK	Icelandic',
    'JEP	Jersey Pound'	  ,
    'JMD	Jamaican Dollar',
    'JOD	Jordanian Dinar'  ,
    'JPY	Japanese Yen',
    'KES	Kenyan Shilling' ,
    'KGS	Kyrgyzstani Som',
    'KHR	Cambodian Riel' ,
    'KMF	Comorian Franc',
    'KPW	North KoreanWon' ,
    'KRW	South Korean Won',
    'KWD	Kuwaiti Dinar' ,
    'KYD	Cayman Islands ',
    'KZT	Kazakhstani Tenge',
    'LAK	Lao Kip',
    'LBP	Lebanese Lira' ,
    'LKR	Sri Lankan Rupee',
    'LRD	Liberian Dollar'  ,
    'LSL	Lesotho Loti',
    'LVL	Latvian Lats'	,
    'LYD	Libyan Dinar',
    'MAD	Moroccan Dirham ' ,
    'MDL	Moldovan Leu',
    'MGA	Malagasy Ariary'   ,
    'MKD	Macedonian Denar',
    'MMK	Myanma Kyat',
    'MNT	Mongolian Tugrik',
    'MOP	Macanese Pataca'     ,
    'MRO	Mauritanian ',
    'MUR	Mauritian Rupee' ,
    'MVR	Maldivian Rufiyaa',
    'MWK	Malawian Kwacha',
    'MXN	Mexican Peso',
    'MYR	Malaysian Ringgit',
    'MZN	Mozambican Metical',
    'NAD	Namibian Dollar' ,
    'NGN	Nigerian Naira',
    'NIO	Nicaraguan Cordoba',
    'NOK	Norwegian Krone',
    'NPR	Nepalese Rupee' ,
    'NZD	New Zealand Dollar',
    'OMR	Omani Rial' ,
    'PAB	Panamanian Balboa',
    'PEN	Peruvian Nuevo Sol',
    'PGK	Papua New Guinean ',
    'PHP	Philippine Peso'   ,
    'PKR	Pakistani Rupee',
    'PLN	Polish Zloty'	   ,
    'PYG	Paraguayan Guarani',
    'QAR	Qatari Riyal' ,
    'RON	Romanian Leu',
    'RSD	Serbian Dinar' ,
    'RUB	Russian Ruble',
    'RWF	Rwandan Franc',
    'SAR	Saudi Riyal',
    'SBD	Solomon Islands ',
    'SCR	Seychellois Rupee',
    'SDG	Sudanese Pound'	       ,
    'SEK	Swedish Krona',
    'SGD	Singapore Dollar',
    'SHP	Saint Helena Pound',
    'SLL	Sierra Leonean L',
    'SOS	Somali Shilling',
    'SRD	Surinamese Dollar',
    'STD	Sao Tome  ',
    'SVC	Salvadoran'       ,
    'SYP	Syrian Pound',
    'SZL	Swazi Lilangeni'  ,
    'THB	Thai Baht',
    'TJS	Tajikistani Somoni',
    'TMT	Turkmenistan Manat',
    'TND	Tunisian Dinar'	    ,
    'TOP	Paanga',
    'TRY	Turkish New Lira',
    'TTD	Trinidad and Tobago',
    'TWD	New Taiwan Dollar',
    'TZS	Tanzanian Shilling',
    'UAH	Ukrainian Hryvnia',
    'UGX	Ugandan Shilling',
    'USD	United States',
    'UYU	Uruguayan Peso',
    'UZS	Uzbekistani Som'    ,
    'VEF	Venezuelan Bolivar',
    'VND	Vietnamese Dong'    ,
    'VUV	Vanuatu Vatu',
    'WST	Samoan Tala'	    ,
    'XAF	Central African ',
    'XAG	Silver ',
    'XCD	East Caribbean ',
    'XOF	West African ',
    'XPF	CFP Franc'	      ,
    'YER	Yemeni Rial',
    'ZAR	South African ',
    'ZMK	Old Zambian Kwacha',
    'ZMW	Zambian Kwacha'	   ,
    'ZWL	Zimbabwean Dollar',

  ];

  void getNewAmount() async {
    EasyLoading.show();
    var headers = {
      'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'
    };
    var request = http.Request('GET', Uri.parse('https://api.api-ninjas.com/v1/convertcurrency?want=${selectedCurrencyTo.substring(0,3)}&have=${selectedCurrencyFrom.substring(0,3)}&amount=${amount.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dataJson = await response.stream.bytesToString();
      data = jsonDecode(dataJson);
      newAmount = data['new_amount'];
      finalCurrency.text = newAmount.toStringAsFixed(2);
      visibility = true;
      EasyLoading.dismiss();
      setState(() {

      });
    }
    else {
        EasyLoading.dismiss();
        EasyLoading.showToast(
          response.reasonPhrase.toString(),
          toastPosition: EasyLoadingToastPosition.bottom,
          duration: Duration(seconds: 1),
        );
    }

  }

  void copyText() {
    Clipboard.setData(ClipboardData(text: newAmount.toString()));
    EasyLoading.showToast(
      'Text Copied !',
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.01
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Theme.of(context).primaryColor],
              center: Alignment.center,
              radius: 1,
              tileMode: TileMode.mirror,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Row(
                children: [
                  Text(
                    'Currency From:  ',
                    style: TextStyle(fontSize: 14),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: selectedCurrencyFrom,
                    // Down Arrow Icon
                    icon: Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: currencyFrom.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 13),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrencyFrom = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.017,),
              Row(
                children: [
                  Text(
                    'Currency TO:  ',
                    style: TextStyle(fontSize: 14),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: selectedCurrencyTo,
                    // Down Arrow Icon
                    icon: Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: currencyFrom.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 13),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrencyTo = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Enter the Currency Amount'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                  onPressed: getNewAmount,
                  child: Text(
                    'Convert Currency',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              Visibility(
                  visible: visibility,
                  child: TextFormField(
                    controller: finalCurrency,
                    minLines: 1,
                    maxLines: 10,
                    enabled: false,
                    decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.5,
                            )
                        )
                    ),
                  )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),
              Visibility(
                visible: visibility,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(
                    onPressed: copyText,
                    child: Text(
                      'Copy Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

