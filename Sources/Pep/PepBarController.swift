//
//  PepBarController.swift
//  Pep
//
//  Created by befy on 2.10.2020.
//

import UIKit

open class PepBarController: UIViewController {
    
    public var viewControllers = [UIViewController]() {
        didSet {
            tabBar.viewControllers = viewControllers
        }
    }
    
    public var cornerRadius: CGFloat = 12.0 {
        didSet {
            tabBar.cornerRadius = cornerRadius
        }
    }
    
    public var backgroundColor: UIColor = .white {
        didSet {
            tabBar.barTintColor = backgroundColor
        }
    }
    
    public var selectedIndex: Int = 0 {
        didSet {
            tabBar.setSelectedIndex(at: selectedIndex)
            tabBar.didSelectTab(at: selectedIndex)
        }
    }
    
    public var indicatorColor: UIColor = .orange {
        didSet {
            tabBar.innerIndicatorColor = indicatorColor
        }
    }
    
    public lazy var tabBarHeight: CGFloat = 80.0
    
    
    private lazy var tabBar: PepBar = {
        let tabBar = PepBar()
        tabBar.cornerRadius = cornerRadius
        tabBar.barTintColor = backgroundColor
        tabBar.delegate = self
        tabBar.viewControllers = viewControllers
        tabBar.verticalPadding = 10
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [containerView, tabBar],
        axis: .vertical,
        alignment: .fill,
        distribution: .fill
    )
    
    private var previousSelectedIndex: Int = 0
    private var selectIndex: Int = 0
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(containerView)
        self.containerView.addSubview(tabBar)
        containerView.bringSubviewToFront(tabBar)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawConstraint()
    }
    
    private func drawConstraint() {
        NSLayoutConstraint.activate([
            tabBar.heightAnchor.constraint(equalToConstant: self.tabBarHeight),
            tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}

extension PepBarController: PepBarDelegate {
    
    func tabSelected(_ tabBar: PepBar, selectedTab index: Int) {
        previousSelectedIndex = selectIndex
        removePreviousViewController(at: previousSelectedIndex)
        selectIndex = index
        addViewController(at: selectIndex)
    }
}

private extension PepBarController {
    
    func removePreviousViewController(at index: Int) {
        let viewController = viewControllers[index]
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        let tabBarItem = item(at: index)
        tabBarItem?.deActive()
    }
    
    func addViewController(at index: Int) {
        let viewController = viewControllers[index]
        addChild(viewController)
        viewController.view.frame = containerView.bounds
        containerView.insertSubview(viewController.view, at: 0)
        viewController.didMove(toParent: self)
        let tabBarItem = item(at: index)
        tabBarItem?.setActive()
    }
    
    private func item(at index: Int) -> PepBarItem? {
        guard tabBar.tabBarItems.indices.contains(index) else { return nil }
        return tabBar.tabBarItems.first(where: { $0.tag == index })
    }
    
}
