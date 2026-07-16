import 'package:flutter/material.dart';
import 'data/f_block_data.dart';
import 'models/location.dart';

void main() {
  runApp(const NavKCTApp());
}

class NavKCTApp extends StatelessWidget {
  const NavKCTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavKCT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1D4ED8)),
        useMaterial3: true,
      ),
      home: const BlockDetailScreen(),
    );
  }
}

class BlockDetailScreen extends StatefulWidget {
  const BlockDetailScreen({super.key});

  @override
  State<BlockDetailScreen> createState() => _BlockDetailScreenState();
}

class _BlockDetailScreenState extends State<BlockDetailScreen> {
  int selectedFloorIndex = 0;

  Color getRoomColor(String type) {
    switch (type) {
      case 'lab':
        return const Color(0xFFDBEAFE);
      case 'staffroom':
        return const Color(0xFFFEF9C3);
      case 'office':
        return const Color(0xFFDCFCE7);
      case 'restroom':
        return const Color(0xFFF3F4F6);
      default:
        return Colors.white;
    }
  }

  IconData getRoomIcon(String type) {
    switch (type) {
      case 'lab':
        return Icons.science;
      case 'staffroom':
        return Icons.person;
      case 'office':
        return Icons.business;
      case 'restroom':
        return Icons.wc;
      default:
        return Icons.meeting_room;
    }
  }

  @override
  Widget build(BuildContext context) {
    final FloorData currentFloor = fBlock.floors[selectedFloorIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
  backgroundColor: const Color(0xFF1D4ED8),
  title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'NavKCT',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      Text(
        'F Block — Campus Companion',
        style: TextStyle(color: Color(0xFFBFDBFE), fontSize: 13),
      ),
    ],
  ),
),
      body: Column(
        children: [
          // Block info card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D4ED8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'F Block',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Academic',
                        style: TextStyle(
                            color: Color(0xFF166534),
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  fBlock.description,
                  style: const TextStyle(
                      fontSize: 13, color: Color(0xFF6B7280), height: 1.5),
                ),
              ],
            ),
          ),

          // Floor selector tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(fBlock.floors.length, (index) {
                final isSelected = index == selectedFloorIndex;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedFloorIndex = index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF1D4ED8)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF1D4ED8)
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Text(
                        fBlock.floors[index].floorName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF374151),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 12),

          // Room list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: currentFloor.rooms.length,
              itemBuilder: (context, index) {
                final RoomData room = currentFloor.rooms[index];
                return GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(getRoomIcon(room.type),
                                  color: const Color(0xFF1D4ED8)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  room.roomName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            room.roomNumber,
                            style: const TextStyle(
                                fontSize: 13, color: Color(0xFF6B7280)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'How to get there',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF374151)),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              room.directions,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1E3A8A),
                                  height: 1.6),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: getRoomColor(room.type),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        Icon(getRoomIcon(room.type),
                            color: const Color(0xFF1D4ED8), size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                room.roomName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF111827)),
                              ),
                              Text(
                                room.roomNumber,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xFF6B7280)),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right,
                            color: Color(0xFF9CA3AF)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}