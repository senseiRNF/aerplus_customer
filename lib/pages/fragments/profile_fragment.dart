import 'package:flutter/material.dart';

class ProfileFragment extends StatelessWidget {
  final BuildContext context;
  final String? name;
  final String? email;
  final Function onLogout;
  final Function onRefresh;

  const ProfileFragment({
    super.key,
    required this.context,
    this.name,
    this.email,
    required this.onLogout,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 60.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          name ?? 'Unknown User',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          email ?? 'Unknown Email',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Card(
                  elevation: 5.0,
                  child: InkWell(
                    onTap: () => onLogout(),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'Logout Sesi Aplikasi',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}