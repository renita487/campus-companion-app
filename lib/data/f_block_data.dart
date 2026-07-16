import '../models/location.dart';

const KCTLocation fBlock = KCTLocation(
  id: 'f_block',
  name: 'F Block',
  category: 'academic',
  lat: 11.0768309,
  lng: 76.9879587,
  description:
      'F Block houses the Science and Computing labs including Language Lab, MATLAB Lab, and DST FIST Centre. Has a central Badminton Court with 6 courts.',
  floors: [
    FloorData(
      floorName: 'Ground Floor',
      rooms: [
        RoomData(
          roomNumber: 'SC101',
          roomName: 'Lab 01',
          type: 'lab',
          directions:
              'Enter from Entrance 1 (main entrance near HOD office). Turn left — SC101 is the first lab on your left.',
        ),
        RoomData(
          roomNumber: 'SC102',
          roomName: 'Lab 02',
          type: 'lab',
          directions:
              'Enter from Entrance 1. Turn left — SC102 is next to SC101.',
        ),
        RoomData(
          roomNumber: 'SC103',
          roomName: 'Language Lab',
          type: 'lab',
          directions:
              'Enter from Entrance 1. Walk straight past the badminton court — SC103 Language Lab is on the far left side.',
        ),
        RoomData(
          roomNumber: 'SC107',
          roomName: 'DST FIST Centre for Materials Characterization',
          type: 'lab',
          directions:
              'Enter from Entrance 2. SC107 is on your left side near the bottom corner of the block.',
        ),
        RoomData(
          roomNumber: 'SC110',
          roomName: 'Room SC110',
          type: 'classroom',
          directions:
              'Enter from Entrance 2. SC110 is immediately on your right.',
        ),
        RoomData(
          roomNumber: 'SC111',
          roomName: 'Room SC111',
          type: 'classroom',
          directions:
              'Enter from Entrance 2. SC111 is next to SC110 on your right.',
        ),
        RoomData(
          roomNumber: 'HOD_OFFICE',
          roomName: 'HOD Office',
          type: 'office',
          directions:
              'Enter from Entrance 1 (main entrance). HOD Office is directly on your right as you enter.',
        ),
        RoomData(
          roomNumber: 'BADMINTON',
          roomName: 'Badminton Court',
          type: 'lab',
          directions:
              'Enter from either entrance. The badminton court (6 courts) is the large open area in the center of the block.',
        ),
        RoomData(
          roomNumber: 'GIRLS_RESTROOM_G',
          roomName: 'Girls Restroom',
          type: 'restroom',
          directions:
              'Located behind Staircase 2 in the corner nook — left side of the block.',
        ),
        RoomData(
          roomNumber: 'BOYS_RESTROOM_G',
          roomName: 'Boys Restroom',
          type: 'restroom',
          directions:
              'Located behind Staircase 3 in the corner nook — bottom side of the block.',
        ),
      ],
    ),
    FloorData(
      floorName: '1st Floor',
      rooms: [
        RoomData(
          roomNumber: 'SC201',
          roomName: "Professor's Pavilion 4 (PP4)",
          type: 'staffroom',
          directions:
              'Climb Staircase 1. You land near SC215. SC201 is PP4 — walk to the far end of the corridor on your left.',
        ),
        RoomData(
          roomNumber: 'SC202',
          roomName: 'Room SC202',
          type: 'classroom',
          directions:
              'Climb Staircase 1. SC202 is on the left corridor, second room from the end.',
        ),
        RoomData(
          roomNumber: 'SC203',
          roomName: 'Room SC203',
          type: 'classroom',
          directions: 'Climb Staircase 1. SC203 is on the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC204',
          roomName: 'Room SC204',
          type: 'classroom',
          directions: 'Climb Staircase 2. SC204 is near the top left corner.',
        ),
        RoomData(
          roomNumber: 'SC205',
          roomName: 'Room SC205',
          type: 'classroom',
          directions: 'Climb Staircase 1 or 2. SC205 is on the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC206',
          roomName: 'Room SC206',
          type: 'classroom',
          directions: 'Climb Staircase 1 or 2. SC206 is on the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC207',
          roomName: 'Room SC207',
          type: 'classroom',
          directions: 'Climb Staircase 1 or 2. SC207 is on the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC208',
          roomName: 'Room SC208',
          type: 'classroom',
          directions: 'Climb Staircase 1 or 2. SC208 is on the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC209',
          roomName: 'Room SC209',
          type: 'classroom',
          directions:
              'Climb Staircase 1 or 3. SC209 is near the bottom of the left corridor.',
        ),
        RoomData(
          roomNumber: 'SC210',
          roomName: 'MATLAB Lab (ASC210)',
          type: 'lab',
          directions:
              'Climb Staircase 3. SC210 is the MATLAB Lab — it is directly at the base of Staircase 3 on the 1st floor, centre of the block.',
        ),
        RoomData(
          roomNumber: 'SC211',
          roomName: 'Room SC211',
          type: 'classroom',
          directions:
              'Climb Staircase 3. SC211 is on the right corridor next to MATLAB lab.',
        ),
        RoomData(
          roomNumber: 'SC212',
          roomName: "Professor's Pavilion 1 (PP1)",
          type: 'staffroom',
          directions:
              'Climb Staircase 1. SC212 is PP1 — on the right corridor near Staircase 1.',
        ),
        RoomData(
          roomNumber: 'SC213',
          roomName: "Professor's Pavilion 2 (PP2)",
          type: 'staffroom',
          directions:
              'Climb Staircase 1. SC213 is PP2 — right corridor, next to SC212.',
        ),
        RoomData(
          roomNumber: 'SC214',
          roomName: "Professor's Pavilion 3 (PP3)",
          type: 'staffroom',
          directions:
              'Climb Staircase 1. SC214 is PP3 — right corridor, next to SC213.',
        ),
        RoomData(
          roomNumber: 'SC215',
          roomName: 'Room SC215',
          type: 'classroom',
          directions:
              'Climb Staircase 1 — you land directly at SC215. It is right at the top of Staircase 1.',
        ),
        RoomData(
          roomNumber: 'SC216',
          roomName: 'Room SC216',
          type: 'classroom',
          directions:
              'Climb Staircase 1. SC216 is next to SC215 near the top of Staircase 1.',
        ),
      ],
    ),
    FloorData(
      floorName: '2nd Floor',
      rooms: [
        RoomData(
          roomNumber: 'SC301',
          roomName: 'Room SC301',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC301 is on the far left corridor end.',
        ),
        RoomData(
          roomNumber: 'SC302',
          roomName: 'Room SC302',
          type: 'classroom',
          directions: 'Climb Staircase 1 to 2nd floor. SC302 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC303',
          roomName: 'Room SC303',
          type: 'classroom',
          directions: 'Climb Staircase 1 to 2nd floor. SC303 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC304',
          roomName: 'Room SC304',
          type: 'classroom',
          directions:
              'Climb Staircase 2 to 2nd floor. SC304 is near top left corner.',
        ),
        RoomData(
          roomNumber: 'SC305',
          roomName: 'Room SC305',
          type: 'classroom',
          directions: 'Climb Staircase 2 to 2nd floor. SC305 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC306',
          roomName: 'Room SC306',
          type: 'classroom',
          directions: 'Climb Staircase 2 to 2nd floor. SC306 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC307',
          roomName: 'Room SC307',
          type: 'classroom',
          directions: 'Climb Staircase 2 to 2nd floor. SC307 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC308',
          roomName: 'Room SC308',
          type: 'classroom',
          directions: 'Climb Staircase 2 to 2nd floor. SC308 is left corridor.',
        ),
        RoomData(
          roomNumber: 'SC309',
          roomName: 'Room SC309',
          type: 'classroom',
          directions:
              'Climb Staircase 3 to 2nd floor. SC309 is near bottom left.',
        ),
        RoomData(
          roomNumber: 'SC310',
          roomName: 'Room SC310',
          type: 'classroom',
          directions:
              'Climb Staircase 3 to 2nd floor. SC310 is centre bottom area.',
        ),
        RoomData(
          roomNumber: 'SC311',
          roomName: 'Room SC311',
          type: 'classroom',
          directions:
              'Climb Staircase 3 to 2nd floor. SC311 is right corridor.',
        ),
        RoomData(
          roomNumber: 'SC312',
          roomName: 'Room SC312',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC312 is right corridor.',
        ),
        RoomData(
          roomNumber: 'SC313',
          roomName: 'Room SC313',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC313 is right corridor.',
        ),
        RoomData(
          roomNumber: 'SC314',
          roomName: 'Room SC314',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC314 is right corridor.',
        ),
        RoomData(
          roomNumber: 'SC315',
          roomName: 'Room SC315',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC315 is near top right.',
        ),
        RoomData(
          roomNumber: 'SC316',
          roomName: 'Room SC316',
          type: 'classroom',
          directions:
              'Climb Staircase 1 to 2nd floor. SC316 is near top right, next to SC315.',
        ),
      ],
    ),
  ],
);
