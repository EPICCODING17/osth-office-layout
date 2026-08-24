-- OSTH office layout · export 1970-01-01T00:00:00.000Z
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS floors (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS items (
  id INTEGER PRIMARY KEY,
  floor_id INTEGER NOT NULL REFERENCES floors(id),
  type TEXT NOT NULL,
  name TEXT NOT NULL,
  x REAL NOT NULL,
  z REAL NOT NULL,
  rot REAL NOT NULL DEFAULT 0,
  lan INTEGER NOT NULL DEFAULT 0,
  tel INTEGER NOT NULL DEFAULT 0,
  power INTEGER NOT NULL DEFAULT 0,
  fax INTEGER NOT NULL DEFAULT 0,
  ext TEXT,
  lan_no TEXT,
  tel_no TEXT,
  note TEXT
);

DELETE FROM items;
DELETE FROM floors;

INSERT INTO floors (id, name) VALUES (1, 'ชั้น 1');
INSERT INTO floors (id, name) VALUES (2, 'ชั้น 2');
INSERT INTO floors (id, name) VALUES (3, 'ชั้น 3');

INSERT INTO items VALUES (1, 1, 'workstation', 'Thep', -6.6, -1, 0, 1, 1, 1, 0, '11', '1F-01', '11', '');
INSERT INTO items VALUES (2, 1, 'workstation', 'Kanuang', -4.8, -1, 0, 1, 1, 1, 0, '10', '1F-02', '10', '');
INSERT INTO items VALUES (3, 1, 'workstation', 'Pong', -3, -1, 0, 1, 1, 1, 0, '13', '1F-03', '13', '');
INSERT INTO items VALUES (4, 1, 'workstation', 'Nook', -6.6, 1.2, 180, 1, 1, 1, 0, '12', '1F-04', '12', '');
INSERT INTO items VALUES (5, 1, 'workstation', 'Golf', -4.8, 1.2, 180, 1, 1, 1, 0, '15', '1F-05', '15', '');
INSERT INTO items VALUES (6, 1, 'workstation', 'Kook', -3, 1.2, 180, 1, 1, 1, 0, '0', '1F-06', '0', '*OP');
INSERT INTO items VALUES (7, 1, 'workstation', 'Pooh', -1.2, 1.2, 180, 1, 1, 1, 0, '12', '1F-07', '12', '');
INSERT INTO items VALUES (8, 1, 'workstation', 'Pee', 1.5, -1, 0, 1, 1, 1, 0, '31', '1F-08', '31', '');
INSERT INTO items VALUES (9, 1, 'workstation', 'Keng', 3.3, -1, 0, 1, 1, 1, 0, '31', '1F-09', '31', '');
INSERT INTO items VALUES (10, 1, 'workstation', 'Oil', 5.1, -1, 0, 1, 1, 1, 0, '30', '1F-10', '30', '');
INSERT INTO items VALUES (11, 1, 'workstation', 'Oum', 6.9, -1, 0, 1, 1, 1, 0, '30', '1F-11', '30', '');
INSERT INTO items VALUES (12, 1, 'workstation', 'Naka', 1.5, 1.2, 180, 1, 1, 1, 0, '24', '1F-12', '24', '');
INSERT INTO items VALUES (13, 1, 'workstation', 'Kuma', 3.3, 1.2, 180, 1, 1, 1, 0, '21', '1F-13', '21', '');
INSERT INTO items VALUES (14, 1, 'workstation', 'Bird', 5.1, 1.2, 180, 1, 1, 1, 0, '33', '1F-14', '33', '');
INSERT INTO items VALUES (15, 1, 'workstation', 'Jeng', 6.9, 1.2, 180, 1, 1, 1, 0, '33', '1F-15', '33', '');
INSERT INTO items VALUES (16, 1, 'workstation', 'Milk', 2.4, 3.4, 0, 1, 1, 1, 0, '32', '1F-16', '32', '');
INSERT INTO items VALUES (17, 1, 'workstation', 'Joe', 4.2, 3.4, 0, 1, 1, 1, 0, '34', '1F-17', '34', '');
INSERT INTO items VALUES (18, 1, 'printer', 'Old Fuji Xerox', -1.5, -4.2, 0, 1, 0, 1, 0, '', '1F-18', '', '');
INSERT INTO items VALUES (19, 1, 'printer', 'Old Fuji Xerox ช่าง', 6.6, 2.2, 180, 1, 0, 1, 1, '', '1F-19', '', 'โซนช่าง');
INSERT INTO items VALUES (20, 1, 'outlet', 'Spare 1', -7.7, -4.3, 0, 1, 0, 1, 0, '', '1F-20', '', 'หน้าห้องน้ำ');
INSERT INTO items VALUES (21, 1, 'outlet', 'Spare 2', -7, -4.3, 0, 1, 0, 1, 0, '', '1F-21', '', 'หน้าห้องน้ำ');
INSERT INTO items VALUES (22, 1, 'wifi', 'Wifi New 1', 7.6, -4.5, 0, 1, 0, 0, 0, '', '1F-22', '', 'ห้องครัว');
INSERT INTO items VALUES (23, 1, 'wifi', 'Wifi New 2', -7.7, 4.4, 0, 1, 0, 0, 0, '', '1F-23', '', 'ห้องช่าง');
INSERT INTO items VALUES (24, 1, 'rack', 'Rack 1F', -0.3, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
INSERT INTO items VALUES (25, 1, 'panel', 'ตู้ไฟ 1F', 1.1, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
INSERT INTO items VALUES (26, 2, 'workstation', 'Nate', -3.2, -1, 0, 1, 1, 1, 0, '14', '2F-01', '14', '');
INSERT INTO items VALUES (27, 2, 'workstation', 'Fah', -1.4, -1, 0, 1, 1, 1, 0, '14', '2F-02', '14', '');
INSERT INTO items VALUES (28, 2, 'workstation', 'Sri', 0.4, -1, 0, 1, 2, 1, 0, '22,23', '2F-03', '22,23', '');
INSERT INTO items VALUES (29, 2, 'printer', 'New Fuji Xerox', 2.8, -1.2, 0, 1, 0, 1, 0, '', '2F-04', '', '');
INSERT INTO items VALUES (30, 2, 'meeting', 'Meeting 2', -2.4, 2.4, 0, 1, 1, 1, 0, '', '2F-05', '', '');
INSERT INTO items VALUES (31, 2, 'meeting', 'Meeting 1 VIP', -5.5, 3.6, 0, 1, 1, 1, 0, '', '2F-06', '', '');
INSERT INTO items VALUES (32, 2, 'workstation', 'Demo 1', 4.4, 2.2, 180, 1, 1, 1, 0, '', '2F-07', '', 'โซนช่าง');
INSERT INTO items VALUES (33, 2, 'rack', 'Rack 2F', -0.3, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
INSERT INTO items VALUES (34, 2, 'panel', 'ตู้ไฟ 2F', 1.1, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
INSERT INTO items VALUES (35, 3, 'rack', 'Rack 3F', -0.3, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
INSERT INTO items VALUES (36, 3, 'panel', 'ตู้ไฟ 3F', 1.1, -4.6, 0, 0, 0, 0, 0, '', '', '', '');
