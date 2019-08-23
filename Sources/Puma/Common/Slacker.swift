//
//  File.swift
//  
//
//  Created by Besar Ismaili on 23/08/2019.
//

import Foundation
import SlackKit

public struct Slacker {
    
    init() {
        let bot = SlackKit()
        let oauthConfig = OAuthConfig(clientID: "721702835698.738597109911", clientSecret: "01ae99d7df21b4ff1f9f5014340f9a07")
        bot.addServer(oauth: oauthConfig)
        let helloAction = Action(name: "hello", text: "🌎")
        let attachment = Attachment(fallback: "Hello World", title: "Welcome to SlackKit", callbackID: "hello_world", actions: [helloAction])
        bot.webAPI?.sendMessage(channel: "slackapptest", text: "", attachments: [attachment], success: nil, failure: nil)
    }
}
