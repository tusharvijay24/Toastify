//
//  ToastifyManager.swift
//  Toastify
//
//  Created by Tushar on 31/01/25.
//

import UIKit

public class ToastifyManager {
    
    public static let shared = ToastifyManager()
    
    private var floatingContainer: UIView?
    private var keyboardHeight: CGFloat = 0
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            keyboardHeight = keyboardFrame.height
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        keyboardHeight = 0
    }

    /// ✅ **Method to Show Toast Using Message String**
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

    /// **Main Method to Show Toast Using Configuration**
    public func showToast(config: ToastConfig) {
        DispatchQueue.main.async { [weak self] in
            guard let window = UIApplication.shared.windows.first else {
                Logger.debug("❌ No window found for displaying toast")
                return
            }
            
            if self?.floatingContainer == nil {
                let container = UIView(frame: window.bounds)
                container.backgroundColor = .clear
                container.isUserInteractionEnabled = false
                window.addSubview(container)
                self?.floatingContainer = container
            }

            let toast = ToastView(config: config)
            Logger.debug("🚀 Showing toast with message: \(config.message)")
            self?.floatingContainer?.addSubview(toast)
            toast.show(in: self?.floatingContainer ?? window, duration: config.duration, position: config.position, keyboardHeight: self?.keyboardHeight ?? 0)
        }
    }
}
