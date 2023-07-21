import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stump_grinder/models/contact_us.dart';

import '../../../core/utils.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsScreen extends ConsumerStatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ConsumerState<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends ConsumerState<ContactUsScreen> {
  List<File> _images = [];
  void _onPickImages() async {
    _images = await pickImages();
    setState(() {});
  }

  //----------------------------------------------------------------------------

  String? name;
  String? email;
  String? address;
  String? note;

  //----------------------------------------------------------------------------
  final _formKey = GlobalKey<FormState>();

  void _submit(WidgetRef ref) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (number.phoneNumber!.isEmpty) {
      showSnackbar(context, 'Please enter your phone number.');
      return;
    }
    if (_images.isEmpty) {
      showSnackbar(context, 'Please add stump image(s)');
      return;
    }
    _formKey.currentState!.save();
    ref.read(contactUsControllerProvider.notifier).submitContactUs(
          context: context,
          images: _images,
          contactUsModel: ContactUsModel(
            phone: number.phoneNumber!,
            name: name!,
            email: email!,
            address: address!,
            note: note!,
            images: [],
          ),
        );
  }

  //----------------------------------------------------------------------------
  final _numberController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  // void _onVerifyPhoneNumber() {
  //   if (_numberController.text.trim().isEmpty) {
  //     return;
  //   }
  // }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(contactUsControllerProvider);

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: isLoading
            ? () {}
            : () {
                _submit(ref);
              },
        child: Container(
          width: double.infinity,
          height: 60,
          color: Colors.amber,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Bangers',
                      color: Colors.red,
                      fontSize: 32,
                    ),
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
              child: SingleChildScrollView(
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
                          setState(() {});
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter stump\'s location address';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        address = value;
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
                        hintText: 'Stump\'s location',
                        hintStyle: const TextStyle(
                            color: Colors.white, fontFamily: 'Bangers'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please add a note';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        note = value;
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
      ),
    );
  }
}
