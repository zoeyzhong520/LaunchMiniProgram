//
//  UIView+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UIView {
    convenience init(frame: CGRect, backgroundColor: UIColor? = .white) {
        self.init()
        self.frame = frame
        self.backgroundColor = backgroundColor
    }
    
    ///设置layer的border属性
    func setBorderStyle(borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

extension UIView {
    ///雪花动效
    class func showSnowAnimation(duration: TimeInterval = 5) {
        let baseView = UIView(frame: UIScreen.main.bounds, backgroundColor: UIColor(white: 0, alpha: 0.3))
        UIWindow.getCurrentWindow()?.addSubview(baseView)
        
        //实例化发射器
        let snowLayer = CAEmitterLayer()
        //设置大小
        snowLayer.frame = baseView.bounds
        //指定发射源位置
        snowLayer.emitterPosition = CGPoint(x: UIScreen.width/2, y: -10)
        //指定发射源的大小
        snowLayer.emitterSize = CGSize(width: UIScreen.width, height: 0)
        //指定发射源的形状
        snowLayer.emitterShape = .line
        //指定发射源的模式
        snowLayer.emitterMode = .outline
        //添加
        baseView.layer.addSublayer(snowLayer)

        let cell = CAEmitterCell()
        //每秒产生的粒子数
        cell.birthRate = 5
        //存活时间
        cell.lifetime = 20
        //初速度
        cell.velocity = 5
        //加速度
        cell.yAcceleration = 10
        //设置发散角度
        cell.emissionRange = 10
        //设置图片
        cell.contents = UIImage(named: "snow")?.cgImage
        //设置图片的缩放比例
        cell.scale = 0.5
        //开始动画
        snowLayer.emitterCells = [cell]
        
        //经过duration时间后销毁粒子发射器
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+duration) {
            UIView.animate(withDuration: 0.3, animations: {
                baseView.alpha = 0
            }) { (_) in
                baseView.removeFromSuperview()
            }
        }
    }
}
