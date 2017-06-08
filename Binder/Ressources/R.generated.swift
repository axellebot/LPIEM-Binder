//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    
    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `ic_account_circle_white`.
    static let ic_account_circle_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_account_circle_white")
    /// Image `ic_home_white`.
    static let ic_home_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_home_white")
    /// Image `ic_message_white`.
    static let ic_message_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_message_white")
    /// Image `ic_settings_white`.
    static let ic_settings_white = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_settings_white")
    
    /// `UIImage(named: "ic_account_circle_white", bundle: ..., traitCollection: ...)`
    static func ic_account_circle_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_account_circle_white, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_home_white", bundle: ..., traitCollection: ...)`
    static func ic_home_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_home_white, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_message_white", bundle: ..., traitCollection: ...)`
    static func ic_message_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_message_white, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_settings_white", bundle: ..., traitCollection: ...)`
    static func ic_settings_white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_settings_white, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `conversationCell`.
    static let conversationCell: Rswift.ReuseIdentifier<ConversationCellView> = Rswift.ReuseIdentifier(identifier: "conversationCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_account_circle_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_account_circle_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_message_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_message_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_settings_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_settings_white' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_home_white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_home_white' is used in storyboard 'Main', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}