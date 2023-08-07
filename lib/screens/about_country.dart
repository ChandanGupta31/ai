import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class AboutCountry extends StatefulWidget {
  AboutCountry({super.key});

  @override
  State<AboutCountry> createState() => _AboutCountryState();
}

class _AboutCountryState extends State<AboutCountry> {
  var countryName = TextEditingController();
  var visibility = false;
  var data;

  var gdp = '';
  var sex_ratio = ' ';
  var surface_area = ' ';
  var life_expectancy_male = ' ';
  var unemployment = ' ';
  var imports = ' ';
  var homicide_rate = ' ';
  var iso2 = ' ';
  var employment_services = ' ';
  var employment_industry = ' ';
  var urban_population_growth = ' ';
  var secondary_school_enrollment_female = ' ';
  var employment_agriculture = ' ';
  var capital = ' ';
  var co2_emissions = ' ';
  var forested_area = ' ';
  var tourists = ' ';
  var exports = ' ';
  var life_expectancy_female = ' ';
  var post_secondary_enrollment_female = ' ';
  var post_secondary_enrollment_male = ' ';
  var primary_school_enrollment_female = ' ';
  var infant_mortality = ' ';
  var gdp_growth = ' ';
  var threatened_species = ' ';
  var population = ' ';
  var urban_population = ' ';
  var secondary_school_enrollment_male = ' ';
  var name = ' ';
  var pop_growth = ' ';
  var region = ' ';
  var pop_density = ' ';
  var internet_users = ' ';
  var gdp_per_capita = ' ';
  var fertility = ' ';
  var refugees = ' ';
  var primary_school_enrollment_male = ' ';
  var currencyCode = ' ';
  var currencyName = ' ';

  void getInformation() async {
    EasyLoading.show();
    var headers = {'X-Api-Key': 'C0sJdYc5Tc5PYYxHJpNslw==2Is9I4yHKmNFDKKR'};
    var request = http.Request('GET',
        Uri.parse('https://api.api-ninjas.com/v1/country?name=${countryName.text.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      var jsonData = await response.stream.bytesToString();
      data = jsonDecode(jsonData);
      gdp = data[0]['gdp'].toStringAsFixed(2);
      sex_ratio = data[0]['sex_ratio'].toString();
      currencyCode = data[0]['currency']['code'].toString();
      currencyName = data[0]['currency']['name'].toString();
      surface_area = data[0]['surface_area'].toString();
      life_expectancy_male = data[0]['life_expectancy_male'].toString();
      unemployment = data[0]['unemployment'].toString();
      imports = data[0]['imports'].toString();
      homicide_rate = data[0]['homicide_rate'].toString();
      iso2 = data[0]['iso2'];
      employment_services = data[0]['employment_services'].toString();
      employment_industry = data[0]['employment_industry'].toString();
      urban_population_growth = data[0]['urban_population_growth'].toString();
      secondary_school_enrollment_female =
          data[0]['secondary_school_enrollment_female'].toString();
      employment_agriculture = data[0]['employment_agriculture'].toString();
      capital = data[0]['capital'];
      co2_emissions = data[0]['co2_emissions'].toString();
      forested_area = data[0]['forested_area'].toString();
      tourists = data[0]['tourists'].toString();
      exports = data[0]['exports'].toString();
      life_expectancy_female = data[0]['life_expectancy_female'].toString();
      post_secondary_enrollment_female =
          data[0]['post_secondary_enrollment_female'].toString();
      post_secondary_enrollment_male =
          data[0]['post_secondary_enrollment_male'].toString();
      primary_school_enrollment_female =
          data[0]['primary_school_enrollment_female'].toString();
      infant_mortality = data[0]['infant_mortality'].toString();
      gdp_growth = data[0]['gdp_growth'].toString();
      threatened_species = data[0]['threatened_species'].toString();
      population = data[0]['population'].toString();
      urban_population = data[0]['urban_population'].toString();
      secondary_school_enrollment_male =
          data[0]['secondary_school_enrollment_male'].toString();
      name = data[0]['name'];
      pop_growth = data[0]['pop_growth'].toString();
      region = data[0]['region'];
      pop_density = data[0]['pop_density'].toString();
      internet_users = data[0]['internet_users'].toString();
      gdp_per_capita = data[0]['gdp_per_capita'].toString();
      fertility = data[0]['fertility'].toString();
      refugees = data[0]['fertility'].toString();
      primary_school_enrollment_male =
          data[0]['primary_school_enrollment_male'].toString();
      setState(() {

      });
      print(data);
    } else {
      EasyLoading.dismiss();
      EasyLoading.showToast(
        response.reasonPhrase.toString(),
        toastPosition: EasyLoadingToastPosition.bottom,
        duration: Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.white, Theme.of(context).primaryColor],
          center: Alignment.center,
          radius: 1,
          tileMode: TileMode.mirror,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              TextField(
                controller: countryName,
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text('Enter Country Name'),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: getInformation,
                  child: Text(
                    'Get  Information',
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
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Visibility(
                  visible: visibility,
                  child:Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 0.5,
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gdp : ${gdp}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Sex Ratio : ${sex_ratio}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Surface Area : ${surface_area}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Life Expectancy Male: ${life_expectancy_male}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Unemployment : ${unemployment}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'CurrencyName : ${currencyName}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'CurrencyCode : ${currencyCode}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Imports : ${imports}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Homicide Hate : ${homicide_rate}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Iso2 : ${iso2}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Employment Services : ${employment_services}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Employment Industry : ${employment_industry}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ), Text(
                              'Urban Population Growth : ${urban_population_growth}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Secondary School Enrollment Female : ${secondary_school_enrollment_female}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Employment Agriculture : ${employment_agriculture}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Capital : ${capital}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Co2 Emissions : ${co2_emissions}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Forested Area : ${forested_area}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Tourists : ${tourists}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Exports : ${exports}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Life Expectancy Female : ${life_expectancy_female}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Post Secondary Enrollment Female: ${post_secondary_enrollment_female}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Post Secondary Enrollment Male : ${post_secondary_enrollment_male}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Sprimary School Enrollment Female : ${primary_school_enrollment_female}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Infant Mortality : ${infant_mortality}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Gdp Growth: ${gdp_growth}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Threatened Species : ${threatened_species}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Population : ${population}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Urban Population : ${urban_population}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Secondary School Enrollment Male : ${secondary_school_enrollment_male}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Name : ${name}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Pop Growth : ${pop_growth}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Gegion : ${region}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Pop Density : ${pop_density}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Internet Users : ${internet_users}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Gdp Per Capita: ${gdp_per_capita}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Fertility : ${fertility}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Refugees : ${refugees}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Primary School Enrollment Male : ${primary_school_enrollment_male}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
