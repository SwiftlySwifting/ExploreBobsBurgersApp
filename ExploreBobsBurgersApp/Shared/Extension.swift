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

extension String {
    var nameSplitLowerCase: [String] {
        let comps = self.components(separatedBy: NSCharacterSet.punctuationCharacters)
        let joined = comps.joined(separator: "")
        let noSpacer = joined.components(separatedBy: " ")
        return noSpacer.map({$0.lowercased()})
    }
    
    var removeCommas: String {
        var newString = ""
        for char in self {
            if char != "," {
                newString.append(char)
            }
        }
        return newString
    }
    
    var removeCharsBetweenPars: String {
        let pattern = "\\(.*\\)"
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.count)
        let modifiedString = regex.stringByReplacingMatches(in: self, options: .init(rawValue: 0), range: range, withTemplate: "")
        return modifiedString
    }
    
    var ageFormat: String {
        return self.removeCharsBetweenPars.removeCommas
    }
    
    var characterVoicedBy: [VoicedBy]? {
        if self.contains("), ") {
            var namesArray = [VoicedBy]()
            if self.contains("\"") {
                let names = self.components(separatedBy: "\"), ")
                for name in names {
                    let elements = name.components(separatedBy: "(\"")
                    let episode = elements[1].filter { char in
                        char != "(" && char != ")" && char != "\""
                    }
                    let newPer = VoicedBy(id: UUID(),
                                          name: elements[0],
                                          episode: "\"\(episode)\"")
                    namesArray.append(newPer)
                }
                return namesArray
                
            } else if self.contains("(") {
                let names = self.components(separatedBy: ", ")
                for name in names {
                    let newPer = VoicedBy(id: UUID(),
                                          name: name)
                    namesArray.append(newPer)
                }
                return namesArray
                
            } else {
                return nil
            }
            
        } else {
            let name = VoicedBy(id: UUID(),
                                name: self)
            return [name]
        }
    }

}



