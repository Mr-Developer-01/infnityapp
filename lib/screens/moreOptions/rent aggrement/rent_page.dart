// ignore_for_file: use_build_context_synchronously
import 'package:intl/intl.dart';
import 'package:tribb/screens/constant/API/call_api.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:tribb/screens/constant/toast_message.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Owner information fields data variables
  TextEditingController ownerfirstname = TextEditingController();
  TextEditingController ownerlastname = TextEditingController();
  TextEditingController ownermobileno = TextEditingController();
  TextEditingController owneremail = TextEditingController();
  TextEditingController owneraddress = TextEditingController();
  TextEditingController ownercity = TextEditingController();
  TextEditingController ownerstate = TextEditingController();
// Renter information field variables
  TextEditingController renterfirstname = TextEditingController();
  TextEditingController renterlastname = TextEditingController();
  TextEditingController rentermobile = TextEditingController();
  TextEditingController renteremail = TextEditingController();
  TextEditingController renteraddress = TextEditingController();
  TextEditingController rentercity = TextEditingController();
  TextEditingController renterstate = TextEditingController();
  // Rental information fields variables
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController rentalamount = TextEditingController();
  TextEditingController collectedby = TextEditingController();
  TextEditingController duedate = TextEditingController();
  TextEditingController paymentmethod = TextEditingController();
  TextEditingController initialpayment = TextEditingController();
  TextEditingController securitydeposite = TextEditingController();
  bool isTermsConditionAccept = false;
  bool isLoadingMode = false;
  bool isDate(String str) {
    try {
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  handleSubmitRentAggrementForm() async {
    setState(() {
      isLoadingMode = true;
    });
    var formData = {
      "Owner_First_Name__c": ownerfirstname.text,
      "Owner_Last_Name__c": ownerlastname.text,
      "Owner_Mobile_No__c": ownermobileno.text,
      "Owner_Email__c": owneremail.text,
      "Owner_Address__c": owneraddress.text,
      "Owner_City__c": ownercity.text,
      "Owner_State__c": ownerstate.text,
      "Renter_First_Name__c": renterfirstname.text,
      "Renter_Last_Name__c": renterlastname.text,
      "Renter_Mobile_No__c": rentermobile.text,
      "Renter_Email__c": renteremail.text,
      "Renter_Address__c": renteraddress.text,
      "Renter_City__c": rentercity.text,
      "Renter_State__c": renterstate.text,
      "Rental_Start_Date__c": startdate.text,
      "Rental_End_Date__c": enddate.text,
      "Monthly_Rental_Amount__c": rentalamount.text,
      "Collected_By__c": collectedby.text,
      "Rantal_Due_Date__c": duedate.text,
      "Payment_Method__c": paymentmethod.text,
      "Rental_Initial_Payment__c": initialpayment.text,
      "Security_Deposite__c": securitydeposite.text,
      "isTerms_And_Conditions_Accept__c": isTermsConditionAccept,
    };
    var response = await CallAPIs.createPostRequest(
        'PostRequirementAPI', {'objData': formData});
    if (response.contains('Record Save Successfully')) {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.successMessage(context, 'Request has been submitted.');
      setNulllValues();
    } else {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.errorMessage(context, 'Something went wrong.try again later');
    }
  }

  setNulllValues() {
    ownerfirstname.text = '';
    ownerlastname.text = '';
    ownermobileno.text = '';
    owneremail.text = '';
    owneraddress.text = '';
    ownercity.text = '';
    ownerstate.text = '';
    renterfirstname.text = '';
    renterlastname.text = '';

    rentermobile.text = '';
    renteremail.text = '';
    rentercity.text = '';
    renterstate.text = '';
    startdate.text = '';
    enddate.text = '';
    rentalamount.text = '';
    collectedby.text = '';
    duedate.text = '';
    paymentmethod.text = '';
    initialpayment.text = '';
    securitydeposite.text = '';
    setState(() {
      isTermsConditionAccept = false;
    });
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Rent Aggrement',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ownerDetails(),
                renterDetails(),
                rentalDetails(),
                tandcDetails(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: !isLoadingMode
                        ? Container(
                            decoration: BoxDecoration(
                                color: ColorsClass.themeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsClass.themeColor,
                                elevation: 0,
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  handleSubmitRentAggrementForm();
                                }
                              },
                              child: const Text("    Submit     ",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ownerDetails() {
    return Column(
      children: [
        headerText('Owner Information'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: ownerfirstname,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      autoValidateMode: AutovalidateMode.always,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'First Name', label: Text('First Name')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: ownerlastname,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Last Name', label: Text('Last Name')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: ownermobileno,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Mobile No.', label: Text('Mobile No.')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: owneremail,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        } else if (!isEmail(value)) {
                          return 'Invalid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Email', label: Text('Email')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              // width: MediaQuery.of(context).size.width / 2.5,
              child: GFTextField(
                  controller: owneraddress,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                      hintText: 'Address ', label: Text('Address')))),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: ownercity,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'City', label: Text('City')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: ownerstate,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'State', label: Text('State')))),
            ],
          ),
        ),
      ],
    );
  }

  Widget renterDetails() {
    return Column(
      children: [
        headerText('Renter Information'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: renterfirstname,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'First Name', label: Text('First Name')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: renterlastname,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Last Name', label: Text('Last Name')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: rentermobile,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Mobile No.', label: Text('Mobile No.')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: renteremail,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }else if (!isEmail(value)) {
                          return 'Invalid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Email', label: Text('Email')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              // width: MediaQuery.of(context).size.width / 2.5,
              child: GFTextField(
                  controller: renteraddress,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                      hintText: 'Address ', label: Text('Address')))),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: rentercity,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'City', label: Text('City')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: renterstate,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'State', label: Text('State')))),
            ],
          ),
        ),
      ],
    );
  }

  Widget rentalDetails() {
    return Column(
      children: [
        headerText('Rental Information'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DateTimeField(
                    // controller: startdate,
                    decoration: const InputDecoration(
                        hintText: 'Start Date',
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                        label: Text('Start Date')),
                    // autovalidate: false,
                    format: DateFormat('dd/MM/yyyy'),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          firstDate: DateTime(DateTime.now().year),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 5),
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly);
                    },
                    validator: (value) {
                      if ((value.toString().isEmpty) ||
                          (DateTime.tryParse(value.toString()) == null)) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() =>
                          startdate.text = value.toString().split(' ')[0]);
                      // setState(() => expense.date = value);
                    },
                  )),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DateTimeField(
                    // controller: enddate,
                    decoration: const InputDecoration(
                        hintText: 'End Date',
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                        label: Text('End Date')),
                    // autovalidate: false,
                    format: DateFormat('dd/MM/yyyy'),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          firstDate: DateTime(DateTime.now().year),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 5),
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly);
                    },
                    validator: (value) {
                      if ((value.toString().isEmpty) ||
                          (DateTime.tryParse(value.toString()) == null)) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(
                          () => enddate.text = value.toString().split(' ')[0]);
                      // setState(() => expense.date = value);
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: rentalamount,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Monthly Rental Amount',
                          label: Text('Monthly Rental Amount')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: collectedby,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Collected by',
                          label: Text('Collected by')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DateTimeField(
                    // controller: duedate,
                    decoration: const InputDecoration(
                        hintText: 'Due Date',
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                        label: Text('Due Date')),
                    // autovalidate: false,
                    format: DateFormat('dd/MM/yyyy'),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          firstDate: DateTime(DateTime.now().year),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 5),
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly);
                    },
                    validator: (value) {
                      if ((value.toString().isEmpty) ||
                          (DateTime.tryParse(value.toString()) == null)) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(
                          () => duedate.text = value.toString().split(' ')[0]);
                    },
                  )),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: paymentmethod,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Payment Method',
                          label: Text('Payment Method')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: initialpayment,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Initial Payment',
                          label: Text('Initial Payment')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: securitydeposite,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Security Deposite',
                          label: Text('Security Deposite')))),
            ],
          ),
        ),
      ],
    );
  }

  Widget tandcDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText('Terms And Conditions'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GFCheckbox(
                  validator: (value) {
                    if (value == null || !value) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      isTermsConditionAccept = !isTermsConditionAccept;
                    });
                  },
                  value: isTermsConditionAccept,
                  activeBgColor: ColorsClass.themeColor),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1 . Parties Involved',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: const Text(
                        'Clearly state the names and contact information of both the landlord (lessor) and the tenant (lessee)',
                        overflow: TextOverflow.visible,
                      )),
                  const Text(
                    '2 . Property Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: const Text(
                        'Provide a detailed description of the rental property, including the address and any specific amenities or features included.',
                        overflow: TextOverflow.visible,
                      )),
                  const Text(
                    '3 . Rent Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: const Text(
                        'Outline the amount of rent due, the due date, and acceptable methods of payment. Include any late fees or penalties for missed payments.',
                        overflow: TextOverflow.visible,
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget headerText(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        color: ColorsClass.themeColor,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
