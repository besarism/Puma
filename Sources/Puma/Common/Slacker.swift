//
//  File.swift
//  
//
//  Created by Besar Ismaili on 23/08/2019.
//

import Foundation
import SlackKit

public struct Slacker {
    
    init(message: String) {
        let response = ResponseMiddleware(token: "M9rCVTJSId3xKRyGEkl2DtUQ", response: SKResponse(text: message))
        let actionRoute = MessageActionRoute(action: helloAction, middleware: response)
        let actionMiddleware = MessageActionMiddleware(token: "M9rCVTJSId3xKRyGEkl2DtUQ", routes:[actionRoute])
        let actions = RequestRoute(path: "/actions", middleware: actionMiddleware)
        let responder = SlackKitResponder(routes: [actions])
        slackkit.addServer(responder: responder)
    }
}
