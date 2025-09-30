import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_app/Providers/EventsProvider.dart';
import 'package:scanner_app/api/api_service.dart';
import 'package:scanner_app/models/event_list_model.dart';
import 'package:scanner_app/utils/custom_functions.dart';

class EventsLists extends StatefulWidget {
  const EventsLists({super.key});

  @override
  State<EventsLists> createState() => _EventsListsState();
}

class _EventsListsState extends State<EventsLists> {
  late EventListModel eventListModel ;
  late final futureEvents;
  @override
  void initState() {
    super.initState();
    setState(() {
      futureEvents = Provider.of<EventsProvider>(context,listen: false) ;
    });
   futureEvents.eventsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Event Scanner",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: implement your logout logic
              // For example: clear token, navigate to login page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out")),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Subtitle
                const Text(
                  "Today's Events",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Event List
                Expanded(
                  child: FutureBuilder<EventListModel>(
                    future: ApiService().eventLists(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("Error: ${snapshot.error.toString()}"));
                      } else if (!snapshot.hasData ) {
                        return const Center(child: Text("No events available"));
                      }

                      final events = snapshot.data!.values;

                      return ListView.builder(
                        itemCount: events!.length,
                        itemBuilder: (context, index) {
                          final event = events[index];
                          final imageId = event.eventInformationImage;
                     print("image id ${events[index]}  ${events[index].eventInformationImage}");
                          // Now use a FutureBuilder only for the image
                          return FutureBuilder<String>(
                            future: imageId != null
                                ? futureEvents.eventImage(snapshot.data!.values![index].eventInformationImage)
                                : Future.value(''),
                            builder: (context, imageSnapshot) {
                              if (imageSnapshot.connectionState == ConnectionState.waiting) {
                                return const SizedBox(
                                  height: 150,
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              }

                              final imageUrl = imageSnapshot.data ?? '';

                              return EventCard(
                                title: event.title ?? '',
                                time: (event.startDate != null && event.endDate != null)
                                    ? '${extractDate(event.startDate.toString())} - ${extractDate(event.endDate.toString())}'
                                    : "Date not available",
                               // location: event.location,
                                imageUrl: imageUrl,
                              );
                            },
                          );
                        },
                      );

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}

class EventCard extends StatelessWidget {
  final String? title;
  final String? time;
  final String? location;
  final String? imageUrl;

  const EventCard({
    super.key,
     this.title,
   this.time,
     this.location,
     this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: (imageUrl != null && imageUrl!.isNotEmpty)
                ? Image.network(
              imageUrl!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : Image.asset(
              'assets/images/defaultImage.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Event Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + arrow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                const SizedBox(height: 8),

                // Time
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      time?? '',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Location
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      location ?? '',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}