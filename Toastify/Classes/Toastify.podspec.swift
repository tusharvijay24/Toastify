//
//  Toastify.podspec.swift
//  Toastify
//
//  Created by Tushar on 31/01/25.
//

import Foundation
import UIKit

public class ToastifyManager {
    
    public static let shared = ToastifyManager()
    
    private init() {}
    
    public func showToast(config: ToastConfig) {
        guard let window = UIApplication.shared.windows.first else { return }
        
        let toast = ToastView(config: config)
        toast.show(in: window, duration: config.duration, position: config.position)
    }
    
    public func showMessage(
        _ message: String,
        duration: TimeInterval = 2.0,
        backgroundColor: UIColor = .black,
        textColor: UIColor = .white,
        position: ToastConfig.Position = .bottom,
        animation: Bool = true
    ) {
        let config = ToastConfig(
            message: message,
            duration: duration,
            backgroundColor: backgroundColor,
            textColor: textColor,
            position: position,
            animation: animation
        )
        
        showToast(config: config)
    }
}
