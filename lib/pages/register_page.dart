import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/depot_list_selection_page.dart';
import 'package:aerplus_customer/pages/register_result_page.dart';
import 'package:aerplus_customer/services/local/models/local_register_model.dart';
import 'package:aerplus_customer/services/network/authorization_services/api_authorization_service.dart';
import 'package:aerplus_customer/services/network/models/depot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _depotController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool _hidePassword = true;
  bool _hidePasswordConf = true;

  int? selectedDepotId;

  DateTime? _dobUser;

  Future submitRequest() async {
    await APIAuthorizationService(context: context).registerAccount(
      LocalRegisterModel(
        username: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _passwordConfirmationController.text,
        email: _emailController.text,
        name: _nameController.text,
        dob: _dobUser != null ? DateFormat('dd / MM / yyyy').format(_dobUser!) : '',
        address: _addressController.text,
        phone: _phoneController.text,
        depotId: selectedDepotId,
      ),
    ).then((registerResult) {
      if(registerResult == true) {
        MoveTo(
          context: context,
          target: const RegisterResultPage(),
          callback: (_) {
            CloseBack(context: context).go();
          },
        ).go();
      }
    });
  }

  Future selectDOBUser() async {
    await showDatePicker(
      context: context,
      initialDate: _dobUser ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate != null) {
        setState(() {
          _dobUser = pickedDate;
          _dobController.text = DateFormat('dd / MM / yyyy').format(pickedDate);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Akun',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Silahkan lengkapi informasi dibawah ini untuk melanjutkan pendaftaran:',
                        ),
                      ),
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan nama lengkap disini',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Nomor Telepon',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan nomor telepon disini',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      InkWell(
                        onTap: () => selectDOBUser(),
                        child: IgnorePointer(
                          child: TextField(
                            controller: _dobController,
                            decoration: const InputDecoration(
                              hintText: 'Pilih tanggal lahir disini',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Alamat',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan alamat disini',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan email disini',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Depot Yang Sering Dikunjungi',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      InkWell(
                        onTap: () => MoveTo(
                          context: context,
                          target: const DepotListSelectionPage(),
                          callback: (callbackResult) {
                            if(callbackResult != null) {
                              DepotData result = callbackResult;

                              if(result.id != null) {
                                setState(() {
                                  selectedDepotId = result.id;
                                  _depotController.text = result.name ?? 'Unknown Depot';
                                });
                              }
                            }
                          }
                        ).go(),
                        child: IgnorePointer(
                          child: TextField(
                            controller: _depotController,
                            decoration: const InputDecoration(
                              hintText: 'Pilih depot disini',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          hintText: 'Masukan password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: const UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            icon: Icon(
                              _hidePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Konfirmasi Password',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextField(
                        controller: _passwordConfirmationController,
                        obscureText: _hidePasswordConf,
                        decoration: InputDecoration(
                          hintText: 'Masukan ulang password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: const UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePasswordConf = !_hidePasswordConf;
                              });
                            },
                            icon: Icon(
                              _hidePasswordConf ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () => submitRequest(),
              child: const Text(
                'Buat Akun',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}