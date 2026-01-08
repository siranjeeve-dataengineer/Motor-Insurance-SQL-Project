create database motor_insurance_policy;
use motor_insurance_policy;

-- 1 Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    region_id INT,
    status VARCHAR(10) DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (region_id) REFERENCES Regions(region_id),
    CHECK (role IN ('Admin','UnderWriter','Operational','Broker','SalesAgent')),
    CHECK (status IN ('Active','Blocked'))
);
-- 2 region table
CREATE TABLE Regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);
INSERT INTO Users (user_id, username, password_hash, role, region_id, status, created_at) VALUES
(1,  'admin_main',       'hash_001', 'Admin',        1, 'Active',  '2023-01-03 09:15:24'),
(2,  'admin_support',    'hash_002', 'Admin',        2, 'Active',  '2023-01-04 10:42:57'),
(3,  'admin_backup',     'hash_003', 'Admin',        3, 'Blocked', '2023-01-09 17:55:12'),
(4,  'underwriter_north','hash_004', 'UnderWriter',  1, 'Active',  '2023-01-14 08:25:03'),
(5,  'underwriter_south','hash_005', 'UnderWriter',  2, 'Active',  '2023-01-18 11:43:50'),
(6,  'underwriter_east', 'hash_006', 'UnderWriter',  3, 'Active',  '2023-01-22 09:38:44'),
(7,  'underwriter_west', 'hash_007', 'UnderWriter',  4, 'Blocked', '2023-01-28 15:10:29'),
(8,  'operations_mum',   'hash_008', 'Operational',  1, 'Active',  '2023-02-03 10:12:11'),
(9,  'operations_pune',  'hash_009', 'Operational',  2, 'Active',  '2023-02-06 13:29:47'),
(10, 'operations_del',   'hash_010', 'Operational',  3, 'Active',  '2023-02-09 09:54:05'),
(11, 'broker_alpha',     'hash_011', 'Broker',       1, 'Active',  '2023-02-14 14:23:33'),
(12, 'broker_beta',      'hash_012', 'Broker',       2, 'Active',  '2023-02-17 15:02:48'),
(13, 'broker_gamma',     'hash_013', 'Broker',       3, 'Active',  '2023-02-21 10:55:21'),
(14, 'broker_delta',     'hash_014', 'Broker',       4, 'Blocked', '2023-02-24 16:40:37'),
(15, 'broker_omega',     'hash_015', 'Broker',       5, 'Active',  '2023-02-27 12:33:14'),
(16, 'sales_agent01',    'hash_016', 'SalesAgent',   1, 'Active',  '2023-03-02 09:05:44'),
(17, 'sales_agent02',    'hash_017', 'SalesAgent',   2, 'Active',  '2023-03-03 11:12:08'),
(18, 'sales_agent03',    'hash_018', 'SalesAgent',   3, 'Active',  '2023-03-04 13:20:35'),
(19, 'sales_agent04',    'hash_019', 'SalesAgent',   4, 'Active',  '2023-03-05 15:33:21'),
(20, 'sales_agent05',    'hash_020', 'SalesAgent',   5, 'Blocked', '2023-03-07 10:14:59'),
(21, 'admin_new',        'hash_021', 'Admin',        4, 'Active',  '2023-03-10 08:45:10'),
(22, 'admin_temp',       'hash_022', 'Admin',        5, 'Active',  '2023-03-12 09:32:48'),
(23, 'underwriter_ne',   'hash_023', 'UnderWriter',  6, 'Active',  '2023-03-15 14:05:56'),
(24, 'underwriter_sw',   'hash_024', 'UnderWriter',  7, 'Active',  '2023-03-17 10:28:22'),
(25, 'operations_ahm',   'hash_025', 'Operational',  8, 'Active',  '2023-03-20 11:55:37'),
(26, 'operations_chn',   'hash_026', 'Operational',  9, 'Blocked', '2023-03-22 17:43:10'),
(27, 'broker_city',      'hash_027', 'Broker',      10, 'Active',  '2023-03-24 10:25:30'),
(28, 'broker_union',     'hash_028', 'Broker',      11, 'Active',  '2023-03-26 13:41:08'),
(29, 'sales_agent06',    'hash_029', 'SalesAgent',  12, 'Active',  '2023-03-28 09:15:50'),
(30, 'sales_agent07',    'hash_030', 'SalesAgent',  13, 'Active',  '2023-03-29 10:22:33');
INSERT INTO Regions (region_id, region_name, description) VALUES
(1,  'North Zone',           'Includes Delhi, Haryana, Punjab, and surrounding areas'),
(2,  'South Zone',           'Includes Tamil Nadu, Kerala, Karnataka, Andhra Pradesh'),
(3,  'East Zone',            'Includes West Bengal, Odisha, Bihar, Jharkhand'),
(4,  'West Zone',            'Includes Maharashtra, Gujarat, Goa'),
(5,  'Central Zone',         'Includes Madhya Pradesh and Chhattisgarh'),
(6,  'North-East Zone',      'Includes Assam, Manipur, Meghalaya, Nagaland'),
(7,  'South-West Zone',      'Coastal and Western belt region'),
(8,  'Ahmedabad Region',     'Covers Ahmedabad and nearby Gujarat cities'),
(9,  'Chennai Region',       'Tamil Nadu capital and nearby districts'),
(10, 'Delhi Region',         'National Capital Region of India'),
(11, 'Hyderabad Region',     'Covers Hyderabad and Telangana districts'),
(12, 'Kolkata Region',       'Covers Kolkata and parts of West Bengal'),
(13, 'Lucknow Region',       'Covers Uttar Pradesh capital and nearby towns'),
(14, 'Jaipur Region',        'Covers Rajasthan and surrounding areas'),
(15, 'Bhopal Region',        'Covers Madhya Pradesh capital region'),
(16, 'Indore Region',        'Major business hub in Madhya Pradesh'),
(17, 'Surat Region',         'Textile hub and major city in Gujarat'),
(18, 'Nagpur Region',        'Central India key region, Maharashtra'),
(19, 'Coimbatore Region',    'Industrial city in Tamil Nadu'),
(20, 'Patna Region',         'Covers capital of Bihar and nearby districts'),
(21, 'Bhubaneswar Region',   'Covers capital of Odisha and coastal region'),
(22, 'Chandigarh Region',    'Union territory and Punjab-Haryana hub'),
(23, 'Ranchi Region',        'Covers Jharkhand capital and nearby mining towns'),
(24, 'Dehradun Region',      'Capital city of Uttarakhand'),
(25, 'Thiruvananthapuram',   'Kerala state capital region'),
(26, 'Kochi Region',         'Major port city and financial hub of Kerala'),
(27, 'Noida Region',         'Part of NCR - major IT and business hub'),
(28, 'Gurgaon Region',       'NCR region with business and insurance clusters'),
(29, 'Vadodara Region',      'Industrial and cultural city of Gujarat'),
(30, 'Pune Region',          'Technology and education hub of Maharashtra');

-- 3 CUSTOMERS TABLE
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address, created_at) VALUES
(1,  'Ravi',       'Kumar',       'ravi.kumar@example.com',       '9876543210', '12 MG Road, Bengaluru',          '2023-01-05 09:15:00'),
(2,  'Priya',      'Sharma',      'priya.sharma@example.com',     '9823456789', '45 Ring Road, New Delhi',        '2023-01-06 10:05:00'),
(3,  'Amit',       'Patel',       'amit.patel@example.com',       '9898989898', '202 LBS Marg, Mumbai',           '2023-01-07 14:25:00'),
(4,  'Sneha',      'Reddy',       'sneha.reddy@example.com',      '9845098765', '87 Jubilee Hills, Hyderabad',    '2023-01-08 11:30:00'),
(5,  'Rahul',      'Verma',       'rahul.verma@example.com',      '9812345678', '56 Civil Lines, Lucknow',        '2023-01-09 12:00:00'),
(6,  'Kavita',     'Menon',       'kavita.menon@example.com',     '9876501234', '23 MG Road, Kochi',              '2023-01-10 15:45:00'),
(7,  'Vikram',     'Singh',       'vikram.singh@example.com',     '9897012345', '112 Nehru Nagar, Jaipur',        '2023-01-11 09:40:00'),
(8,  'Deepika',    'Nair',        'deepika.nair@example.com',     '9800012345', '77 Baner Road, Pune',            '2023-01-12 10:25:00'),
(9,  'Arjun',      'Das',         'arjun.das@example.com',        '9833012345', '9 Park Street, Kolkata',         '2023-01-13 13:15:00'),
(10, 'Meera',      'Joshi',       'meera.joshi@example.com',      '9822012345', '4 Anna Salai, Chennai',          '2023-01-14 09:55:00'),
(11, 'Rohit',      'Sinha',       'rohit.sinha@example.com',      '9811112345', '22 Boring Road, Patna',          '2023-01-15 14:10:00'),
(12, 'Ananya',     'Ghosh',       'ananya.ghosh@example.com',     '9800112233', '33 Salt Lake, Kolkata',          '2023-01-16 08:50:00'),
(13, 'Manish',     'Kumar',       'manish.kumar@example.com',     '9823123456', '88 Sector 18, Noida',            '2023-01-17 09:20:00'),
(14, 'Divya',      'Iyer',        'divya.iyer@example.com',       '9845012346', '77 Cathedral Road, Chennai',     '2023-01-18 10:05:00'),
(15, 'Suresh',     'Rao',         'suresh.rao@example.com',       '9888012345', '43 Residency Road, Bengaluru',   '2023-01-19 11:35:00'),
(16, 'Pooja',      'Desai',       'pooja.desai@example.com',      '9876012345', '12 Race Course, Vadodara',       '2023-01-20 09:10:00'),
(17, 'Nikhil',     'Chopra',      'nikhil.chopra@example.com',    '9812233445', '59 Connaught Place, Delhi',      '2023-01-21 12:30:00'),
(18, 'Swati',      'Mishra',      'swati.mishra@example.com',     '9833445566', '5 Hazratganj, Lucknow',          '2023-01-22 14:25:00'),
(19, 'Karan',      'Gill',        'karan.gill@example.com',       '9819988776', '101 Sector 17, Chandigarh',      '2023-01-23 10:50:00'),
(20, 'Ritika',     'Shah',        'ritika.shah@example.com',      '9878887770', '7 Law Garden, Ahmedabad',        '2023-01-24 11:55:00'),
(21, 'Aditya',     'Bose',        'aditya.bose@example.com',      '9811001100', '42 Park Circus, Kolkata',        '2023-01-25 09:35:00'),
(22, 'Isha',       'Pillai',      'isha.pillai@example.com',      '9822202200', '23 MG Road, Thiruvananthapuram', '2023-01-26 16:45:00'),
(23, 'Harish',     'Mehta',       'harish.mehta@example.com',     '9812341200', '18 Marine Drive, Mumbai',        '2023-01-27 13:15:00'),
(24, 'Sanjana',    'Tiwari',      'sanjana.tiwari@example.com',   '9812312345', '44 Rajpath, New Delhi',          '2023-01-28 09:25:00'),
(25, 'Ashok',      'Naidu',       'ashok.naidu@example.com',      '9820001112', '18 Kukatpally, Hyderabad',       '2023-01-29 15:40:00'),
(26, 'Bhavna',     'Rana',        'bhavna.rana@example.com',      '9812234567', '19 Sector 5, Chandigarh',        '2023-01-30 09:55:00'),
(27, 'Pranav',     'Jain',        'pranav.jain@example.com',      '9823123210', '16 Bandra West, Mumbai',         '2023-02-01 08:45:00'),
(28, 'Tanya',      'Kapoor',      'tanya.kapoor@example.com',     '9812123412', '9 Saket, New Delhi',             '2023-02-02 09:10:00'),
(29, 'Aarav',      'Bhatt',       'aarav.bhatt@example.com',      '9812456123', '5 Ellis Bridge, Ahmedabad',      '2023-02-03 12:20:00'),
(30, 'Neha',       'Reddy',       'neha.reddy@example.com',       '9845612345', '55 Jubilee Hills, Hyderabad',    '2023-02-04 13:15:00');

-- 4 vehicles table
CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    registration_no VARCHAR(50) NOT NULL UNIQUE,
    make VARCHAR(100),
    model VARCHAR(100),
    year YEAR,
    chassis_no VARCHAR(100) UNIQUE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Vehicles (vehicle_id, customer_id, registration_no, make, model, year, chassis_no) VALUES
(1,  1,  'KA01AB1234', 'Maruti Suzuki',  'Swift',           2020, 'CHS1234001'),
(2,  2,  'DL05CD4321', 'Hyundai',        'Creta',           2021, 'CHS1234002'),
(3,  3,  'MH12EF5678', 'Tata',           'Nexon',           2019, 'CHS1234003'),
(4,  4,  'TS09GH6789', 'Honda',          'City',            2020, 'CHS1234004'),
(5,  5,  'UP32IJ8765', 'Toyota',         'Innova Crysta',   2018, 'CHS1234005'),
(6,  6,  'KL07KL2345', 'Renault',        'Kwid',            2021, 'CHS1234006'),
(7,  7,  'RJ14LM6543', 'Mahindra',       'XUV500',          2019, 'CHS1234007'),
(8,  8,  'MH14NO4321', 'Hyundai',        'Venue',           2020, 'CHS1234008'),
(9,  9,  'WB02PQ5432', 'Honda',          'Amaze',           2022, 'CHS1234009'),
(10, 10, 'TN09RS7890', 'Ford',           'Ecosport',        2021, 'CHS1234010'),
(11, 11, 'BR01TT1122', 'Tata',           'Altroz',          2020, 'CHS1234011'),
(12, 12, 'WB10UU9988', 'Maruti Suzuki',  'Baleno',          2021, 'CHS1234012'),
(13, 13, 'UP16VV8877', 'Hyundai',        'i20',             2020, 'CHS1234013'),
(14, 14, 'TN02WW7766', 'Toyota',         'Yaris',           2019, 'CHS1234014'),
(15, 15, 'KA03XX6655', 'Kia',            'Seltos',          2021, 'CHS1234015'),
(16, 16, 'GJ06YY5544', 'Mahindra',       'Scorpio',         2020, 'CHS1234016'),
(17, 17, 'DL01ZZ4433', 'Honda',          'WR-V',            2019, 'CHS1234017'),
(18, 18, 'UP32AA3322', 'Ford',           'Aspire',          2020, 'CHS1234018'),
(19, 19, 'CH01BB2211', 'Tata',           'Harrier',         2021, 'CHS1234019'),
(20, 20, 'GJ01CC1100', 'Hyundai',        'Verna',           2021, 'CHS1234020'),
(21, 21, 'WB08DD2233', 'Maruti Suzuki',  'Dzire',           2019, 'CHS1234021'),
(22, 22, 'KL11EE3344', 'Toyota',         'Glanza',          2022, 'CHS1234022'),
(23, 23, 'MH01FF4455', 'Hyundai',        'Aura',            2020, 'CHS1234023'),
(24, 24, 'DL04GG5566', 'Tata',           'Tiago',           2021, 'CHS1234024'),
(25, 25, 'TS07HH6677', 'Maruti Suzuki',  'Celerio',         2020, 'CHS1234025'),
(26, 26, 'CH04II7788', 'Mahindra',       'Thar',            2021, 'CHS1234026'),
(27, 27, 'MH02JJ8899', 'Honda',          'Jazz',            2020, 'CHS1234027'),
(28, 28, 'DL07KK9900', 'Kia',            'Carens',          2022, 'CHS1234028'),
(29, 29, 'GJ05LL1010', 'Toyota',         'Camry',           2021, 'CHS1234029'),
(30, 30, 'TS10MM2020', 'Hyundai',        'i10 Grand',       2020, 'CHS1234030');


-- 5 policies table
CREATE TABLE Policies (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_number VARCHAR(50) NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    broker_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    premium_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (broker_id) REFERENCES Users(user_id),
    CHECK (status IN ('Active','Expired','Cancelled'))
);
INSERT INTO Policies (policy_id, policy_number, customer_id, vehicle_id, broker_id, start_date, end_date, premium_amount, status)
VALUES
(1,  'POL2023MH0001',  1,  1,  11, '2023-01-10', '2024-01-09',  8500.00,  'Active'),
(2,  'POL2023DL0002',  2,  2,  12, '2023-01-12', '2024-01-11', 10500.00,  'Active'),
(3,  'POL2023MH0003',  3,  3,  13, '2023-01-15', '2024-01-14',  9200.00,  'Active'),
(4,  'POL2023TS0004',  4,  4,  14, '2023-01-18', '2024-01-17', 11000.00,  'Active'),
(5,  'POL2023UP0005',  5,  5,  15, '2023-01-20', '2024-01-19', 12800.00,  'Active'),
(6,  'POL2023KL0006',  6,  6,  11, '2023-01-22', '2024-01-21',  7600.00,  'Active'),
(7,  'POL2023RJ0007',  7,  7,  12, '2023-01-25', '2024-01-24', 10200.00,  'Active'),
(8,  'POL2023MH0008',  8,  8,  13, '2023-01-27', '2024-01-26',  9700.00,  'Active'),
(9,  'POL2023WB0009',  9,  9,  14, '2023-01-30', '2024-01-29',  8300.00,  'Active'),
(10, 'POL2023TN0010', 10, 10,  15, '2023-02-02', '2024-02-01', 11100.00,  'Active'),
(11, 'POL2023BR0011', 11, 11,  11, '2023-02-05', '2024-02-04',  8700.00,  'Active'),
(12, 'POL2023WB0012', 12, 12,  12, '2023-02-06', '2024-02-05',  9400.00,  'Active'),
(13, 'POL2023UP0013', 13, 13,  13, '2023-02-07', '2024-02-06',  9800.00,  'Active'),
(14, 'POL2023TN0014', 14, 14,  14, '2023-02-08', '2024-02-07', 12000.00,  'Active'),
(15, 'POL2023KA0015', 15, 15,  15, '2023-02-09', '2024-02-08', 13500.00,  'Active'),
(16, 'POL2023GJ0016', 16, 16,  11, '2023-02-10', '2024-02-09',  9500.00,  'Active'),
(17, 'POL2023DL0017', 17, 17,  12, '2023-02-11', '2024-02-10', 10750.00,  'Active'),
(18, 'POL2023UP0018', 18, 18,  13, '2023-02-12', '2024-02-11',  8700.00,  'Active'),
(19, 'POL2023CH0019', 19, 19,  14, '2023-02-13', '2024-02-12', 11200.00,  'Active'),
(20, 'POL2023GJ0020', 20, 20,  15, '2023-02-14', '2024-02-13', 10100.00,  'Active'),
(21, 'POL2023WB0021', 21, 21,  11, '2023-02-15', '2024-02-14',  7500.00,  'Expired'),
(22, 'POL2023KL0022', 22, 22,  12, '2023-02-16', '2024-02-15',  8700.00,  'Expired'),
(23, 'POL2023MH0023', 23, 23,  13, '2023-02-17', '2024-02-16', 11250.00,  'Active'),
(24, 'POL2023DL0024', 24, 24,  14, '2023-02-18', '2024-02-17',  8900.00,  'Cancelled'),
(25, 'POL2023TS0025', 25, 25,  15, '2023-02-19', '2024-02-18',  9600.00,  'Active'),
(26, 'POL2023CH0026', 26, 26,  11, '2023-02-20', '2024-02-19', 11500.00,  'Active'),
(27, 'POL2023MH0027', 27, 27,  12, '2023-02-21', '2024-02-20', 10900.00,  'Active'),
(28, 'POL2023DL0028', 28, 28,  13, '2023-02-22', '2024-02-21', 10250.00,  'Active'),
(29, 'POL2023GJ0029', 29, 29,  14, '2023-02-23', '2024-02-22', 11800.00,  'Active'),
(30, 'POL2023TS0030', 30, 30,  15, '2023-02-24', '2024-02-23',  8800.00,  'Active');

-- 6 quote table
CREATE TABLE Quotes (
    quote_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    quote_date DATETIME  DEFAULT CURRENT_TIMESTAMP,
    coverage_type VARCHAR(20) NOT NULL,
    estimated_premium DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    CHECK (coverage_type IN ('Comprehensive','ThirdParty'))
);
INSERT INTO Quotes (quote_id, customer_id, vehicle_id, quote_date, coverage_type, estimated_premium) VALUES
(1,  1,  1,  '2023-01-05', 'Comprehensive',  8400.00),
(2,  2,  2,  '2023-01-08', 'Comprehensive', 10300.00),
(3,  3,  3,  '2023-01-10', 'ThirdParty',     9100.00),
(4,  4,  4,  '2023-01-14', 'Comprehensive', 10800.00),
(5,  5,  5,  '2023-01-16', 'Comprehensive', 12600.00),
(6,  6,  6,  '2023-01-19', 'ThirdParty',     7400.00),
(7,  7,  7,  '2023-01-21', 'Comprehensive', 10000.00),
(8,  8,  8,  '2023-01-24', 'ThirdParty',     9500.00),
(9,  9,  9,  '2023-01-26', 'Comprehensive',  8200.00),
(10, 10, 10, '2023-01-29', 'Comprehensive', 11000.00),
(11, 11, 11, '2023-02-01', 'ThirdParty',     8600.00),
(12, 12, 12, '2023-02-02', 'Comprehensive',  9300.00),
(13, 13, 13, '2023-02-03', 'ThirdParty',     9700.00),
(14, 14, 14, '2023-02-04', 'Comprehensive', 11800.00),
(15, 15, 15, '2023-02-05', 'Comprehensive', 13300.00),
(16, 16, 16, '2023-02-06', 'ThirdParty',     9400.00),
(17, 17, 17, '2023-02-07', 'Comprehensive', 10500.00),
(18, 18, 18, '2023-02-08', 'Comprehensive',  8500.00),
(19, 19, 19, '2023-02-09', 'ThirdParty',    11000.00),
(20, 20, 20, '2023-02-10', 'Comprehensive',  9900.00),
(21, 21, 21, '2023-02-11', 'ThirdParty',     7300.00),
(22, 22, 22, '2023-02-12', 'Comprehensive',  8600.00),
(23, 23, 23, '2023-02-13', 'Comprehensive', 11100.00),
(24, 24, 24, '2023-02-14', 'ThirdParty',     8700.00),
(25, 25, 25, '2023-02-15', 'Comprehensive',  9400.00),
(26, 26, 26, '2023-02-16', 'Comprehensive', 11300.00),
(27, 27, 27, '2023-02-17', 'Comprehensive', 10800.00),
(28, 28, 28, '2023-02-18', 'ThirdParty',     9900.00),
(29, 29, 29, '2023-02-19', 'Comprehensive', 11500.00),
(30, 30, 30, '2023-02-20', 'Comprehensive',  8700.00);
select*from Quotes;
-- 7 payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL,
    currency VARCHAR(10) DEFAULT 'INR',
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id),
    CHECK (payment_method IN ('CreditCard','DebitCard','BankTransfer','Cash'))
);
INSERT INTO Payments (payment_id, policy_id, amount, payment_date, payment_method, currency) VALUES
(1,  1,  8500.00,  '2023-01-10 10:15:00', 'CreditCard',   'INR'),
(2,  2, 10500.00,  '2023-01-12 11:20:00', 'DebitCard',    'INR'),
(3,  3,  9200.00,  '2023-01-15 09:45:00', 'BankTransfer', 'INR'),
(4,  4, 11000.00,  '2023-01-18 14:30:00', 'CreditCard',   'INR'),
(5,  5, 12800.00,  '2023-01-20 10:05:00', 'Cash',         'INR'),
(6,  6,  7600.00,  '2023-01-22 13:20:00', 'CreditCard',   'INR'),
(7,  7, 10200.00,  '2023-01-25 16:00:00', 'DebitCard',    'INR'),
(8,  8,  9700.00,  '2023-01-27 11:10:00', 'BankTransfer', 'INR'),
(9,  9,  8300.00,  '2023-01-30 10:40:00', 'Cash',         'INR'),
(10, 10, 11100.00, '2023-02-02 09:55:00', 'CreditCard',   'INR'),
(11, 11,  8700.00, '2023-02-05 11:25:00', 'DebitCard',    'INR'),
(12, 12,  9400.00, '2023-02-06 12:40:00', 'BankTransfer', 'INR'),
(13, 13,  9800.00, '2023-02-07 10:05:00', 'Cash',         'INR'),
(14, 14, 12000.00, '2023-02-08 15:00:00', 'CreditCard',   'INR'),
(15, 15, 13500.00, '2023-02-09 09:50:00', 'DebitCard',    'INR'),
(16, 16,  9500.00, '2023-02-10 13:05:00', 'BankTransfer', 'INR'),
(17, 17, 10750.00, '2023-02-11 11:15:00', 'CreditCard',   'INR'),
(18, 18,  8700.00, '2023-02-12 10:30:00', 'Cash',         'INR'),
(19, 19, 11200.00, '2023-02-13 14:50:00', 'DebitCard',    'INR'),
(20, 20, 10100.00, '2023-02-14 16:20:00', 'BankTransfer', 'INR'),
(21, 21,  7500.00, '2023-02-15 09:25:00', 'CreditCard',   'INR'),
(22, 22,  8700.00, '2023-02-16 10:05:00', 'Cash',         'INR'),
(23, 23, 11250.00, '2023-02-17 13:15:00', 'DebitCard',    'INR'),
(24, 24,  8900.00, '2023-02-18 12:10:00', 'BankTransfer', 'INR'),
(25, 25,  9600.00, '2023-02-19 11:45:00', 'CreditCard',   'INR'),
(26, 26, 11500.00, '2023-02-20 15:35:00', 'DebitCard',    'INR'),
(27, 27, 10900.00, '2023-02-21 10:20:00', 'BankTransfer', 'INR'),
(28, 28, 10250.00, '2023-02-22 14:30:00', 'Cash',         'INR'),
(29, 29, 11800.00, '2023-02-23 16:10:00', 'CreditCard',   'INR'),
(30, 30,  8800.00, '2023-02-24 09:40:00', 'DebitCard',    'INR');
show tables;

-- 8 claims table
create TABLE Claims (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT NOT NULL,
    claim_date DATE NOT NULL,
    claim_amount DECIMAL(10,2),
    claim_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id),
    CHECK (claim_status IN ('Pending','Approved','Rejected'))
);
INSERT INTO Claims (claim_id, policy_id, claim_date, claim_amount, claim_status) VALUES
(1,  1,  '2023-07-12',  5500.00, 'Approved'),
(2,  2,  '2023-08-03',  7200.00, 'Approved'),
(3,  3,  '2023-09-18',  4800.00, 'Pending'),
(4,  4,  '2023-05-25',  9600.00, 'Rejected'),
(5,  5,  '2023-11-09', 10500.00, 'Approved'),
(6,  6,  '2023-04-17',  3100.00, 'Pending'),
(7,  7,  '2023-08-21',  8600.00, 'Approved'),
(8,  8,  '2023-10-04',  6900.00, 'Approved'),
(9,  9,  '2023-12-02',  3000.00, 'Pending'),
(10, 10, '2023-03-12',  9700.00, 'Approved'),
(11, 11, '2023-04-10',  5400.00, 'Rejected'),
(12, 12, '2023-07-08',  6400.00, 'Approved'),
(13, 13, '2023-06-06',  7800.00, 'Approved'),
(14, 14, '2023-05-13',  4500.00, 'Rejected'),
(15, 15, '2023-09-20', 12000.00, 'Approved'),
(16, 16, '2023-07-25',  5600.00, 'Approved'),
(17, 17, '2023-08-15',  9400.00, 'Pending'),
(18, 18, '2023-09-05',  4900.00, 'Rejected'),
(19, 19, '2023-10-29',  8300.00, 'Approved'),
(20, 20, '2023-05-02',  6100.00, 'Pending'),
(21, 21, '2023-03-25',  3500.00, 'Rejected'),
(22, 22, '2023-04-19',  7000.00, 'Approved'),
(23, 23, '2023-07-02',  8400.00, 'Approved'),
(24, 24, '2023-09-30',  5600.00, 'Pending'),
(25, 25, '2023-06-17',  9200.00, 'Approved'),
(26, 26, '2023-08-10',  5000.00, 'Rejected'),
(27, 27, '2023-09-07',  7500.00, 'Approved'),
(28, 28, '2023-05-28',  4000.00, 'Pending'),
(29, 29, '2023-07-15',  9700.00, 'Approved'),
(30, 30, '2023-11-12',  5600.00, 'Approved');

-- 9 addoncoverage table
CREATE TABLE AddOnCoverage (
    addon_id INT AUTO_INCREMENT PRIMARY KEY,
    addon_name VARCHAR(100) NOT NULL,
    description TEXT,
    rate DECIMAL(5,2) NOT NULL
);
INSERT INTO AddOnCoverage (addon_id, addon_name, description, rate) VALUES
(1,  'Zero Depreciation Cover',          'Covers full cost of replaced vehicle parts without depreciation.',               12.50),
(2,  'Engine Protection Cover',          'Protects against engine damage from water ingression or oil leakage.',           8.75),
(3,  'Roadside Assistance',              '24x7 help in case of vehicle breakdown, towing, or fuel shortage.',              4.50),
(4,  'Return to Invoice Cover',          'Pays the difference between insured value and invoice value during total loss.', 10.00),
(5,  'No Claim Bonus Protection',        'Keeps NCB intact even after a single claim in a policy year.',                   6.00),
(6,  'Consumables Cover',                'Covers small consumable parts like nuts, bolts, and oil in case of a claim.',    3.25),
(7,  'Tyre Protection Cover',            'Covers repair or replacement of damaged tyres and tubes.',                       5.50),
(8,  'Key Replacement Cover',            'Covers cost of replacing lost or stolen keys and locks.',                        2.80),
(9,  'Passenger Cover',                  'Provides additional cover for passengers traveling in the insured vehicle.',      7.50),
(10, 'Personal Accident Cover',          'Covers the owner-driver for accidental death or permanent disability.',          8.00),
(11, 'Daily Allowance Benefit',          'Provides daily transport allowance when the vehicle is in repair.',              3.75),
(12, 'Loss of Personal Belongings',      'Compensates for theft or damage of personal items kept in the vehicle.',          2.50),
(13, 'Emergency Transport & Hotel',      'Covers accommodation and travel costs in case of a major breakdown.',            4.00),
(14, 'Invoice Value Protection',         'Restores full invoice value for total loss or theft of vehicle.',                9.25),
(15, 'Electrical Accessories Cover',     'Insures additional electrical accessories fitted in the vehicle.',                2.90),
(16, 'Non-Electrical Accessories Cover', 'Insures non-electrical accessories such as seat covers or alloy wheels.',         2.75),
(17, 'Depreciation Reimbursement',       'Reimburses the depreciation deducted during parts replacement.',                  11.00),
(18, 'Engine Secure Plus',               'Extensive protection for internal engine and gearbox failures.',                  7.25),
(19, 'Fuel Assistance Cover',            'Provides on-road fuel delivery service in case of an empty tank.',                2.00),
(20, 'Towing and Crane Cover',           'Covers cost of towing vehicle to the nearest garage after breakdown.',            3.00),
(21, 'Legal Liability to Paid Driver',   'Covers legal liability towards employed paid driver.',                            1.80),
(22, 'Hospital Cash Benefit',            'Provides daily cash allowance during hospitalization post accident.',             5.00),
(23, 'Ambulance Charge Cover',           'Reimburses ambulance charges in case of an accident.',                            2.40),
(24, 'Engine Secure Advanced',           'Covers advanced mechanical breakdown protection for engines.',                    8.20),
(25, 'Return to Value Cover',            'Provides return of vehicle value at market price upon total loss.',               6.80),
(26, 'Replacement Vehicle Cover',        'Provides temporary replacement vehicle during major repair.',                     4.25),
(27, 'Hydrostatic Lock Cover',           'Covers damage caused by hydrostatic lock due to flooding.',                       5.75),
(28, 'Invoice Return Cover',             'Covers full invoice value minus depreciation during total loss.',                 9.00),
(29, 'Driver Cover',                     'Additional personal accident cover for hired or employed driver.',                3.60),
(30, 'Garage Cash Benefit',              'Covers daily allowance when the vehicle is under repair at a garage.',            4.10);

-- 10 policyaddon table
CREATE TABLE PolicyAddOn (
    policy_id INT NOT NULL,
    addon_id INT NOT NULL,
    PRIMARY KEY (policy_id, addon_id),
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id),
    FOREIGN KEY (addon_id) REFERENCES AddOnCoverage(addon_id)
);
INSERT INTO PolicyAddOn (policy_id, addon_id) VALUES
(1,  1),   -- Zero Depreciation
(1,  3),   -- Roadside Assistance
(2,  1),
(3,  2),
(3,  6),
(4,  4),
(5,  1),
(5,  5),
(6,  3),
(7,  1),
(8,  8),
(9,  9),
(10, 1),
(10, 2),
(11, 3),
(12, 6),
(13, 4),
(14, 1),
(14, 7),
(15, 5),
(16, 1),
(16, 9),
(17, 10),
(18, 3),
(19, 1),
(20, 2),
(20, 6),
(21, 4),
(22, 1),
(23, 3),
(24, 11),
(25, 15),
(26, 17),
(27, 1),
(27, 8),
(28, 12),
(29, 1),
(29, 4),
(30, 3);

show tables;
select*from vehicles;
-- Source - https://stackoverflow.com/a
-- Posted by Joseadrian, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-01-08, License - CC BY-SA 3.0

SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'motor_insurance_policy';






