import 'package:firebase_latihan/viewmodel/prediction_form_page.dart';
import 'package:firebase_latihan/viewmodel/prediction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  final PredictionViewModel viewModel;
    const MyLogin({
    super.key,
    required this.viewModel,
  });

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isLoading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text,
      );

      final user = credential.user;

      if (!mounted) return;

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Login Success'),
          content: Text('UID: ${user?.uid}\nEmail: ${user?.email}'),
          actions: [
            TextButton(
              onPressed: () {
  Navigator.of(context, rootNavigator: true).pushReplacement(
    MaterialPageRoute(
      builder: (_) => PredictionFormPage(
        viewModel: widget.viewModel,
      ),
    ),
  );
},


              child: const Text('OK'),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = e.message;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WEL",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "CO",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    "ME",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukan Email Anda",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.red.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Masukan Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.yellow.shade700,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              if (_error != null) ...[
                Text(_error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 8),
              ],
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: SizedBox(
                  height: 25,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Loginin Ajee BRAYYYYY",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
