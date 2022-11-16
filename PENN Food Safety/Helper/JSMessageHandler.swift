//
//  JSMessageHandler.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import Foundation
import WebKit

class JSMessageHandler : NSObject, WKScriptMessageHandler {
    weak var delegate : WKScriptMessageHandler?
    init(delegate:WKScriptMessageHandler) {
        self.delegate = delegate
        super.init()
    }
    func userContentController(_ ucc: WKUserContentController,
        didReceive message: WKScriptMessage) {
            self.delegate?.userContentController(ucc, didReceive: message)
    }
    deinit {
        print("message handler dealloc")
    }
}
