//
//  OneLineAlert.swift
//  OneLineAlert
//
//  Created by AmebaHead on 14/10/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import UIKit

class OneLineAlertView: UIViewController {

    // Title
    var alertTitle: String?
    
    // Message
    var message: String?
    
    // OverlayView
    internal var overlayView = UIView()
    var overlayColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    // ContainerView
    fileprivate var containerView = UIView()
    fileprivate var containerViewBottomConstraint: NSLayoutConstraint?
    
    // AlertView
    internal var alertView = UIView()
    var alertViewBgColor = UIColor(hex: "FFFFFF")
    let alertViewWidth: CGFloat = 400.0
    let alertViewHeight: CGFloat = 200.0
    var alertViewHeightConstraint: NSLayoutConstraint?
    var alertViewPadding: CGFloat = 13.0
    var innerContentWidth: CGFloat = 340.0
    
    // SeparateLine
    let separateLineHeight: CGFloat = 2.0
    
    // TextAreaScrollView
    fileprivate var textAreaScrollView = UIScrollView()
    var textAreaHeight: CGFloat = 0.0
    
    // TextAreaView
    fileprivate var textAreaView = UIView()
    
    // TextContainer
    var textContainer = UIView()
    var textContainerHeightConstraint: NSLayoutConstraint?
    
    // TitleLabel
    var titleLabel = UILabel()
    var titleTextColor = UIColor(hex: "3d454c")
    
    // MessageLabel
    var messageLabel = UILabel()
    var messageTextColor = UIColor(hex: "3d454c")
    
    // ButtonAreaView
    fileprivate var buttonAreaView = UIView()
    var buttonAreaViewHeightConstraint: NSLayoutConstraint?
    var buttonAreaHeight: CGFloat = 0.0
    
    // ButtonContainerView (StackView)
    fileprivate var buttonContainerView = UIStackView()
    var buttonContainerHeightConstraint: NSLayoutConstraint?
    let buttonHeight: CGFloat = 50.0
    var buttonMargin: CGFloat = 0.0
    
    // Actions
    fileprivate(set) var actions: [AnyObject] = []
    
    // Buttons
    var buttons = [UIButton]()
    
    fileprivate var layoutFlag = false
    
    // Initializer
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Delegate
        self.transitioningDelegate = self
        
        // NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(rotatedDevice), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutView(self.presentingViewController)
    }
}


// MARK: - Function
extension OneLineAlertView {
    func currentOrientation() -> UIInterfaceOrientation {
        return UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? .portrait : .landscapeLeft
    }
    
    func layoutView(_ presenting: UIViewController?) {
        if layoutFlag {return}
        layoutFlag = true
        
        // Screen Size
        let screenSize = presenting != nil ? presenting!.view.bounds.size : UIScreen.main.bounds.size
        
        // self.view
        self.view.frame.size = screenSize
        
        // OverlayView
        self.view.addSubview(overlayView)
        
        // ContainerView
        self.view.addSubview(containerView)
        
        // AlertView
        containerView.addSubview(alertView)
        
        // TextAreaScrollView
        alertView.addSubview(textAreaScrollView)
        
        // TextAreaView
        textAreaScrollView.addSubview(textAreaView)
        
        // TextContainer
        textAreaView.addSubview(textContainer)
        
        // ButtonAreaView
        alertView.addSubview(buttonAreaView)
        
        // ButtonContainer
        buttonAreaView.addSubview(buttonContainerView)
        
        
        //------------------------------
        // Layout Constraint
        //------------------------------
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        alertView.translatesAutoresizingMaskIntoConstraints = false
        textAreaScrollView.translatesAutoresizingMaskIntoConstraints = false
        textAreaView.translatesAutoresizingMaskIntoConstraints = false
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonAreaView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // self.view
        let overlayViewTopSpaceConstraint = NSLayoutConstraint(item: overlayView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0)
        let overlayViewRightSpaceConstraint = NSLayoutConstraint(item: overlayView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0)
        let overlayViewLeftSpaceConstraint = NSLayoutConstraint(item: overlayView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let overlayViewBottomSpaceConstraint = NSLayoutConstraint(item: overlayView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let containerViewTopSpaceConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0)
        let containerViewRightSpaceConstraint = NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0)
        let containerViewLeftSpaceConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0)
        containerViewBottomConstraint = NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints([overlayViewTopSpaceConstraint, overlayViewRightSpaceConstraint, overlayViewLeftSpaceConstraint, overlayViewBottomSpaceConstraint, containerViewTopSpaceConstraint, containerViewRightSpaceConstraint, containerViewLeftSpaceConstraint, containerViewBottomConstraint!])
        
        // ContainerView
        let alertViewCenterXConstraint = NSLayoutConstraint(item: alertView, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let alertViewCenterYConstraint = NSLayoutConstraint(item: alertView, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        containerView.addConstraints([alertViewCenterXConstraint, alertViewCenterYConstraint])
        
        // AlertView
        let alertViewWidthConstraint = NSLayoutConstraint(item: alertView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: alertViewWidth)
        alertViewHeightConstraint = NSLayoutConstraint(item: alertView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 1000.0)
        alertView.addConstraints([alertViewWidthConstraint, alertViewHeightConstraint!])
        
        // AlertView
        let textAreaScrollViewTopSpaceConstraint = NSLayoutConstraint(item: textAreaScrollView, attribute: .top, relatedBy: .equal, toItem: alertView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let textAreaScrollViewRightSpaceConstraint = NSLayoutConstraint(item: textAreaScrollView, attribute: .right, relatedBy: .equal, toItem: alertView, attribute: .right, multiplier: 1.0, constant: 0.0)
        let textAreaScrollViewLeftSpaceConstraint = NSLayoutConstraint(item: textAreaScrollView, attribute: .left, relatedBy: .equal, toItem: alertView, attribute: .left, multiplier: 1.0, constant: 0.0)
        let textAreaScrollViewBottomSpaceConstraint = NSLayoutConstraint(item: textAreaScrollView, attribute: .bottom, relatedBy: .equal, toItem: buttonAreaView, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        let buttonAreaViewRightSpaceConstraint = NSLayoutConstraint(item: buttonAreaView, attribute: .right, relatedBy: .equal, toItem: alertView, attribute: .right, multiplier: 1.0, constant: 0.0)
        let buttonAreaViewLeftSpaceConstraint = NSLayoutConstraint(item: buttonAreaView, attribute: .left, relatedBy: .equal, toItem: alertView, attribute: .left, multiplier: 1.0, constant: 0.0)
        let buttonAreaViewBottomSpaceConstraint = NSLayoutConstraint(item: buttonAreaView, attribute: .bottom, relatedBy: .equal, toItem: alertView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        alertView.addConstraints([textAreaScrollViewTopSpaceConstraint, textAreaScrollViewRightSpaceConstraint, textAreaScrollViewLeftSpaceConstraint, textAreaScrollViewBottomSpaceConstraint, buttonAreaViewRightSpaceConstraint, buttonAreaViewLeftSpaceConstraint, buttonAreaViewBottomSpaceConstraint])
        
        // TextAreaScrollView
        let textAreaViewTopSpaceConstraint = NSLayoutConstraint(item: textAreaView, attribute: .top, relatedBy: .equal, toItem: textAreaScrollView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let textAreaViewRightSpaceConstraint = NSLayoutConstraint(item: textAreaView, attribute: .right, relatedBy: .equal, toItem: textAreaScrollView, attribute: .right, multiplier: 1.0, constant: 0.0)
        let textAreaViewLeftSpaceConstraint = NSLayoutConstraint(item: textAreaView, attribute: .left, relatedBy: .equal, toItem: textAreaScrollView, attribute: .left, multiplier: 1.0, constant: 0.0)
        let textAreaViewBottomSpaceConstraint = NSLayoutConstraint(item: textAreaView, attribute: .bottom, relatedBy: .equal, toItem: textAreaScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let textAreaViewWidthConstraint = NSLayoutConstraint(item: textAreaView, attribute: .width, relatedBy: .equal, toItem: textAreaScrollView, attribute: .width, multiplier: 1.0, constant: 0.0)
        textAreaScrollView.addConstraints([textAreaViewTopSpaceConstraint, textAreaViewRightSpaceConstraint, textAreaViewLeftSpaceConstraint, textAreaViewBottomSpaceConstraint, textAreaViewWidthConstraint])
        
        // TextArea
        let textAreaViewHeightConstraint = NSLayoutConstraint(item: textAreaView, attribute: .height, relatedBy: .equal, toItem: textContainer, attribute: .height, multiplier: 1.0, constant: 0.0)
        let textContainerTopSpaceConstraint = NSLayoutConstraint(item: textContainer, attribute: .top, relatedBy: .equal, toItem: textAreaView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let textContainerCenterXConstraint = NSLayoutConstraint(item: textContainer, attribute: .centerX, relatedBy: .equal, toItem: textAreaView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        textAreaView.addConstraints([textAreaViewHeightConstraint, textContainerTopSpaceConstraint, textContainerCenterXConstraint])
        
        // TextContainer
        let textContainerWidthConstraint = NSLayoutConstraint(item: textContainer, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: innerContentWidth)
        textContainerHeightConstraint = NSLayoutConstraint(item: textContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0.0)
        textContainer.addConstraints([textContainerWidthConstraint, textContainerHeightConstraint!])
        
        // ButtonArea
        let buttonAreaViewHeightConstraint = NSLayoutConstraint(item: buttonAreaView, attribute: .height, relatedBy: .equal, toItem: buttonContainerView, attribute: .height, multiplier: 1.0, constant: 0.0)
        let buttonContainerTopSpaceConstraint = NSLayoutConstraint(item: buttonContainerView, attribute: .top, relatedBy: .equal, toItem: buttonAreaView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let buttonContainerCenterXConstraint = NSLayoutConstraint(item: buttonContainerView, attribute: .centerX, relatedBy: .equal, toItem: buttonAreaView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        buttonAreaView.addConstraints([buttonAreaViewHeightConstraint, buttonContainerTopSpaceConstraint, buttonContainerCenterXConstraint])
        
        // ButtonContainerHeightConstraint
        let buttonContainerWidthConstraint = NSLayoutConstraint(item: buttonContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: alertViewWidth)
        buttonContainerHeightConstraint = NSLayoutConstraint(item: buttonContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0.0)
        buttonContainerView.addConstraints([buttonContainerWidthConstraint, buttonContainerHeightConstraint!])
        
        buttonContainerView.axis = .horizontal
        buttonContainerView.alignment = .fill
        buttonContainerView.distribution = .fillEqually
        
        //------------------------------
        // Layout & Color Settings
        //------------------------------
        overlayView.backgroundColor = overlayColor
        alertView.backgroundColor = alertViewBgColor
        
        //------------------------------
        // TextArea Layout
        //------------------------------
        let hasTitle: Bool = self.alertTitle != nil && self.alertTitle != ""
        let hasMessage: Bool = self.message != nil && self.message != ""
        
        var textAreaPositionY: CGFloat = alertViewPadding
        
        // TitleLabel
        if (hasTitle) {
            titleLabel.frame.size = CGSize(width: innerContentWidth, height: 0.0)
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            titleLabel.textColor = titleTextColor
            titleLabel.text = self.alertTitle
            titleLabel.sizeToFit()
            titleLabel.frame = CGRect(x: 0, y: textAreaPositionY, width: innerContentWidth, height: titleLabel.frame.height)
            textContainer.addSubview(titleLabel)
            textAreaPositionY += titleLabel.frame.height + alertViewPadding
        }
        
        // MessageView
        if (hasMessage) {
            messageLabel.frame.size = CGSize(width: innerContentWidth, height: 0.0)
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = titleLabel.font.withSize(16)
            messageLabel.textColor = messageTextColor
            messageLabel.text = message
            messageLabel.sizeToFit()
            messageLabel.frame = CGRect(x: 0, y: textAreaPositionY, width: innerContentWidth, height: messageLabel.frame.height)
            textContainer.addSubview(messageLabel)
            textAreaPositionY += messageLabel.frame.height + alertViewPadding
        }
        
        if (!hasTitle) {
            messageLabel.font = UIFont.boldSystemFont(ofSize: 24)
            messageLabel.sizeToFit()
            textAreaPositionY = messageLabel.frame.height + alertViewPadding
        }
        
        if (!hasTitle && !hasMessage) {
            textAreaPositionY = 0.0
        }
        
        // TextAreaScrollView
        textAreaHeight = textAreaPositionY
        textAreaScrollView.contentSize = CGSize(width: alertViewWidth, height: textAreaHeight)
        textContainerHeightConstraint?.constant = textAreaHeight
        
        //------------------------------
        // ButtonArea Layout
        //------------------------------
        var buttonAreaPositionY: CGFloat = buttonMargin
        let separateLineWidth: CGFloat = alertViewWidth / CGFloat(buttons.count)
        
        for (inx, button) in buttons.enumerated() {
            let btnAction = self.actions[inx] as! OneLineAlertAction
            let type = btnAction.type
            
            let borderTop = CALayer()
            borderTop.backgroundColor = UIColor(hex: "dee1e4").cgColor
            borderTop.frame = CGRect(x: 0, y: 0, width: separateLineWidth, height: separateLineHeight)
            
            switch type {
            case .Confirm:
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
                button.backgroundColor = UIColor(hex: "2f80ff")
            case .Neutral:
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.setTitleColor(UIColor(hex: "2f80ff"), for: .normal)
                button.backgroundColor = UIColor(hex: "FFFFFF")
                button.layer.addSublayer(borderTop)
            case .Cancel:
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.setTitleColor(UIColor(hex: "2f80ff"), for: .normal)
                button.backgroundColor = UIColor(hex: "FFFFFF")
                button.layer.addSublayer(borderTop)
            }
        }
        
        buttonAreaPositionY += buttonHeight
        
        // ButtonAreaScrollView Height
        buttonAreaHeight = buttonAreaPositionY
        buttonContainerHeightConstraint?.constant = buttonAreaHeight
        
        //------------------------------
        // AlertView Layout
        //------------------------------
        // AlertView Height
        alertViewHeightConstraint?.constant = alertViewHeight
        alertView.frame.size = CGSize(width: alertViewWidth, height: alertViewHeight)
    }
    
    internal func addAction(_ action: OneLineAlertAction) {
        // Add Action
        self.actions.append(action)
        
        // Add Button
        let button = UIButton()
        button.layer.masksToBounds = true
        button.setTitle(action.title, for: .normal)
        button.addTarget(self, action: #selector(OneLineAlertView.buttonTapped(_:)), for: .touchUpInside)
        button.tag = buttons.count + 1
        
        buttons.append(button)
        buttonContainerView.addArrangedSubview(button)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        sender.isSelected = true
        let action = self.actions[sender.tag - 1] as! OneLineAlertAction
        if action.handler != nil {
            action.handler()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func rotatedDevice() {
    }
}

// MARK: - TransitioningDelegate
extension OneLineAlertView: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        layoutView(presenting)
        return OneLineAlertAnimate(isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return OneLineAlertAnimate(isPresenting: false)
    }
}














































