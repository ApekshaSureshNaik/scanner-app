import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Image.network(
              "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),

            const SizedBox(height: 16),

            // Event Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Tech Conference 2024",

              ),
            ),

            const SizedBox(height: 8),

            // Date & Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(Icons.calendar_today, size: 18),
                  SizedBox(width: 6),
                  Text("March 15, 2024 • 9:00 AM - 5:00 PM"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Row(
                children: const [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 6),
                  Text("Innovation Center, Silicon Valley"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Verify Registration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.qr_code, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Verify Registration",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text("Scan attendee QR code to verify registration"),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Scan QR Code"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // // Verify Food Slot
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12)),
            //     child: Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: const [
            //               Icon(Icons.restaurant_menu, color: Colors.blue),
            //               SizedBox(width: 8),
            //               Text("Verify Food Slot",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 16)),
            //             ],
            //           ),
            //           const SizedBox(height: 4),
            //           const Text("Scan QR code to validate meal allocation"),
            //           const SizedBox(height: 12),
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blue,
            //               minimumSize: const Size(double.infinity, 45),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //             onPressed: () {},
            //             child: const Text("Scan QR Code"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 16),

            // About Event
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("About Event",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    "Join us for the biggest tech conference of 2024. "
                        "Experience cutting-edge innovations, network with industry leaders, "
                        "and gain insights into the future of technology.",
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.people, size: 18),
                      SizedBox(width: 6),
                      Text("Capacity: 500 attendees"),
                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
