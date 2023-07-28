//
//  Extension.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let bBRed = Color("bBRed")
    static let bBBlue = Color("bBBlue")
    static let shadowColor = Color(.gray).opacity(0.5)
    
}

extension Font {
    
    public static var appHomeTitle: Font {
        return Font.custom(Constants.fontStr, size: 20)
    }
        
    /// Create a font with the large title text style.
    public static var appLargeTitle: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }

    /// Create a font with the title text style.
    public static var appTitle: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }

    public static var appTitle2: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
    
    public static var appTitle3: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
    }

    /// Create a font with the headline text style.
    public static var appHeadline: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }

    /// Create a font with the subheadline text style.
    public static var appSubheadline: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }

    /// Create a font with the body text style.
    public static var appBody: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .body).pointSize)
       }

    /// Create a font with the callout text style.
    public static var appCallout: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
       }

    /// Create a font with the footnote text style.
    public static var appFootnote: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
       }

    /// Create a font with the caption text style.
    public static var appCaption: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
       }
}



