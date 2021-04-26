//
//  Switch.swift
//

import UIKit

open class Switch: UIControl {
    
    public var isOn: Bool {
        get { isOnPrivate }
        set {
            changeThumbState(on: newValue, animated: false, sendAction: false)
        }
    }
    
    public var isBounceEnabled: Bool = true
    public var bounceOffset: CGFloat = 0.0
    
    public var thumbOnTintColor: UIColor = UIColor.Basic.teal {
        didSet {
            self.configureThumbColors()
        }
    }
    
    public var thumbOffTintColor: UIColor = UIColor.gray3 {
        didSet {
            self.configureThumbColors()
        }
    }
    
    public var trackOnTintColor: UIColor = UIColor.Pastel.lightGreen {
        didSet {
            self.configureTrackColors()
        }
    }
    
    public var trackOffTintColor: UIColor = UIColor.gray5 {
        didSet {
            self.configureTrackColors()
        }
    }
    
    public var thumbDisabledTintColor: UIColor = UIColor.Pastel.lightGreen {
        didSet {
            self.configureThumbColors()
        }
    }
    
    public var trackDisabledTintColor: UIColor = UIColor.Pastel.lightGreen {
        didSet {
            self.configureTrackColors()
        }
    }
    
    private var thumbOnPosition: CGFloat = 0.0
    private var thumbOffPosition: CGFloat = 0.0
    private var thumbSize: CGFloat = 0.0
    private var track: UIView = UIView()
    private var switchThumb = UIButton()
    
    private var isOnPrivate: Bool = false
    
    override open var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.configureThumbColors()
                self.configureTrackColors()
            }
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit(with: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(with frame: CGRect = CGRect(x: 0, y: 0, width: 46, height: 30)) {
        self.drawSwitch(with: frame)
    }
    
    // MARK: - Switch Drawing
    private func drawSwitch(with frame: CGRect) {
        self.initTrack(frame: frame)
        self.initThumb(frame: frame)
        self.addTargets()
    }
    
    // MARK: - Lifecycle
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.configureTrack(frame: frame)
        self.configureThumb(frame: frame)
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        // Set colors for proper positions
        self.configureThumbColors()
        self.configureTrackColors()
        
        // set initial position
        self.changeThumbState(on: isOnPrivate, animated: false, sendAction: true)
    }
    
    // MARK: - Targets
    private func addTargets() {
        self.switchThumb.addTarget(self, action: #selector(Switch.onTouchDown(button:with:)), for: .touchDown)
        self.switchThumb.addTarget(self, action: #selector(Switch.onTouchUpOutsideOrCanceled(button:with:)), for: .touchUpOutside)
        self.switchThumb.addTarget(self, action: #selector(Switch.switchThumbTapped(button:with:)), for: .touchUpInside)
        self.switchThumb.addTarget(self, action: #selector(Switch.onTouchDragInside(button:with:)), for: .touchDragInside)
        self.switchThumb.addTarget(self, action: #selector(Switch.onTouchUpOutsideOrCanceled(button:with:)), for: .touchCancel)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(Switch.switchAreaTapped(tapGesture:)))
        self.addGestureRecognizer(singleTap)
    }
}

//MARK: - State Change
private extension Switch {
    private func changeThumbState() {
        self.changeThumbState(on: !isOnPrivate, animated: true, sendAction: true)
    }
    
    private func changeThumbState(on: Bool, animated: Bool, sendAction: Bool) {
        self.isOnPrivate = on
        DispatchQueue.main.async {
            if animated {
                UIView.animate(withDuration: 0.15, delay: 0.05, options: .curveEaseInOut, animations: {
                    self.changeThumbPropertiesForStateChange(on: on, animated: animated)
                    self.isUserInteractionEnabled = false
                }) { finish in
                    if sendAction { self.sendActions(for: .valueChanged) }
                    UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseInOut, animations: {
                        self.adjustThumbBounceOffsetForStateChange(on: on)
                    }, completion: { finish in
                        self.isUserInteractionEnabled = true
                    })
                }
            } else {
                self.changeThumbPropertiesForStateChange(on: on, animated: animated)
                if sendAction { self.sendActions(for: .valueChanged) }
            }
        }
    }
    
    private func changeThumbPropertiesForStateChange(on: Bool, animated: Bool) {
        var thumbFrame = self.switchThumb.frame
        thumbFrame.origin.x = on
            ? (animated ? self.thumbOnPosition + self.bounceOffset : self.thumbOnPosition)
            : (animated ? self.thumbOffPosition - self.bounceOffset : self.thumbOffPosition)
        self.switchThumb.frame = thumbFrame
        
        self.configureThumbColors()
        self.configureTrackColors()
    }
    
    private func adjustThumbBounceOffsetForStateChange(on: Bool) {
        var thumbFrame = switchThumb.frame
        thumbFrame.origin.x = on ? thumbOnPosition : thumbOffPosition
        switchThumb.frame = thumbFrame
    }
}

//MARK: - Thumb Drawing
private extension Switch {
    
    private func initThumb(frame: CGRect) {
        self.addSubview(switchThumb)
        self.configureThumb(frame: frame)
    }
    
    private func configureThumb(frame: CGRect) {
        
        let frame = frame
        var thumbFrame: CGRect = CGRect.zero
        self.thumbSize = frame.size.height
        
        thumbFrame.size.height = self.thumbSize
        thumbFrame.size.width = thumbFrame.size.height
        thumbFrame.origin.x = 0.0
        thumbFrame.origin.y = (frame.size.height-thumbFrame.size.height)/2
        
        self.switchThumb.frame = thumbFrame
        
        self.switchThumb.backgroundColor = UIColor.white
        self.switchThumb.layer.cornerRadius = (self.switchThumb.frame.size.height) / 2
        
        self.thumbOnPosition = frame.size.width - (self.switchThumb.frame.size.width)
        self.thumbOffPosition = self.switchThumb.frame.origin.x
        self.configureThumbColors()
        self.configureThumbPosition()
    }
    
    private func configureThumbPosition() {
        var thumbFrame = self.switchThumb.frame
        thumbFrame.origin.x = self.isOnPrivate ? self.thumbOnPosition : self.thumbOffPosition
        self.switchThumb.frame = thumbFrame
    }
    
    private func configureThumbColors() {
        self.switchThumb.backgroundColor = self.isEnabled
            ? (self.isOnPrivate ? self.thumbOnTintColor : self.thumbOffTintColor)
            : self.thumbDisabledTintColor
    }
}

//MARK: - Track Drawing
private extension Switch {
    private func initTrack(frame: CGRect) {
        self.addSubview(track)
        self.configureTrack(frame: frame)
    }
    
    private func configureTrack(frame: CGRect) {
        let frame = frame
        var trackFrame: CGRect = CGRect.zero
        let trackThickness = frame.size.height * 0.8
        trackFrame.size.height = trackThickness
        trackFrame.size.width = frame.size.width
        trackFrame.origin.x = 0.0
        trackFrame.origin.y = (frame.size.height-trackFrame.size.height)/2
        self.track.frame = trackFrame
        self.track.layer.cornerRadius = min(track.frame.size.height, track.frame.size.width) / 2
        self.track.backgroundColor = UIColor.gray
        self.configureTrackColors()
    }
    
    private func configureTrackColors() {
        self.track.backgroundColor = isEnabled
            ? (self.isOnPrivate ? trackOnTintColor : trackOffTintColor)
            : trackDisabledTintColor
    }
}

// MARK: - Actions
private extension Switch {
    @objc private func onTouchDown(button: UIButton, with event: UIEvent) { }
    
    @objc private func onTouchUpOutsideOrCanceled(button: UIButton, with event: UIEvent) {
        let touch = event.touches(for: button)?.first
        let prevPos = touch?.previousLocation(in: button)
        let pos = touch?.location(in: button)
        let dX = pos!.x - prevPos!.x
        
        //Get the new origin after this motion
        let newXOrigin = button.frame.origin.x + dX
        if newXOrigin > (frame.size.width - (self.switchThumb.frame.size.width ) / 2) {
            self.changeThumbState(on: true, animated: true, sendAction: true)
        } else {
            self.changeThumbState(on: false, animated: true, sendAction: true)
        }
    }
    
    @objc private func switchThumbTapped(button: UIButton, with event: UIEvent) {
        self.changeThumbState()
    }
    
    @objc private func onTouchDragInside(button: UIButton, with event: UIEvent) {
        //This code can go awry if there is more than one finger on the screen
        let touch = event.touches(for: button)?.first
        let prevPos = touch?.previousLocation(in: button)
        let pos = touch?.location(in: button)
        let dX = pos!.x - prevPos!.x
        
        //Get the original position of the thumb
        var thumbFrame = button.frame
        thumbFrame.origin.x += dX
        
        //Make sure it's within two bounds
        thumbFrame.origin.x = min(thumbFrame.origin.x, thumbOnPosition)
        thumbFrame.origin.x = max(thumbFrame.origin.x, thumbOffPosition)
        
        //Set the thumb's new frame if need to
        if thumbFrame.origin.x != button.frame.origin.x {
            button.frame = thumbFrame
        }
    }
    
    @objc private func switchAreaTapped(tapGesture: UITapGestureRecognizer) {
        self.changeThumbState()
    }
}
