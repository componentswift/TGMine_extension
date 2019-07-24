//
//  TGMine_extension.swift
//  TGMine_extension
//
//  Created by tangmengze on 2019/7/24.
//  Copyright © 2019 tangmengze. All rights reserved.
//

import CTMediator

public extension CTMediator {
    // 如果这个方法也要给Objective-C工程调用，就需要加上@objc
    @objc func TGMine_Controller(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"TGMine" // 需要给到module名
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget("TGMine", action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}
