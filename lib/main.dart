import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

void main() {
  runApp(const CampusApp());
}

class AppData {
  static String? currentLocation;

  static const Map<String, LatLng> locations = {
    "Main Gate": LatLng(12.934, 80.132),
    "A Block": LatLng(12.936, 80.135),
    "C Block": LatLng(12.935, 80.138),
    "Canteen": LatLng(12.933, 80.133),
    "Library": LatLng(12.937, 80.134),
  };

  static const Map<String, String> locationImages = {
    "Main Gate": "assets/maingate.jpg",
    "Canteen": "assets/canteen.webp",
    "Library": "assets/library.jpg",
  };

  static const Map<String, List<String>> destinations = {
    "Main Gate": ["A Block", "C Block"],
    "Canteen": ["Main Gate", "Library"],
    "Library": ["Main Gate", "Canteen"],
  };

  static const Map<String, List<String>> directions = {
    "Main Gate_A Block": [
      "Go straight 50m from gate",
      "Turn left at canteen",
      "A Block is on your right",
    ],
    "Main Gate_C Block": [
      "Go straight 100m from gate",
      "Turn right at library",
      "C Block is ahead",
    ],
    "Canteen_Main Gate": ["Go north 50m", "Turn right", "Main Gate is ahead"],
    "Canteen_Library": ["Go straight 30m east", "Library is on your left"],
    "Library_Main Gate": ["Go south 100m", "Turn left", "Main Gate is ahead"],
    "Library_Canteen": ["Go straight 30m west", "Canteen is on your right"],
  };

  static const Map<String, List<String>> nearbyRefreshments = {
    "Main Gate": ["Canteen (100m)", "Tea Stall (50m)", "Water Fountain (20m)"],
    "A Block": ["Vending Machine (30m)", "Canteen (200m)"],
    "C Block": ["Canteen (150m)", "Juice Stall (80m)"],
    "Canteen": ["You're already here! 😋"],
    "Library": [
      "Coffee Corner (80m)",
      "Canteen (100m)",
      "Vending Machine (50m)",
    ],
  };
}

class CampusApp extends StatelessWidget {
  const CampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campus Companion"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.school, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Campus Navigator!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.my_location),
                label: const Text("Identify Location"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                icon: const Icon(Icons.navigation),
                label: const Text("Choose Destination"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (AppData.currentLocation != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationScreen(
                          startLocation: AppData.currentLocation!,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please identify your starting location first.",
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  void _selectLocation(BuildContext context, String locationName) {
    AppData.currentLocation = locationName;
    final validDestinations = AppData.destinations[locationName];
    if (validDestinations == null || validDestinations.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No destinations available from $locationName yet."),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DestinationScreen(startLocation: locationName),
        ),
      );
    }
  }

  Widget _buildLocationCard(
    BuildContext context,
    String title,
    String assetPath,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),

        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            assetPath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 18),

        onTap: () => _selectLocation(context, title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Your Location")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Where are you currently?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          _buildLocationCard(
            context,
            "Main Gate",
            AppData.locationImages["Main Gate"]!,
          ),
          _buildLocationCard(
            context,
            "Canteen",
            AppData.locationImages["Canteen"]!,
          ),
          _buildLocationCard(
            context,
            "Library",
            AppData.locationImages["Library"]!,
          ),
        ],
      ),
    );
  }
}

class DirectionsScreen extends StatefulWidget {
  final String start;
  final String destination;

  const DirectionsScreen({
    super.key,
    required this.start,
    required this.destination,
  });

  @override
  State<DirectionsScreen> createState() => _DirectionsScreenState();
}

class _DirectionsScreenState extends State<DirectionsScreen> {
  
  final MapController mapController = MapController();
  LatLng? currentLocation;
  StreamSubscription<Position>? positionStream;
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _loadLocation() async {
    final position = await _getCurrentLocation();
    final newLocation = LatLng(
    position.latitude,
    position.longitude,
  );
  setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
    mapController.move(newLocation, 17);

  }

  @override
void initState() {
  super.initState();

  positionStream = Geolocator.getPositionStream().listen((Position position) {
    final newLocation = LatLng(
      position.latitude,
      position.longitude,
    );

    setState(() {
      currentLocation = newLocation;
    });

    // 🔥 move map smoothly
    mapController.move(newLocation, 17);
  });

  }
  @override
void dispose() {
  positionStream?.cancel(); // stop tracking
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final startCoord = AppData.locations[widget.start] ?? const LatLng(0, 0);
    final destCoord =
        AppData.locations[widget.destination] ?? const LatLng(0, 0);
    final distance = Distance();
    final meters = distance(startCoord, destCoord);
    final km = (meters / 1000).toStringAsFixed(2);
    final centerCoord = LatLng(
      (startCoord.latitude + destCoord.latitude) / 2,
      (startCoord.longitude + destCoord.longitude) / 2,
    );

    final directionsKey = "${widget.start}_${widget.destination}";
    final steps =
        AppData.directions[directionsKey] ?? ["No directions available"];

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.start} → ${widget.destination}"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: centerCoord,
                initialZoom: 16.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.campus_companion',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                     points: currentLocation != null
    ? [currentLocation!, destCoord]
    : [startCoord, destCoord],
                      color: Colors.blue,
                      strokeWidth: 4,
                    ),
                  ],
                ),
                MarkerLayer(
                  markers: [
  Marker(
    point: startCoord,
    width: 40,
    height: 40,
    child: const Icon(Icons.location_on, color: Colors.green, size: 40),
  ),

  Marker(
    point: destCoord,
    width: 40,
    height: 40,
    child: const Icon(Icons.location_on, color: Colors.red, size: 40),
  ),

  // 🔥 THIS IS THE IMPORTANT ONE
  if (currentLocation != null)
    Marker(
      point: currentLocation!,
      width: 40,
      height: 40,
      child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
    ),
],
                  
                  
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 10),
                  Container(
  margin: const EdgeInsets.only(bottom: 12),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.deepPurple.shade50,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    children: [
      const Icon(Icons.location_on, color: Colors.deepPurple),
      const SizedBox(width: 8),
      Text(
        "Distance: ${(meters / 1000).toStringAsFixed(2)} km",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    ],
  ),
),
                  const Text(
                    "Step-by-Step Directions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: steps.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.only(bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
  leading: CircleAvatar(
    backgroundColor: Colors.deepPurple.shade100,
    child: Text(
      "${index + 1}",
      style: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  title: Text(
    steps[index],
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationScreen extends StatelessWidget {
  final String startLocation;

  const DestinationScreen({super.key, required this.startLocation});

  @override
  Widget build(BuildContext context) {
    final destinations = AppData.destinations[startLocation] ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Destination")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Starting at: $startLocation",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (AppData.locationImages.containsKey(startLocation))
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppData.locationImages[startLocation]!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 32),
            const Text(
              "Where do you want to go?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              icon: const Icon(Icons.local_dining, color: Colors.green),
              label: const Text("Nearby Refreshments"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade50,
                foregroundColor: Colors.green.shade700,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                final refreshments =
                    AppData.nearbyRefreshments[startLocation] ??
                    ["No refreshments nearby"];
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.green.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Row(
                      children: [
                        const Icon(Icons.local_dining, color: Colors.green),
                        const SizedBox(width: 8),
                        Text("Refreshments near $startLocation"),
                      ],
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: refreshments
                            .map(
                              (refreshment) => ListTile(
                                dense: true,
                                leading: const Icon(
                                  Icons.local_cafe,
                                  color: Colors.orange,
                                  size: 24,
                                ),
                                title: Text(
                                  refreshment,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Thanks!",
                          style: TextStyle(color: Colors.green.shade700),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: destinations.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final dest = destinations[index];
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DirectionsScreen(
                            start: startLocation,
                            destination: dest,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text("Navigate to $dest"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
