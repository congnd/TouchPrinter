//
//  TouchPrinter.swift
//  TouchPrinter
//
//  Created by Nguyen, Cong on 2020/12/25.
//

import UIKit

public struct TouchPrinter {
  /// Start touch printer.
  public static func start() {
    UIWindow.swizzle()
  }
}

extension UIWindow {
  static func swizzle() {
    let originalSelector = #selector(sendEvent(_:))
    let swizzledSelector = #selector(swizzled_sendEvent(_:))
    swizzling(UIWindow.self, originalSelector, swizzledSelector)
  }

  @objc func swizzled_sendEvent(_ event: UIEvent) {
    swizzled_sendEvent(event)
    if let touches = event.allTouches {
      drawTouches(touches)
    }
  }
}

private let dot = UIView()
private let dotWindow = PassThroughWindow()

class PassThroughWindow: UIWindow {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    false
  }
}

extension UIWindow {
  func drawTouches(_ touches: Set<UITouch>) {
    if dot.superview == nil {
      dotWindow.rootViewController = UIViewController()
      dotWindow.frame = UIScreen.main.bounds
      dotWindow.isHidden = false
      dotWindow.backgroundColor = .clear
      dotWindow.addSubview(dot)

      dot.backgroundColor = .white
      dot.alpha = 0.7
      dot.frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
      dot.layer.cornerRadius = 20
      dot.dropShadow()
    }

    touches.forEach { touch in
      let location = touch.location(in: window)
      switch touch.phase {
      case .began:
        dot.center = location
        dot.isHidden = false
      case .moved:
        dot.center = location
      default:
        dot.isHidden = true
      }
    }
  }
}

extension UIView {
  func dropShadow() {
    layer.shadowPath = UIBezierPath(ovalIn: bounds).cgPath
    layer.shadowRadius = 3
    layer.shadowOffset = .zero
    layer.shadowOpacity = 1
  }
}

func swizzling(_ c: AnyClass,_ s1: Selector,_ s2: Selector) {
  guard
    let m1 = class_getInstanceMethod(c, s1),
    let m2 = class_getInstanceMethod(c, s2)
  else { return }

  method_exchangeImplementations(m1, m2)
}
