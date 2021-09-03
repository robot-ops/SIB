// @dart=2.9
import 'dart:io';

void main(List<String> args) {
  print("Program Console ATM Sederhana");

  login();
  print("=========================");
}
// Buat Contstructor User
class Users {
  String user;
  int saldo;
  int pin;
  int rek;

  Users(this.user, this.pin, this.saldo, this.rek);

  String getUser() {
    return user;
  }

  int getPIN() {
    return pin;
  }

  int getSaldo() {
    return saldo;
  }

  int getRek() {
    return rek;
  }

  setSaldo(int saldo) {
    this.saldo = saldo;
  }
}
// Input Data User kedalam Array List
List<Users> users = [
  Users("Abel", 1234, 1000000, 12345678),
  Users("Bela", 5678, 1500000, 87654321),
  Users("Bale", 9011, 500000, 23456789),
  Users("Bael", 1213, 2500000, 98765432)
];
// Definisikan ArrayList
Users user;
// Menu Login
void login() {
  if (validation()) {
    home();
  } else {
    login();
  }
}
// Validasi PIN
bool validation() {
  bool isLogin = false;
  print("Masukkan PIN");
  stdout.write("");
  var pin = int.parse(stdin.readLineSync());
  for (Users us in users) {
    if (pin == us.getPIN()) {
      user = us;
      isLogin = true;
    }
  }
  return isLogin;
}
// Homepage
void home() {
  print("===============================");
  var use = user.getUser();
  var rekening = user.getRek();
  var balance = user.getSaldo();
  print("Nasabah : $use");
  print("No. Rek : $rekening");
  print("Saldo   : $balance");
  print("");
  print("1. Tarik Tunai");
  print("2. Setor Tunai");
  print("3. Transfer");
  print("4. Keluar");
  stdout.write("Pilih Menu : ");
  menu();
}
// Fungsi tiap menu pada homepage
void menu() {
  var menu = stdin.readLineSync();
  int pilih;
  switch (menu) {
    case "1":
      print("===============================");
      print("Tarik Tunai");
      stdout.write("Masukkan Nominal : ");
      var nominal = int.parse(stdin.readLineSync());
      if (user.getSaldo() > nominal) {
        Saldo(-nominal);
      } else {
        print("Saldo Tidak Cukup");
        print("");
        home();
      }
      print("");
      stdout.write(" APAKAH ANDA INGIN MELAKUKAN TRANSAKSI LAIN?");
      print("\n 1. Ya		 	2. Tidak");
      var pilih = stdin.readLineSync();
      if (pilih == '1') {
        home();
      }
      break;
    case "2":
      print("===============================");
      print("Setor Tunai");
      stdout.write("Masukkan Nominal : ");
      var nominal = int.parse(stdin.readLineSync());
      Saldo(nominal);
      print("");
      stdout.write(" APAKAH ANDA INGIN MELAKUKAN TRANSAKSI LAIN?");
      print("\n 1. Ya		 	2. Tidak");
      var pilih = stdin.readLineSync();
      if (pilih == '1') {
        home();
      }
      break;
    case "3":
      print("===============================");
      print("Transfer");
      stdout.write("Masukkan Nominal : ");
      var nominal = int.parse(stdin.readLineSync());
      stdout.write("Masukkan No.Rek : ");
      var norek = int.parse(stdin.readLineSync());
      if (user.getSaldo() > nominal) {
        trasnfer(nominal, norek);
      } else {
        print("Saldo Tidak Cukup");
        Saldo(nominal);
        print("");
        home();
      }

      print("");
      stdout.write(" APAKAH ANDA INGIN MELAKUKAN TRANSAKSI LAIN?");
      print("\n 1. Ya		 	2. Tidak");
      var pilih = stdin.readLineSync();
      if (pilih == '1') {
        home();
      }
      break;
    case "4":
      login();
      break;
    default:
      home();
      break;
  }
}
// Fungsi transfer
void trasnfer(int nominal, int norek) {
  var user1 = user.getSaldo() - nominal;
  var user2 = user.getSaldo() + nominal;
  user.setSaldo(user1);
  print("Anda berhasil mentransfer uang $nominal  ke Rekening $norek");
  print("sisa saldo anda adalah $user1");
  var rek2;
  if (rek2 == norek) {
    user.setSaldo(user2);
  }
}
// Update Saldo
void Saldo(int nominal) {
  var saldo = user.getSaldo() + nominal;
  print("Saldo $saldo");
  user.setSaldo(saldo);
}
