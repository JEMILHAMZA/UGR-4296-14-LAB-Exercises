import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('iJTracker'),
          ),
          leading: const Icon(Icons.help, color: Colors.white),
          actions: const [
            Icon(Icons.notifications, color: Colors.white),
            SizedBox(width: 20),
            Icon(Icons.settings, color: Colors.white),
            SizedBox(width: 40),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    // Replace with your image asset
                    backgroundImage: AssetImage('assets/coffee.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Robert Steven',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.directions_car, color: Colors.blue),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blue),
                              ),
                              child: Text(
                                'B 24555 UJD| 347854988',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text('Log Out', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Online | Battery: 90%',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // Row 1
                    Row(
                      children: [
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.map, text: 'Map All Devices'),
                        ),
                        const VerticalDivider(
                            thickness: 2, color: Colors.black),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.location_on, text: 'Live Location'),
                        ),
                        const VerticalDivider(
                            thickness: 2, color: Colors.black),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.history, text: 'History Location'),
                        ),
                      ],
                    ),
                    const Divider(),
                    // Row 2
                    Row(
                      children: [
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.network_check, text: 'Set Geofence'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.details, text: 'Detail Info'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.edit, text: 'Edit Device'),
                        ),
                      ],
                    ),
                    const Divider(),
                    // Row 3
                    Row(
                      children: [
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.phonelink_setup,
                              text: 'Change Center Network'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.vpn_key, text: 'Disable Menu'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.gps_fixed,
                              text: 'Set GPS Time Interval'),
                        ),
                      ],
                    ),
                    const Divider(),
                    // Row 4
                    Row(
                      children: [
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.restart_alt, text: 'Restart Device'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.battery_charging_full,
                              text: 'Power Saving'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.speed, text: 'Normal Mode'),
                        ),
                      ],
                    ),
                    const Divider(),
                    // Row 5
                    Row(
                      children: [
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.power_settings_new,
                              text: 'Shutdown Device'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.list, text: 'Device Command History'),
                        ),
                        const VerticalDivider(thickness: 2),
                        Expanded(
                          child: boxWithIconText(
                              icon: Icons.email, text: 'Contact Us'),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            // Safe Area for Navigation
            SafeArea(child: Container()),
          ],
        ),
      ),
    );
  }

  // Helper function to create a box with icon and text
  Widget boxWithIconText({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 5),
          Text(text),
        ],
      ),
    );
  }
}
