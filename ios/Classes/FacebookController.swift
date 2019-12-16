//
//  FacebookController.swift
//  Runner
//
//  Created by Vaifat on 12/16/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import FBSDKShareKit

class FacebookController {
    let contentURL: String
    let message: String
    
    init(contentURL: String, message: String) {
        self.contentURL = contentURL
        self.message = message
    }
    
    func getShareContent() -> ShareLinkContent? {
        let content = ShareLinkContent()
        guard let url = URL(string: contentURL) else {return nil}
        content.contentURL = url
        content.quote = message
        return content
    }
}
