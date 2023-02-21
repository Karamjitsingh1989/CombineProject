//
//  WKWebView.swift
//  CombineProject
//
//  Created by Karamjit Singh on 20/02/23.
//

import Foundation
import WebKit

extension WKWebView {
    
    static func pageNotFound()-> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.loadHTMLString("<html><body><h1>Page not found</h1></body></html>", baseURL: nil)
        return wkWebView
    }
}
