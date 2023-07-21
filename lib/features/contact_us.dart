import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../core/utils.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  List<File> _images = [];
  void _onPickImages() async {
    _images = await pickImages();
    setState(() {});
  }

  //----------------------------------------------------------------------------
  final _formKey = GlobalKey<FormState>();

  //----------------------------------------------------------------------------
  final _numberController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  // ignore: unused_element
  void _onVerifyPhoneNumber() {
    if (_numberController.text.trim().isEmpty) {
      return;
    }
    // ref.read(authControllerProvider.notifier).createSession(
    //       context: context,
    //       phone: number.phoneNumber!,
    //     );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.amber,
        child: const Center(
          child: Text(
            'Submit',
            style: TextStyle(
              fontFamily: 'Bangers',
              color: Colors.red,
              fontSize: 32,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onPickImages,
        label: const Text('+ Add Images'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFa4b0a2),
              Color(0xFF5a635c),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Contact us',
                    style: TextStyle(
                      fontFamily: 'Bangers',
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        this.number = number;
                      },
                      inputDecoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: const TextStyle(
                            color: Colors.white, fontFamily: 'Bangers'),
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.white),
                      textStyle: const TextStyle(color: Colors.white),
                      initialValue: number,
                      textFieldController: _numberController,
                      formatInput: true,
                      cursorColor: Colors.white,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      onSaved: (PhoneNumber number) {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      hintText: 'Name',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontFamily: 'Bangers'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontFamily: 'Bangers'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      hintText: 'Address',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontFamily: 'Bangers'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      hintText: 'Note',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontFamily: 'Bangers'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_images.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.235,
                      child: CarouselSlider(
                        items: _images
                            .map(
                              (i) => Stack(
                                children: [
                                  Container(
                                    width: 300,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        i,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {
                                          _images.remove(i);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 0.6,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
