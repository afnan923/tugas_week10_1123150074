import 'package:flutter/material.dart';
import 'package:firebase_latihan/domain/prediction_request.dart';
import 'package:firebase_latihan/viewmodel/prediction_view_model.dart';

class PredictionFormPage extends StatefulWidget {
  final PredictionViewModel viewModel;

  const PredictionFormPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<PredictionFormPage> createState() => _PredictionFormPageState();
}

class _PredictionFormPageState extends State<PredictionFormPage> {
  DateTime? selectedDate;
  PredictionFocus? selectedFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date Picker
            ListTile(
              title: Text(
                selectedDate == null
                    ? 'Select Date of Birth'
                    : selectedDate!
                        .toIso8601String()
                        .split('T')
                        .first,
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),

            const SizedBox(height: 12),

            // Focus Dropdown
            DropdownButtonFormField<PredictionFocus>(
              value: selectedFocus,
              hint: const Text('Select Focus'),
              items: PredictionFocus.values.map((focus) {
                return DropdownMenuItem(
                  value: focus,
                  child: Text(focus.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFocus = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),

            const SizedBox(height: 20),

            // Result State
            ValueListenableBuilder(
              valueListenable: widget.viewModel.state,
              builder: (context, state, _) {
                if (state is PredictionLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is PredictionSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zodiac: ${state.result.zodiac}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(state.result.prediction),
                    ],
                  );
                }

                if (state is PredictionError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void _submit() {
    if (selectedDate == null || selectedFocus == null) return;

    widget.viewModel.submit(
      PredictionRequest(
        dob: selectedDate!,
        focus: selectedFocus!,
      ),
    );
  }
}
