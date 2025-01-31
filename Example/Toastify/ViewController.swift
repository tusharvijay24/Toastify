//
//  ViewController.swift
//  Toastify
//
//  Created by tusharvijay24 on 01/31/2025.
//  Copyright (c) 2025 tusharvijay24. All rights reserved.
//

import UIKit
import Toastify

class ViewController: UIViewController {
    
    @IBOutlet weak var txtTesting: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapTest(_ sender: UIButton) {
        view.endEditing(true)
        if txtTesting.text != "" {
            ToastifyManager.shared.showMessage(txtTesting.text ?? "")
        } else {
            ToastifyManager.shared.showMessage(
                "Hello, Toastify!",
                duration: 3.0,
                backgroundColor: .red,
                textColor: .white,
                position: .top
            )
        }
    }
}
