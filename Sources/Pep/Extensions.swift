//
//  Extensions.swift
//  Pep
//
//  Created by Alper Tabak on 2.10.2020.
//

import UIKit

public extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     alignment: Alignment = .fill,
                     distribution: Distribution = .fill,
                     spacing: CGFloat = 0.0,
                     layoutMargins: UIEdgeInsets? = nil) {
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        if let layoutMargins = layoutMargins {
            self.isLayoutMarginsRelativeArrangement = true
            self.layoutMargins = layoutMargins
        }
    }
    
}

public extension UILabel {
    
    convenience init(text: String? = nil,
                     textColor: UIColor = .white,
                     font: UIFont,
                     backgroundColor: UIColor = .clear,
                     textAlignment: NSTextAlignment,
                     lineBreakMode: NSLineBreakMode = .byWordWrapping,
                     numberOfLines: Int = 1) {
        
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.textAlignment = textAlignment
        self.lineBreakMode = lineBreakMode
        self.numberOfLines = numberOfLines
    }
}

public extension UIImageView {
    
    convenience init(image: UIImage? = nil,
                     contentMode: UIView.ContentMode = .scaleAspectFit) {
        
        self.init()
        self.contentMode = contentMode
        self.image = image
    }
}

public extension UITabBarItem {
    
    static func makeTabBarItem(
        title: String,
        image: UIImage?,
        selectedImage: UIImage?) -> UITabBarItem? {
        guard let image = image, let selectedImage = selectedImage else {
            return nil
        }
        
        let renderedImage = image.withRenderingMode(.alwaysOriginal)
        
        let renderedSelectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        
        let tabBarItem = UITabBarItem(title: title, image: renderedImage, selectedImage: renderedSelectedImage)
        
        return tabBarItem
    }
}
