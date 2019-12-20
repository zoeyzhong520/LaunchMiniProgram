//
//  BaseHtmlController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

private let observer_estimatedProgress = "estimatedProgress"
private let observer_title = "title"
private let observer_canGoBack = "canGoBack"

class BaseHtmlController: BaseViewController {

    private let webView = WKWebView()
    private let progressView = UIProgressView()
    
    init(htmlString: String?) {
        super.init(nibName: nil, bundle: nil)
        if let `htmlString` = htmlString, let htmlUrl = URL(string: htmlString) {
            webView.load(URLRequest(url: htmlUrl))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addObservers()
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: observer_estimatedProgress)
        webView.removeObserver(self, forKeyPath: observer_title)
        webView.removeObserver(self, forKeyPath: observer_canGoBack)
    }
}

extension BaseHtmlController {
    private func setUI() {
        webView.frame = view.bounds
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        progressView.frame = CGRect(x: 0, y: UIScreen.navigationBarStatusBarHeight, width: UIScreen.width, height: 2)
        progressView.transform = CGAffineTransform.init(scaleX: 1, y: 1.5)
        progressView.progressTintColor = .blue
        view.addSubview(progressView)
    }
    
    private func addObservers() {
        webView.addObserver(self, forKeyPath: observer_estimatedProgress, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: observer_title, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: observer_canGoBack, options: .new, context: nil)
    }
}

extension BaseHtmlController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == observer_estimatedProgress {
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            if progressView.progress == 1 {
                UIView.animate(withDuration: 0.25, delay: 0.3, options: .curveEaseOut, animations: { [weak self] in
                    self?.progressView.transform = CGAffineTransform(scaleX: 1, y: 1.4)
                }) { [weak self] (_) in
                    self?.progressView.isHidden = true
                }
            }
        } else if keyPath == observer_title {
            title = webView.title
        } else if keyPath == observer_canGoBack {
            if let newValue = change?[.newKey] as? Bool {
                navigationController?.interactivePopGestureRecognizer?.isEnabled = !newValue
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

extension BaseHtmlController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        progressView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        //处理网页中可点击的标签带有 target='_blank'
        if let frameInfo = navigationAction.targetFrame, !frameInfo.isMainFrame {
            webView.load(navigationAction.request)
        }
        return nil
    }
}

extension BaseHtmlController {
    ///显示BaseHtmlController
    static func showHtml(htmlString: String? = nil) {
        let vc = BaseHtmlController(htmlString: htmlString)
        UIViewController.getTopViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
