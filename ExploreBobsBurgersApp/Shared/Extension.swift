//
//  Extension.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import Foundation
import SwiftUI

extension Font {
    
    public static var test: Font {
        return Font.custom(Constants.fontStr, size: 40)
    }
    
    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }

    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }

    public static var title2: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
    }
    
    public static var title3: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
    }

    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }

    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }

    /// Create a font with the body text style.
    public static var body: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .body).pointSize)
       }

    /// Create a font with the callout text style.
    public static var callout: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
       }

    /// Create a font with the footnote text style.
    public static var footnote: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
       }

    /// Create a font with the caption text style.
    public static var caption: Font {
           return Font.custom(Constants.fontStr, size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
       }
}

