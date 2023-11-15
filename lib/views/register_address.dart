import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gigabank/widgets/button_widget.dart';
import 'package:gigabank/widgets/custom_text_field_widget.dart';
import 'package:gigabank/widgets/stepper_widget.dart';
import 'package:gigabank/widgets/text_widget.dart';

class RegisterAdreess extends StatefulWidget {
   RegisterAdreess({super.key});
  @override
  State<RegisterAdreess> createState() => _RegisterAdreessState();
}


class _RegisterAdreessState extends State<RegisterAdreess> {
      bool isActiveButton = false;
          late TextEditingController apartmentController; 
@override
  void initState() {
    super.initState();
    apartmentController = TextEditingController();


    apartmentController.addListener(() {
      final isActiveButton = apartmentController.text.isNotEmpty;
      setState(() {
        this.isActiveButton = isActiveButton;
      });
    });
    apartmentController.addListener(() {
      final isActiveButton = apartmentController.text.isNotEmpty;
      this.isActiveButton = isActiveButton;
      setState(() {});
    });
  }

   onSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    showAboutDialog(context: context,children:[Center(child: const TextWidget(text: 'Submitted', color: Colors.black, fontsize: 17, fontWeight: FontWeight.w300))],
    
    );
 
  }

  final TextEditingController countryController=TextEditingController(); 

    final TextEditingController prefectureController=TextEditingController(); 

    final TextEditingController munipalityController=TextEditingController(); 

  final TextEditingController streetController=TextEditingController(); 


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5508ad),
leading: const Icon( Icons.arrow_back_ios,color: Colors.white,),
title: const TextWidget(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontsize: 25,
  text: 'Register Address',
),
      ),
      body:  Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const StepperWidget(),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal:30.0,vertical: 20),
              child: TextWidget(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontsize:14,
              text: 'Please enter information as written \non youe ID document',
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
              child: CommonTextField(
                        controller: countryController,
                        maxlines: 1,
                        readOnly: true,
                        hintText: "Country",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Country";
                          }
                          return null;
                        },
                        toggleIcon: (Icons.search), 
                         onTap: () {
                                showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      bottomSheetHeight: 600),
                                  onSelect: (Country country) {
                                    countryController.text = country.name;
                                  },
                                );
                              },
                      ),
            ),
                         Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
              child: CommonTextField(
                        controller: prefectureController,
                        maxlines: 1,
                        hintText: "Prefecture",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Prefecture";
                          }
                          return null;
                        },
                     
                      ),
            ),
                Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
              child: CommonTextField(
                        controller: munipalityController,
                        maxlines: 1,
                        hintText: "Municipality",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Municipality";
                          }
                          return null;
                        },
                     
                      ),
            ),
         Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
              child: CommonTextField(
                        controller: streetController,
                        maxlines: 1,
                        hintText: "Street Address(SubArea-block-house)",
                        validator: (value) {
                         if (value!.isEmpty) {
                    return 'Please enter a street address.';
                  } else if (!_isValidStreetAddress(value)) {
                    return 'Invalid street address. Please use the subarea-block-house format.';
                  }
                  return null;
                },
                     
                      ),
            ),
      
               Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 30),
              child: CommonTextField(
                        controller: apartmentController,
                        maxlines: 1,
                        hintText: "Apartment,suit or unit",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Apartment,suit or unit";
                          }
                          return null;
                        },
                     
                      ),
            ),
            const Spacer(),
             Padding(
              padding:  EdgeInsets.symmetric(horizontal:20.0,vertical: 50),
              child: WideButton(
                color: isActiveButton ? null : Color(0xff5508ad),
                onPressed:isActiveButton ? onSubmit : null,
                height: 70,
                label: 'Next',
              ),
            )
        ]),
      ),
    );
  }

    bool _isValidStreetAddress(String address) {
    // Define the pattern for subarea-block-house format
    RegExp pattern = RegExp(r'^[a-zA-Z0-9]+\-[a-zA-Z0-9]+\-[a-zA-Z0-9]+$');
    return pattern.hasMatch(address);
  }
}


