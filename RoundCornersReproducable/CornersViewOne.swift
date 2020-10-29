//
//  CornersViewTwo.swift
//  RoundCornersReproducable
//
//  Created by Daniil Orlov on 29.10.2020.
//

import UIKit

@IBDesignable
class CornersViewOne: UIView {
    
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
        
        var corners = CACornerMask()
        
        if topLeftCornerMasked {
            corners.update(with: CACornerMask.layerMinXMinYCorner)
        }
        if topRightCornerMasked {
            corners.update(with: CACornerMask.layerMaxXMinYCorner)
        }
        if bottomLeftCornerMasked {
            corners.update(with: CACornerMask.layerMinXMaxYCorner)
        }
        if bottomRightCornerMasked {
            corners.update(with: CACornerMask.layerMaxXMaxYCorner)
        }
        
        layer.cornerRadius = cornerRadius
        layer.mask = nil
        layer.maskedCorners = corners
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
