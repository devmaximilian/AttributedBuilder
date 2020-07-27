//
//  AttributedString+Builder.swift
//  AttributedBuilder
//
//
//  Created by Maximilian Wendel on 2020-07-27.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

#if os(iOS)
extension NSAttributedString {
    public typealias Font = UIFont
    public typealias Color = UIColor
}
#elseif os(macOS)
extension NSAttributedString {
    public typealias Font = NSFont
    public typealias Color = NSColor
}
#endif

#if os(iOS) || os(macOS)
extension NSAttributedString {
    fileprivate var range: NSRange {
        return NSRange(location: 0, length: self.length)
    }
    
    fileprivate func update(_ closure: (NSMutableAttributedString) -> Void) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        closure(mutableAttributedString)
        return NSAttributedString(attributedString: mutableAttributedString)
    }
    
    @available(iOS 6.0, *)
    public func font(_ value: Font) -> NSAttributedString {
        return self.update {
            $0[.font] = value
        }
    }
    
    #if os(iOS)
    @available(iOS 6.0, *)
    public func font(_ value: Font.TextStyle) -> NSAttributedString {
        return self.update {
            $0[.font] = Font.preferredFont(forTextStyle: value)
        }
    }
    #endif
    
    @available(iOS 6.0, *)
    public func paragraphStyle(_ value: NSParagraphStyle) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = value
        }
    }

    @available(iOS 6.0, *)
    public func foregroundColor(_ value: Color) -> NSAttributedString {
        return self.update {
            $0[.foregroundColor] = value
        }
    }

    @available(iOS 6.0, *)
    public func backgroundColor(_ value: Color) -> NSAttributedString {
        return self.update {
            $0[.backgroundColor] = value
        }
    }

    @available(iOS 6.0, *)
    public func ligature(_ value: Int) -> NSAttributedString {
        return self.update {
            $0[.ligature] = value
        }
    }

    @available(iOS 6.0, *)
    public func kern(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.kern] = value
        }
    }

    @available(iOS 6.0, *)
    public func strikethroughStyle(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.strikethroughStyle] = value
        }
    }

    @available(iOS 6.0, *)
    public func underlineStyle(_ value: NSUnderlineStyle) -> NSAttributedString {
        return self.update {
            $0[.underlineStyle] = value
        }
    }

    @available(iOS 6.0, *)
    public func strokeColor(_ value: Color) -> NSAttributedString {
        return self.update {
            $0[.strokeColor] = value
        }
    }

    @available(iOS 6.0, *)
    public func strokeWidth(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.strokeWidth] = value
        }
    }

    @available(iOS 6.0, *)
    public func shadow(_ value: NSShadow) -> NSAttributedString {
        return self.update {
            $0[.shadow] = value
        }
    }

    @available(iOS 7.0, *)
    public func textEffect(_ value: TextEffectStyle) -> NSAttributedString {
        return self.update {
            $0[.textEffect] = value
        }
    }

    
    @available(iOS 7.0, *)
    public func attachment(_ value: NSTextAttachment) -> NSAttributedString {
        return self.update {
            $0[.attachment] = value
        }
    }

    @available(iOS 7.0, *)
    public func link(_ value: NSURL) -> NSAttributedString {
        return self.update {
            $0[.link] = value
        }
    }

    @available(iOS 7.0, *)
    public func baselineOffset(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.baselineOffset] = value
        }
    }

    @available(iOS 7.0, *)
    public func underlineColor(_ value: Color) -> NSAttributedString {
        return self.update {
            $0[.underlineColor] = value
        }
    }

    @available(iOS 7.0, *)
    public func strikethroughColor(_ value: Color) -> NSAttributedString {
        return self.update {
            $0[.strikethroughColor] = value
        }
    }

    @available(iOS 7.0, *)
    public func obliqueness(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.obliqueness] = value
        }
    }

    @available(iOS 7.0, *)
    public func expansion(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.expansion] = value
        }
    }

    
    @available(iOS 7.0, *)
    public func writingDirection(_ value: [NSWritingDirection]) -> NSAttributedString {
        return self.update {
            $0[.writingDirection] = value
        }
    }
    
    @available(iOS 6.0, *)
    public func verticalGlyphForm(_ value: NSNumber) -> NSAttributedString {
        return self.update {
            $0[.verticalGlyphForm] = value
        }
    }
}
extension NSMutableAttributedString {
    fileprivate subscript(key: Key) -> Any? {
        get {
            return self.attribute(key, at: 0, effectiveRange: NSRangePointer(bitPattern: self.length))
        }
        set {
            if let value = newValue {
                self.removeAttribute(key, range: self.range)
                self.addAttribute(key, value: value, range: self.range)
            } else {
                self.removeAttribute(key, range: self.range)
            }
        }
    }
}
#endif
