//
//  ApplicationConstants.swift
//  Socourt
//
//  Created by Svetoslav Popov on 29.03.18.
//  Copyright © 2018 Socourt. All rights reserved.
//

import Foundation
import UIKit

public struct ApplicationConstants {
    public struct Utility {
        public static let debugModeEnabled: Bool = true
    }
    
    public struct KeyChain {
        public static let keychainAccount = "Socourt_User_Account"
        public static let authenticationTokenKey = "AUTHENTICATION_TOKEN_KEY"
        public static let usernameKey = "USERNAME_KEY"
        public static let emailKey = "EMAIL_KEY"
    }
    
    public struct UserDefaults {
          public static let UserDefaultsAuthenticationStateIsLoggedInKey = "isLoggedIn"
    }
    
    public struct Fonts {
        public static let minFontSize: CGFloat = 18
        public static let maxFontSize: CGFloat = 67
    }
    
    public struct Colors {
        // Facebook
        static let facebookButtonTitleColor: UIColor = .white
        static let facebookButtonBackgroundColor: UIColor = UIColor(hexString: "2b5998")
      
        // Brand colors
        static let brandColor: UIColor = UIColor(hexString: "d0dd28")
        static let brandBackgroundColor: UIColor = UIColor(hexString: "120b2f")
        static let lightButtonColor: UIColor = .white
        static let textColor: UIColor = .white
        static let separatorColor: UIColor = .white
        static let passiveColor: UIColor = UIColor(hexString: "8e8e93")
        static let disabledColor: UIColor = UIColor(hexString: "8e8e93")
        
        static let activeInteractionColor: UIColor = UIColor(hexString: "007aff")
        static let negativeInteractionColor: UIColor = UIColor(hexString: "ff3b30")
    }
    
    public struct ErrorDescriptions {
        static let invalidUsernameOrPassword: String = "wrong_password_error".localized
        static let invalidEmailFormat: String = "bad_email_address".localized
        static let invalidUsernameFormat: String = "username_too_short_subtitle".localized
        static let invalidPasswordFormat: String = "wrong_password_error".localized
        static let passwordsMissmatch: String = "pw_dont_match_error".localized
    }
}
