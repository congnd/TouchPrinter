## TouchPrinter
A tiny tool that highlights touches on screen.

<img src="https://media.giphy.com/media/RHoaaVhDUUbqsCI0gk/giphy.gif" width="240"/>

### Installation

#### SwiftPM
You can add TouchPrinter directly to your project via Xcode. 
Or by adding the following line into your `Package.swift`

```Swift
dependencies: [
  .package(url: "https://github.com/congnd/TouchPrinter.git", from: "1.0.0"),
]
```

#### Carthage
Add the following line into your `cartfile`:
```
github "congnd/TouchPrinter"
```

And then run `carthage update`

### Usuage

Import `TouchPrinter` and in your `AppDelegate.swift`'s `application(_, didFinishLaunchingWithOptions)`,
add the following line:
```Swift
TouchPrinter.start()
```

## Contact
Follow and contact me on [Twitter](https://twitter.com/congndcom). 
If you find an issue, just [open a ticket](https://github.com/congnd/TouchPrinter/issues/new). 
Pull requests are warmly welcome as well.

## License
This library is released under the MIT license. See LICENSE for details.
