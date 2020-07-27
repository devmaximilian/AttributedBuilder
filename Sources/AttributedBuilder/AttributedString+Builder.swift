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
}
#endif

#if os(iOS) || os(macOS)
extension NSAttributedString {    
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
#endif

#if os(iOS) || os(macOS)
extension NSMutableAttributedString {
    fileprivate subscript(key: Key) -> Any? {
        get {
            return self.attribute(key, at: 0, effectiveRange: nil)
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

// MARK: NSParagraphStyle

#if os(iOS) || os(macOS)
extension NSAttributedString {
    fileprivate var paragraphStyle: NSParagraphStyle {
        let paragraphStyle = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle
        return paragraphStyle ?? .default
    }
    
    public func lineSpacing(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.lineSpacing = value
            }
        }
    }

    public func paragraphSpacing(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.paragraphSpacing = value
            }
        }
    }

    public func alignment(_ value: NSTextAlignment) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.alignment = value
            }
        }
    }

    public func firstLineHeadIndent(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.firstLineHeadIndent = value
            }
        }
    }

    public func headIndent(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.headIndent = value
            }
        }
    }

    public func tailIndent(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.tailIndent = value
            }
        }
    }

    public func lineBreakMode(_ value: NSLineBreakMode) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.lineBreakMode = value
            }
        }
    }

    public func minimumLineHeight(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.minimumLineHeight = value
            }
        }
    }

    public func maximumLineHeight(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.maximumLineHeight = value
            }
        }
    }

    public func baseWritingDirection(_ value: NSWritingDirection) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.baseWritingDirection = value
            }
        }
    }

    public func lineHeightMultiple(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.lineHeightMultiple = value
            }
        }
    }

    public func paragraphSpacingBefore(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.paragraphSpacingBefore = value
            }
        }
    }

    public func hyphenationFactor(_ value: Float) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.hyphenationFactor = value
            }
        }
    }

    @available(iOS 7.0, *)
    public func tabStops(_ value: [NSTextTab]!) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.tabStops = value
            }
        }
    }

    @available(iOS 7.0, *)
    public func defaultTabInterval(_ value: CGFloat) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.defaultTabInterval = value
            }
        }
    }

    @available(OSX 10.11, *)
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(_ value: Bool) -> NSAttributedString {
        return self.update {
            $0[.paragraphStyle] = self.paragraphStyle.update {
                $0.allowsDefaultTighteningForTruncation = value
            }
        }
    }
}
#endif
