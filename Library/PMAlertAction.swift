//
//  PMAlertAction.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public enum PMAlertActionStyle {
    
    case `default`
    case cancel
    case custom(UIColor)
    
}

open class PMAlertAction: UIButton {
    
    fileprivate var action: (() -> Void)?
    
    open var actionStyle : PMAlertActionStyle
    
    open var separator = UIImageView()
    
    init() {
        self.actionStyle = .cancel
        super.init(frame: CGRect.zero)
    }
    
    public convenience init(title: String?, style: PMAlertActionStyle, action: (() -> Void)? = nil) {
        self.init()
        
        self.action = action
        self.addTarget(self, action: #selector(PMAlertAction.tapped(_:)), for: .touchUpInside)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        
        self.actionStyle = style
        switch style {
        case .default:
            self.setTitleColor(.gray, for: .normal)
        case .cancel:
            self.setTitleColor(UIColor(red: 255.0/255.0, green: 92.0/255.0, blue: 92.0/255.0, alpha: 1.0), for: .normal)
        case .custom(let color):
            self.setTitleColor(color, for: .normal)
        }
        
        self.addSeparator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(_ sender: PMAlertAction) {
        self.action?()
    }
    
    fileprivate func addSeparator(){
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        separator.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}
