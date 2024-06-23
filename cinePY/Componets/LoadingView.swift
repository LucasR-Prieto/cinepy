//
//  File.swift
//  cinePY
//
//  Created by lucas on 2024-06-22.
//

import Foundation
import UIKit

class LoadingView {
    static let shared = LoadingView()
    
    private var loadingView: UIView?
    private var activityIndicator: UIActivityIndicatorView?
    
    private init() {}
    
    func showLoadingView(on view: UIView) {
        guard loadingView == nil else { return }
        
        loadingView = UIView(frame: view.bounds)
        loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = loadingView!.center
        activityIndicator?.startAnimating()
        
        loadingView?.addSubview(activityIndicator!)
        view.addSubview(loadingView!)
    }
    
    func hideLoadingView() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        loadingView?.removeFromSuperview()
        
        activityIndicator = nil
        loadingView = nil
    }
}
