//
//  InAppWebViewUserScript.swift
//  flutter_inappwebview
//
//  Created by Lorenzo Pichilli on 16/02/21.
//

import Foundation
import WebKit

public class UserScript : WKUserScript {
    var groupName: String?
    
    public override init(source: String, injectionTime: WKUserScriptInjectionTime, forMainFrameOnly: Bool) {
        super.init(source: source, injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
    }
    
    public init(groupName: String?, source: String, injectionTime: WKUserScriptInjectionTime, forMainFrameOnly: Bool) {
        super.init(source: source, injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
        self.groupName = groupName
    }
    
    public static func fromMap(map: [String:Any?]?, windowId: Int64?) -> UserScript? {
        guard let map = map else {
            return nil
        }
        
        let contentWorldMap = map["contentWorld"] as? [String:Any?]
        return UserScript(
            groupName: map["groupName"] as? String,
            source: map["source"] as! String,
            injectionTime: WKUserScriptInjectionTime.init(rawValue: map["injectionTime"] as! Int) ?? .atDocumentStart,
            forMainFrameOnly: map["iosForMainFrameOnly"] as! Bool
        )
    }
}
