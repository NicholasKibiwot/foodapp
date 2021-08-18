import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = ' phone-auth-screen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

String counterText = '0';

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  //alert dialog

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          width: 8,
        ),
        Text('Please wait...')
      ],
    ));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  phoneAuthentication(number) {
    print(number);
  }

  String initialCountry = 'KE';
  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.black12,
          iconTheme: IconThemeData(color: Colors.white),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Login',
              style: TextStyle(color: Colors.yellow[300]),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                child: Icon(
                  CupertinoIcons.person_alt_circle,
                  color: Colors.yellowAccent,
                  size: 60,
                ),
              ),



              SizedBox(height: 30,),
              Text('we will send confirmation to your phone'),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Form(
                  key: formKey,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(80.0),
                            child: AbsorbPointer(
                              absorbing: validate ? false : true,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: validate
                                        ? MaterialStateProperty.all(
                                            Theme.of(context).primaryColor)
                                        : MaterialStateProperty.all(
                                            Colors.black54),
                                  ),
                                  onPressed: () {
                                    // ignore: unused_local_variable
                                    showAlertDialog(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Next',
                                      style:
                                          TextStyle(color: Colors.yellowAccent),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, '');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
