//
//  ContainerView.swift
//  RoundCornersReproducable
//
//  Created by Daniil Orlov on 22.10.2020.
//

import UIKit

@IBDesignable
class CornersViewTwo: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet { checkCorners() }
    }
    
    @IBInspectable var topLeftCornerMasked: Bool = true {
        didSet { checkCorners() }
    }
    
    @IBInspectable var topRightCornerMasked: Bool = true {
        didSet { checkCorners() }
    }
    
    @IBInspectable var bottomLeftCornerMasked: Bool = true {
        didSet { checkCorners() }
    }
    
    @IBInspectable var bottomRightCornerMasked: Bool = true {
        didSet { checkCorners() }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOfset: CGSize  = .zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    func checkCorners() {
            
        var corners = UIRectCorner()
        
        if topLeftCornerMasked {
            corners.update(with: UIRectCorner.topLeft)
        }
        if topRightCornerMasked {
            corners.update(with: UIRectCorner.topRight)
        }
        if bottomLeftCornerMasked {
            corners.update(with: UIRectCorner.bottomLeft)
        }
        if bottomRightCornerMasked {
            corners.update(with: UIRectCorner.bottomRight)
        }
        
        let maskLayer = CAShapeLayer()
        let path =
            UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        maskLayer.path = path.cgPath
        
        layer.cornerRadius = 0
        layer.mask = maskLayer
        layer.maskedCorners = []
    }
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowOffset = shadowOfset
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }
}
