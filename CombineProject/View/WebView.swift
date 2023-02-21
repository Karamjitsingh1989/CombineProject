//
//  WebView.swift
//  CombineProject
//
//  Created by Karamjit Singh on 20/02/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
   
    
    typealias UIViewType = WKWebView
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
          //  fatalError("Unable to load")
           return WKWebView.pageNotFound()
        }
        
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        guard let url = URL(string: self.url) else {
            return
        }
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
    }
 
}
