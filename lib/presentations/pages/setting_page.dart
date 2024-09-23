import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_stream_subscriotion/blocs/blocs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fehrenheit (Default: Celsius)'),
          trailing: Switch(
            onChanged: (_) => context.read<TempSettingBloc>().add(const ToggleTempUnitEvent()),
            value: context.watch<TempSettingBloc>().state.tempUnit == TempUnit.celsius ? true : false,
          ),
        ),
      ),
    );
  }
}
