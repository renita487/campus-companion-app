class KCTLocation {
  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;
  final String description;
  final List<FloorData> floors;

  const KCTLocation({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.description,
    this.floors = const [],
  });
}

class FloorData {
  final String floorName;
  final List<RoomData> rooms;

  const FloorData({
    required this.floorName,
    required this.rooms,
  });
}

class RoomData {
  final String roomNumber;
  final String roomName;
  final String type; // 'classroom' | 'lab' | 'staffroom' | 'office' | 'restroom'
  final String directions;

  const RoomData({
    required this.roomNumber,
    required this.roomName,
    required this.type,
    required this.directions,
  });
}