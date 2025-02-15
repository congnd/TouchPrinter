//
//  ViewController.swift
//  TouchPrinter
//
//  Created by Nguyen, Cong on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {
  @IBAction func onTapOpen(_ sender: Any) {
    let vc = storyboard!.instantiateViewController(withIdentifier: "ViewController")
    vc.view.backgroundColor = [
      UIColor.systemGreen,
      UIColor.magenta,
      UIColor.orange,
    ].randomElement()
    show(vc, sender: nil)
  }
}
