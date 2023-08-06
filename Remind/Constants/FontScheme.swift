import Foundation
import SwiftUI

class FontScheme: NSObject {
    static func kAveriaSerifLibreRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kAveriaSerifLibreRegular, size: size)
    }

    static func kAveriaSerifLibreBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kAveriaSerifLibreBold, size: size)
    }

    static func kBarlowRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kBarlowRegular, size: size)
    }

    static func kBarlowLight(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kBarlowLight, size: size)
    }

    static func kBarlowThin(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kBarlowThin, size: size)
    }

    static func fontFromConstant(fontName: String, size: CGFloat) -> Font {
        var result = Font.system(size: size)

        switch fontName {
        case "kAveriaSerifLibreRegular":
            result = self.kAveriaSerifLibreRegular(size: size)
        case "kAveriaSerifLibreBold":
            result = self.kAveriaSerifLibreBold(size: size)
        case "kBarlowRegular":
            result = self.kBarlowRegular(size: size)
        case "kBarlowLight":
            result = self.kBarlowLight(size: size)
        case "kBarlowThin":
            result = self.kBarlowThin(size: size)
        default:
            result = self.kAveriaSerifLibreRegular(size: size)
        }
        return result
    }

    enum FontConstant {
        /**
         * Please Add this fonts Manually
         */
        static let kAveriaSerifLibreRegular: String = "AveriaSerifLibre-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kAveriaSerifLibreBold: String = "AveriaSerifLibre-Bold"
        /**
         * Please Add this fonts Manually
         */
        static let kBarlowRegular: String = "Barlow-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kBarlowLight: String = "Barlow-Light"
        /**
         * Please Add this fonts Manually
         */
        static let kBarlowThin: String = "Barlow-Thin"
    }
}
