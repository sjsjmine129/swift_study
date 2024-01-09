//
//  ViewController.swift
//  Web
//
//  Created by 엄승주 on 1/3/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var webView: WKWebView!
    
    //load the web
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        loadWebPage("https://www.google.com/")
    }
    
    // run when loading is start
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        loading.startAnimating()
        loading.isHidden = false
    }
    // run when loading is done
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
        loading.isHidden = true
    }
    //run when loading is fail
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loading.stopAnimating()
        loading.isHidden = true
    }
    
    func checkUrl(_ url:String)->String{
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        if !flag {
            strUrl = "https://"+strUrl
        }
        
        return strUrl
    }
    
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnNaver(_ sender: UIButton) {
        loadWebPage("https://www.naver.com/")
    }
    
    @IBAction func btnGoogle(_ sender: UIButton) {
        loadWebPage("https://www.google.com/")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = "<h1> HTML </h1><p>html page</p><p><a href=\"http://2sam.net\">2sam</a> go</p>"
        webView.loadHTMLString(htmlString, baseURL:nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        webView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func btnGoback(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnGoforward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    
}

