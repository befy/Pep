//
//  PepBar.swift
//  Pep
//
//  Created by befy on 2.10.2020.
//

import UIKit

protocol PepBarDelegate: AnyObject {
    func tabSelected(_ tabBar: PepBar, selectedTab index: Int)
}

protocol PepBarType: AnyObject {
    var verticalPadding: CGFloat { get set }
    var indicatorHeight: CGFloat { get set }
    var cornerRadius: CGFloat { get set }
    var barTintColor: UIColor { get set }
    var innerIndicatorColor: UIColor { get set }
    var viewControllers: [UIViewController] { get set }
    
    func didSelectTab(at index: Int)
    func setSelectedIndex(at index: Int)
}

final class PepBar: UIView, PepBarType {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: PepBarDelegate?
    
    private var selectedIndex: Int = 0
    private var previousSelectedIndex: Int = 0
    private let spacing: CGFloat = 8
    
    public var tabBarItems: [PepBarItem] = []
    
    public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            setNeedsDisplay()
        }
    }
    
    public var barTintColor: UIColor = .clear {
        didSet {
            self.backgroundColor = barTintColor
            setNeedsDisplay()
        }
    }
    
    public var viewControllers = [UIViewController]() {
        didSet {
            guard !viewControllers.isEmpty else { return }
            DispatchQueue.main.async {
                self.drawTabs()
                self.didSelectTab(at: 0)
            }
        }
    }
    
    public var innerIndicatorColor: UIColor = .red {
        didSet {
            self.innerCircleView.backgroundColor = innerIndicatorColor
            setNeedsDisplay()
        }
    }
    
    public var verticalPadding: CGFloat = 10.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var indicatorHeight: CGFloat = 60.0
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [],
        axis: .horizontal,
        alignment: .center,
        distribution: .fillEqually,
        spacing: spacing,
        layoutMargins: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    )
    
    private var tabWidth: CGFloat {
        let width: CGFloat = UIScreen.main.bounds.size.width - 32 - 16
        let totalSpace: CGFloat = stackView.spacing * CGFloat((stackView.arrangedSubviews.count - 1))
        return CGFloat(width - totalSpace) / CGFloat(tabBarItems.count)
    }
    
    private lazy var innerCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = innerIndicatorColor
        view.layer.cornerRadius = 18
        return view
    }()
    
    public func didSelectTab(at index: Int) {
        delegate?.tabSelected(self, selectedTab: index)
        if index == selectedIndex { return }
        previousSelectedIndex = selectedIndex
        selectedIndex  = index
        moveTo(index: selectedIndex)
    }
    
    public func setSelectedIndex(at index: Int) {
        self.selectedIndex = index
        self.previousSelectedIndex = index
    }
    
    private func setup() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.layer.masksToBounds = true
        backgroundColor = barTintColor
        addSubview(stackView); addSubview(innerCircleView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        self.bringSubviewToFront(stackView)
    }
    
    private func drawTabs() {
        for (i, vc) in viewControllers.enumerated() {
            let item = tabBarItemFactory(vc, i)
            
            self.tabBarItems.append(item)
            self.stackView.addArrangedSubview(item)
        }
        innerCircleView.frame = indicatorRectArea(x: 8)
    }
    
    private func tabBarItemFactory(_ vc: UIViewController, _ i: Int) -> PepBarItem {
        let item = PepBarItem(item: vc.tabBarItem)
        item.heightAnchor.constraint(equalToConstant: stackView.bounds.maxY - 16).isActive = true
        item.delegate = self
        item.tag = i
        return item
    }
    
    private func moveTo(index: Int) {
        let firstPadding = Int(spacing)
        let paddings = index * Int(spacing)
        let tabs = CGFloat(index) * tabWidth
        let originX = CGFloat(firstPadding + paddings) + tabs
        let frame = indicatorRectArea(x: originX)
        
        let animate = UIViewPropertyAnimator(duration: 0.15, curve: .easeOut) {
            self.innerCircleView.frame = frame
        }
        animate.startAnimation()
    }
    
    private func indicatorRectArea(x: CGFloat) -> CGRect {
        return CGRect(x: x, y: verticalPadding, width: tabWidth, height: indicatorHeight)
    }
    
}

extension PepBar: PepBarItemDelegate {
    func tabSelect(_ view: PepBarItem, tag: Int) {
        didSelectTab(at: tag)
    }
}
