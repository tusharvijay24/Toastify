//
//  ToastView.swift
//  Toastify
//
//  Created by Tushar on 31/01/25.
//

import UIKit

class ToastView: UIView {
    
    private let messageLabel = UILabel()
    
    init(config: ToastConfig) {
        super.init(frame: .zero)
        
        setupUI(config: config)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(config: ToastConfig) {
        backgroundColor = config.backgroundColor.withAlphaComponent(0.8)
        layer.cornerRadius = 10
        clipsToBounds = true

        messageLabel.text = config.message
        messageLabel.textColor = config.textColor
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0

        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func show(in view: UIView, duration: TimeInterval, position: ToastConfig.Position) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false

        let bottomAnchorConstant: CGFloat
        switch position {
        case .top:
            bottomAnchorConstant = view.safeAreaInsets.top + 50
        case .middle:
            bottomAnchorConstant = view.frame.height / 2
        case .bottom:
            bottomAnchorConstant = view.frame.height - 100
        case .aboveBottom:
            bottomAnchorConstant = view.frame.height - 150
        }

        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomAnchorConstant),
            widthAnchor.constraint(lessThanOrEqualToConstant: view.frame.width - 40)
        ])

        alpha = 0
        UIView.animate(withDuration: 0.3, animations: { self.alpha = 1 })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: { self.alpha = 0 }) { _ in
                self.removeFromSuperview()
            }
        }
    }
}
