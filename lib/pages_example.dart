import 'package:filled_text/filled_text.dart';
import 'package:flutter/material.dart';

// Just to check to show/hide the next page button (and update) after the build
class Controller extends ChangeNotifier {
  void update() => notifyListeners();
}

class FilledTextPagesExample extends StatelessWidget {
  final FilledText filledText;
  final Controller nextPageButtonController;

  const FilledTextPagesExample({
    Key? key,
    required this.filledText,
    required this.nextPageButtonController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filled Text Pages Example'),
        actions: [
          AnimatedBuilder(
            animation: nextPageButtonController,
            child: IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () => openNextPage(context),
            ),
            builder: (context, child) {
              return filledText.isTheTextFinished ? const SizedBox() : child!;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(builder: (context, constraints) {
          updateControllerAfterBuild(nextPageButtonController);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FilledTextWidget(filledText: filledText),
              ),
              const SizedBox(height: 4),
              // A space (like an image) between the text
              Container(
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('IMAGE')),
              ),
              Expanded(
                child: FilledTextWidget(
                  filledText: filledText,
                  // Setted due to be the 2nd [FilledTextWidget] in the page
                  builderPosition: 2,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // Used to check if the text finished and show (if true) or hide (if false) the next page button
  void updateControllerAfterBuild(Controller controller) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.update();
    });
  }

  void openNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FilledTextPagesExample(
          filledText: filledText.nextPage,
          nextPageButtonController: nextPageButtonController,
        ),
      ),
    );
  }
}
