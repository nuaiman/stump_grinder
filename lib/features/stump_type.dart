import 'package:flutter/material.dart';
import 'contact_us.dart';
import 'stump_size.dart';

class StumpType extends StatelessWidget {
  const StumpType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Choose your stump type',
                style: TextStyle(
                    fontFamily: 'Bangers', fontSize: 32, color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                'Basic Type',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.amber,
                    fontFamily: 'Bangers',
                    fontSize: 24,
                    color: Colors.white),
              ),
              const Text(
                '   Basic Stump: Includes basic, fresh, old, decomposed regular and shallow stumps.',
                style: TextStyle(
                    fontFamily: 'Bangers', fontSize: 18, color: Colors.white),
              ),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Hazard Type',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    fontFamily: 'Bangers',
                    fontSize: 24,
                    color: Colors.white),
              ),
              const Text(
                '   Complex Stump: Uprooted or exposed roots, multi trunk, inclined that requires full grinding.',
                style: TextStyle(
                    fontFamily: 'Bangers', fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                '   Obstacle stumps: Near house, embedded in sideways or fences, inside a dock.',
                style: TextStyle(
                    fontFamily: 'Bangers', fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                '   Special requiremnt stumps: Large mouldy stump, Super heavy stump, bush stump (small or large) and stumps that require repainting, rebuilding or specific removal.',
                style: TextStyle(
                    fontFamily: 'Bangers', fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StumpSize(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Basic Stump',
                    style: TextStyle(
                        fontFamily: 'Bangers',
                        fontSize: 24,
                        color: Colors.amber),
                  )),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ContactUs(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Hazard Stump',
                    style: TextStyle(
                        fontFamily: 'Bangers', fontSize: 24, color: Colors.red),
                  )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
