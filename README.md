# 📱 Smart Attendance System (ระบบเช็คชื่อเข้าเรียน)

ระบบเช็คชื่อเข้าเรียนอัจฉริยะ รองรับทั้งอาจารย์และนักศึกษา ประกอบด้วยระบบจัดการวิชา, เปิดรอบเช็คชื่อ, เช็คชื่อด้วยใบหน้า, ส่งออกรายงานเข้าเรียนเป็นไฟล์ Excel และหน้าโปรไฟล์

---

## 🏗 โครงสร้างโปรเจกต์ (Project Architecture)

โปรเจกต์แบ่งออกเป็น 2 ส่วนหลัก:
- **`Attendance-Backend-main/`**: Backend พัฒนาด้วย **FastAPI (Python)** เชื่อมต่อฐานข้อมูล **MySQL** ให้บริการ RESTful API และ Static Files
- **`Attendance-main/`**: Frontend พัฒนาด้วย **Flutter** รองรับทั้ง **Mobile (Android/iOS)** และ **Web (Chrome)**
- **`attendance_backup.sql`**: ไฟล์ฐานข้อมูลสำรองที่มีโครงสร้างตารางและข้อมูลตัวอย่างเริ่มต้น

---

## ⚡ สรุปคำสั่งติดตั้งแพ็กเกจและจุดที่ต้องแก้ไขเมื่อย้ายเครื่อง (Quick Start & Migration)

### 1. คำสั่งติดตั้งแพ็กเกจและสั่งรัน

- **ฝั่ง Backend (ในโฟลเดอร์ `Attendance-Backend-main`):**
  ```bash
  cd Attendance-Backend-main
  pip install -r requirements.txt
  uvicorn main:app --host 0.0.0.0 --port 8000 --reload
  ```

- **ฝั่ง Frontend (ในโฟลเดอร์ `Attendance-main`):**
  ```bash
  cd Attendance-main
  flutter pub get
  flutter run
  ```
  *(หรือ `flutter run -d chrome` หากต้องการทดสอบบน Google Chrome)*

### 2. จุดที่ต้องแก้ไขเมื่อย้ายไปรันบนเครื่องใหม่ (มีแค่ 2 ไฟล์ / 3 จุด)

1. **`Attendance-Backend-main/main.py` (บรรทัดที่ 50–55):** แก้ `user` และ `password` ในฟังก์ชัน `get_db_connection()` ให้ตรงกับ MySQL ของเครื่องใหม่ (ถ้าใช้ XAMPP ปกติ `password=""`)
2. **`Attendance-Backend-main/main.py` (บรรทัดที่ 1019):** แก้ IP ใน `file_url` (เช่น `http://192.168.1.35:8000/files/{file_name}`) ให้เป็น IP ของเครื่องใหม่ หรือ `localhost` ถ้ารันบนเครื่องเดียวกัน
3. **`Attendance-main/lib/config/api_config.dart` (บรรทัดที่ 3):** แก้ `baseUrl` ให้เป็น IP เครื่องใหม่ (เช่น `http://192.168.X.X:8000` สำหรับมือถือ หรือ `http://localhost:8000` สำหรับ Chrome)

---

## 🛠 สิ่งที่ต้องติดตั้งในเครื่องก่อนเริ่ม (Prerequisites)

1. **Python 3.10+**: [ดาวน์โหลด Python](https://www.python.org/downloads/) *(อย่าลืมติ๊ก Add Python to PATH)*
2. **MySQL Server 8.0+**: เช่น MySQL Server & Workbench หรือ [XAMPP](https://www.apachefriends.org/)
3. **Flutter SDK (Dart 3.x)**: [ดาวน์โหลด Flutter](https://docs.flutter.dev/get-started/install)
4. **Google Chrome** (สำหรับทดสอบรันบน Web) หรือ **Android Studio / มือถือ Android จริง** (สำหรับทดสอบบน Mobile)

---

## 🚀 ขั้นตอนการติดตั้งและการรันระบบ (Setup & Run Guide)

### ขั้นตอนที่ 1: นำเข้าฐานข้อมูล (Database Setup)

1. เปิด MySQL Workbench, phpMyAdmin (XAMPP) หรือ MySQL Command Line Client
2. สร้างฐานข้อมูลชื่อ `attendance_db`:
   ```sql
   CREATE DATABASE attendance_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
3. นำเข้าข้อมูลจากไฟล์ `attendance_backup.sql`:
   - **ผ่าน Command Line / PowerShell:**
     ```bash
     mysql -u root -p attendance_db < attendance_backup.sql
     ```
   - **ผ่าน phpMyAdmin / MySQL Workbench:**
     เลือกฐานข้อมูล `attendance_db` แล้วไปที่เมนู **Import** -> เลือกไฟล์ `attendance_backup.sql` -> กด Go/Start Import

---

### ขั้นตอนที่ 2: ตั้งค่าและรัน Backend (FastAPI)

1. เปิด Terminal / PowerShell แล้วเข้าไปที่โฟลเดอร์ Backend:
   ```bash
   cd Attendance-Backend-main
   ```
2. (แนะนำ) สร้างและเปิดใช้งาน Virtual Environment:
   ```bash
   python -m venv venv
   # สำหรับ Windows (PowerShell):
   venv\Scripts\Activate.ps1
   # หรือ Windows (CMD):
   venv\Scripts\activate.bat
   ```
3. ติดตั้ง Library ที่จำเป็น:
   ```bash
   pip install -r requirements.txt
   ```
4. **ตรวจสอบการตั้งค่าฐานข้อมูล:**
   เปิดไฟล์ `Attendance-Backend-main/main.py` ดูที่ฟังก์ชัน `get_db_connection()` (ประมาณบรรทัดที่ 50):
   ```python
   def get_db_connection():
       return pymysql.connect(
           host="localhost",
           user="root",
           password="YOUR_MYSQL_PASSWORD",  # ⚠️ เปลี่ยนเป็นรหัสผ่าน MySQL เครื่องคุณ
           database="attendance_db",
           cursorclass=pymysql.cursors.DictCursor
       )
   ```
5. **เริ่มรัน Backend Server:**
   ```bash
   uvicorn main:app --host 0.0.0.0 --port 8000 --reload
   ```
6. **ทดสอบว่า Backend ใช้งานได้:**
   เปิดเบราว์เซอร์แล้วเข้าไปที่ [http://localhost:8000/docs](http://localhost:8000/docs) จะแสดงหน้า Swagger API Documentation

---

### ขั้นตอนที่ 3: ตั้งค่าและรัน Frontend (Flutter)

1. เปิด Terminal อีกหน้าต่าง แล้วเข้าไปที่โฟลเดอร์ Frontend:
   ```bash
   cd Attendance-main
   ```
2. **ตั้งค่า IP Address ของ Backend:**
   เปิดไฟล์ `Attendance-main/lib/config/api_config.dart`:
   ```dart
   class ApiConfig {
     // 📌 กำหนด URL ของ Backend ตามสภาพแวดล้อมที่รัน
     // กรณีรันบน Chrome (Web): ใช้ 'http://localhost:8000'
     // กรณีรันบน Android Emulator: ใช้ 'http://10.0.2.2:8000'
     // กรณีรันบน มือถือจริง (Real Device): ให้ใช้ IP ของคอมพิวเตอร์ในวง Wi-Fi เดียวกัน เช่น 'http://192.168.1.XX:8000'
     static const String baseUrl = 'http://localhost:8000';
   }
   ```
   > 💡 **วิธีดู IP คอมพิวเตอร์:** เปิด Command Prompt แล้วพิมพ์ `ipconfig` ดูที่ช่อง `IPv4 Address`
3. ติดตั้ง Dependencies ของ Flutter:
   ```bash
   flutter pub get
   ```
4. **สั่งรันแอปพลิเคชัน:**
   - **รันบน Google Chrome (สะดวกและเร็วที่สุด):**
     ```bash
     flutter run -d chrome
     ```
   - **รันบนโทรศัพท์มือถือ Android (เสียบสาย USB เปิด USB Debugging):**
     ```bash
     flutter devices      # ตรวจสอบ Device ID
     flutter run
     ```

---

## 🔑 บัญชีผู้ใช้สำหรับทดสอบ (Test Accounts)

ในฐานข้อมูลตัวอย่างมีบัญชีที่ลงทะเบียนไว้แล้ว สามารถนำไปใช้ล็อกอินได้ทันที:

### 👨‍🏫 บัญชีอาจารย์ (Teacher)
| Username | Password | ชื่อ - นามสกุล | บทบาท (Role) |
| :--- | :--- | :--- | :--- |
| `teacher01` | `123456` | ผศ.ดร.สมชาย ใจดี | อาจารย์ |
| `12345` | `1234` | ผศ.ดร.สมชาย ใจดี | อาจารย์ |
| `123` | `1234` | อาจารย์ทดสอบ | อาจารย์ |

### 👨‍🎓 บัญชีนักศึกษา (Student)
| Username | Password | รหัสนักศึกษา | ชื่อ - นามสกุล | บทบาท (Role) |
| :--- | :--- | :--- | :--- | :--- |
| `student01` | `123456` | 6501001 | นายสมชาย เรียนดี | นักศึกษา |
| `student02` | `123456` | 6501002 | นางสาวสมหญิง ตั้งใจ | นักศึกษา |
| `student03` | `123456` | 6501003 | นายมานพ รักเรียน | นักศึกษา |
| `1234` | `1234` | 13 | นายคุณากร โพธิ์ใบงาม | นักศึกษา |

---

## 💡 ฟีเจอร์เด่นของระบบ (Key Features)

- **ระบบเข้าสู่ระบบแยก Role:** แบ่งการทำงานระหว่างอาจารย์และนักศึกษาอย่างชัดเจน
- **จัดการวิชาและนักศึกษา:** อาจารย์สามารถสร้างวิชา เพิ่ม/ลบรายชื่อนักศึกษา และสร้างรหัสเข้าร่วมวิชา (Join Code) ให้นักศึกษาได้
- **การเช็คชื่อเข้าเรียน:**
  - สแกนหน้า / ถ่ายภาพใบหน้า (รองรับทั้งถ่ายรูปจากกล้องจริง และเลือกรูปจากแกลเลอรี)
  - ตรวจเช็คชื่อแบบระบุสถานะด้วยตนเอง (มา / สาย / ลา / ขาด)
- **ระบบออกรายงาน:** ดูสถิติการเข้าเรียน และ Export เป็นไฟล์ **Excel (.xlsx)** รองรับทั้งบน Web และ Android
- **Responsive Layout:** ปรับแต่งหน้าจอรองรับขนาดจอมือถือทุกขนาดโดยไม่มีปัญหา Pixel Overflow

---

## ❓ การแก้ไขปัญหาเบื้องต้น (Troubleshooting)

1. **มือถือเชื่อมต่อ Backend ไม่ได้ / Connection Refused:**
   - ตรวจสอบว่ามือถือและคอมพิวเตอร์ต่อ Wi-Fi วงเดียวกันหรือไม่
   - ตรวจสอบว่ากำหนด IP ใน `Attendance-main/lib/config/api_config.dart` ถูกต้องตรงกับคอมพิวเตอร์
   - ลองปิด Windows Firewall ชั่วคราว หรือเปิดพอร์ต `8000` ขาเข้า (Inbound Rule)
2. **MySQL Access Denied:**
   - ตรวจสอบ `user` และ `password` ในฟังก์ชัน `get_db_connection()` ของ `Attendance-Backend-main/main.py` ให้ตรงกับเครื่องของคุณ
3. **Flutter Build Android ติดปัญหา NDK หรือ Version:**
   - ตรวจสอบ `android/gradle.properties` มีบรรทัด `kotlin.incremental=false`
   - รัน `flutter clean` แล้วตามด้วย `flutter pub get` ก่อนรันใหม่อีกครั้ง
