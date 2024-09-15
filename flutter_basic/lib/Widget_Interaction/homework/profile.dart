import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable to track light/dark mode
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode:
          isDarkMode ? ThemeMode.dark : ThemeMode.light, // Set theme mode
      home: Profile(
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class Profile extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const Profile({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.isDarkMode ? Colors.grey[850] : Colors.blueGrey[900],
        leading: Icon(
          Icons.chevron_left,
          size: 32,
          color: widget.isDarkMode ? Colors.white : Colors.white,
        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                color: widget.isDarkMode ? Colors.white : Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout_outlined,
              size: 32,
              color: widget.isDarkMode ? Colors.white : Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: widget.isDarkMode ? Colors.grey[850] : Colors.blueGrey[800],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Avatar(
                avatarUrl: "assets/images/star_wars.png",
                fullName: 'Phvdung',
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style: TextStyle(fontSize: 20, color: Colors.white38),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        DateOfBirthPicker(
                          selectedDate: _selectedDate,
                          onDateSelected: (newDate) {
                            setState(() {
                              _selectedDate = newDate;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        const PhoneNumber(),
                        const SizedBox(height: 16),
                        const Email(),
                        const SizedBox(height: 16),
                        const Gender(),
                        const SizedBox(height: 16),
                        const City()
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Settings",
                      style: TextStyle(fontSize: 20, color: Colors.white38),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Language(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Dark/Light",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Switch(
                              value: widget.isDarkMode,
                              onChanged: widget.onThemeChanged,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isVietNamSelected = true; // Variable to track selected language

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Language",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isVietNamSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: isVietNamSelected
                      ? Border.all(color: Colors.white)
                      : Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  "assets/images/vietnammuonnam.png",
                  height: 24,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                setState(() {
                  isVietNamSelected = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: !isVietNamSelected
                      ? Border.all(color: Colors.white)
                      : Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  "assets/images/england.png",
                  height: 24,
                  width: 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class City extends StatefulWidget {
  const City({
    super.key,
  });

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  String? _selectedCity;
  List<String> cities = [
    'Ho Chi Minh city',
    'Ha Noi',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "City",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButton<String>(
            dropdownColor: Colors.grey,
            hint: Text(
              cities[0],
              style: const TextStyle(color: Colors.white),
            ),
            value: _selectedCity,
            items: cities
                .map((city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(
                        city,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedCity = value;
              });
            },
            underline: Container(),
          ),
        ),
      ],
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({
    super.key,
  });

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String _selectedRadioListTileValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        // Wrap the RadioListTile in Expanded to prevent overflow
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Use Flexible to allow each RadioListTile to share space properly
            Container(
              width: 90,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: _selectedRadioListTileValue == 'Male'
                    ? Border.all(color: Colors.white)
                    : Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                title: const Text('Male',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                value: 'Male',
                groupValue: _selectedRadioListTileValue,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioListTileValue = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 100,
              decoration: BoxDecoration(
                  border: _selectedRadioListTileValue == 'Female'
                      ? Border.all(color: Colors.white)
                      : Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8)),
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                title: const Text('Female',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                value: 'Female',
                groupValue: _selectedRadioListTileValue,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioListTileValue = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 90,
              decoration: BoxDecoration(
                  border: _selectedRadioListTileValue == 'Other'
                      ? Border.all(color: Colors.white)
                      : Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8)),
              child: RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                title: const Text('Other',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                value: 'Other',
                groupValue: _selectedRadioListTileValue,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioListTileValue = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Email",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          child: const Row(
            children: [
              Text(
                "phvdung0000@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Phone number",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image.asset(
                "assets/images/vietnammuonnam.png",
                height: 24,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              const Text(
                "+0980000000",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.avatarUrl,
    required this.fullName,
  });

  final String avatarUrl;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.width * 0.24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(avatarUrl),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          fullName,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}

// Refactored DateOfBirthPicker widget
class DateOfBirthPicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateOfBirthPicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      onDateSelected(pickedDate); // Notify parent of the selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Date of birth",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDate(
                    selectedDate.toLocal(), ['dd', '/', 'mm', '/', 'yyyy']),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
