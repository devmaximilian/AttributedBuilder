//
//  ParagraphStyle.swift
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

#if os(iOS) || os(macOS)
extension NSParagraphStyle {
    internal func update(_ closure: (NSMutableParagraphStyle) -> Void) -> NSParagraphStyle {
        let mutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraphStyle.setParagraphStyle(self)
        closure(mutableParagraphStyle)
        return mutableParagraphStyle
    }
}
#endif

#if os(iOS) || os(macOS)
extension NSParagraphStyle {
    public func lineSpacing(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.lineSpacing = value
        }
    }

    public func paragraphSpacing(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.paragraphSpacing = value
        }
    }

    public func alignment(_ value: NSTextAlignment) -> NSParagraphStyle {
        return self.update {
            $0.alignment = value
        }
    }

    public func firstLineHeadIndent(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.firstLineHeadIndent = value
        }
    }

    public func headIndent(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.headIndent = value
        }
    }

    public func tailIndent(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.tailIndent = value
        }
    }

    public func lineBreakMode(_ value: NSLineBreakMode) -> NSParagraphStyle {
        return self.update {
            $0.lineBreakMode = value
        }
    }

    public func minimumLineHeight(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.minimumLineHeight = value
        }
    }

    public func maximumLineHeight(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.maximumLineHeight = value
        }
    }

    public func baseWritingDirection(_ value: NSWritingDirection) -> NSParagraphStyle {
        return self.update {
            $0.baseWritingDirection = value
        }
    }

    public func lineHeightMultiple(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.lineHeightMultiple = value
        }
    }

    public func paragraphSpacingBefore(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.paragraphSpacingBefore = value
        }
    }

    public func hyphenationFactor(_ value: Float) -> NSParagraphStyle {
        return self.update {
            $0.hyphenationFactor = value
        }
    }

    @available(iOS 7.0, *)
    public func tabStops(_ value: [NSTextTab]!) -> NSParagraphStyle {
        return self.update {
            $0.tabStops = value
        }
    }

    @available(iOS 7.0, *)
    public func defaultTabInterval(_ value: CGFloat) -> NSParagraphStyle {
        return self.update {
            $0.defaultTabInterval = value
        }
    }

    @available(OSX 10.11, *)
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(_ value: Bool) -> NSParagraphStyle {
        return self.update {
            $0.allowsDefaultTighteningForTruncation = value
        }
    }
}
#endif
