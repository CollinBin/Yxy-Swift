//
//  UIView+Frame.swift
//  Yxy-Swift
//
//  Created by songbincheng on 29/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

extension UIView {
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var tempFrame = self.frame
            tempFrame.origin.y = top
            self.frame = tempFrame
        }
    }
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }

        set {
            var tempFrame = self.frame
            tempFrame.origin.x = left
            self.frame = tempFrame
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.bounds.height
        }
        
        set {
            var tempFrame = self.frame
            tempFrame.origin.y = bottom - tempFrame.size.height
            self.frame = tempFrame
        }
    }
    
    public var right: CGFloat {
        get {
            return self.frame.origin.x + self.bounds.width
        }
        
        set {
            var tempFrame = self.frame
            tempFrame.origin.x = right - tempFrame.size.width
            self.frame = tempFrame
        }
    }

    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var size: CGSize {
        return self.frame.size
    }
    
    var point: CGPoint {
        return self.frame.origin
    }
    
}
