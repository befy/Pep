//
//  PepBarItem.swift
//  Pep
//
//  Created by Alper Tabak on 2.10.2020.
//

import UIKit

protocol PepBarItemDelegate: AnyObject {
    func tabSelect(_ view: PepBarItem, tag: Int)
}

class PepBarItem: UIView {
    
    weak var delegate: PepBarItemDelegate?
    
    private let item: UITabBarItem
    init(item: UITabBarItem) {
        self.item = item
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView = UIImageView(
        image: item.image?.withRenderingMode(.alwaysOriginal),
        contentMode: .scaleAspectFill
    )
    
    private lazy var titleLabel = UILabel(
        text: item.title,
        textColor: .black,
        font: UIFont.systemFont(ofSize: 12, weight: .bold),
        textAlignment: .center
    )
    
    private var centerYConstraint: NSLayoutConstraint?
    
    private func setup() {
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        layer.masksToBounds = true
        addSubview(imageView); addSubview(titleLabel)
        isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2)
        ])
        self.centerYConstraint = imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -6)
        self.centerYConstraint?.isActive = true
    }
    
    public func setActive() {
        updateAnimation(value: true)
    }
    
    public func deActive() {
        updateAnimation(value: false)
    }
    
    private func updateAnimation(value: Bool) {
        let image = (value) ? item.selectedImage : item.image
        let offset: CGFloat = value ? 0 : -6
        
        UIView.transition(with: imageView, duration: 0.15, options: .transitionCrossDissolve) {
            self.imageView.image = image
        }
        
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.titleLabel.isHidden = value
            self.centerYConstraint?.isActive = false
            self.centerYConstraint?.constant = offset
            self.centerYConstraint?.isActive = true
            self.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    @objc private func handleTap(_ touch: UITapGestureRecognizer) {
        delegate?.tabSelect(self, tag: self.tag)
    }
    
}
