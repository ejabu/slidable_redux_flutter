# redux_slidable_flutter

Attempt to solve error

```
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/rendering/object.dart': Failed assertion: line 2798 pos 14: '_debugUltimatePreviousSiblingOf(after, equals: _firstChild)': is not true.
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/rendering/object.dart': Failed assertion: line 2798 pos 14: '_debugUltimatePreviousSiblingOf(after, equals: _firstChild)': is not true.
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/rendering/object.dart': Failed assertion: line 2798 pos 14: '_debugUltimatePreviousSiblingOf(after, equals: _firstChild)': is not true.

I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/widgets/framework.dart': Failed assertion: line 3509 pos 14: 'owner._debugCurrentBuildTarget == this': is not true.
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/widgets/framework.dart': Failed assertion: line 3509 pos 14: 'owner._debugCurrentBuildTarget == this': is not true.
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/widgets/framework.dart': Failed assertion: line 3509 pos 14: 'owner._debugCurrentBuildTarget == this': is not true.
I/flutter ( 5427): Another exception was thrown: 'package:flutter/src/widgets/framework.dart': Failed assertion: line 3509 pos 14: 'owner._debugCurrentBuildTarget == this': is not true
```

This occurs when scrolling through ListTiles which wrapped by Slidable.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
