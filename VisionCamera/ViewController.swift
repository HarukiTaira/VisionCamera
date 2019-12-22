//
//  ViewController.swift
//  VisionCamera
//
//  Created by 平良悠貴 on 2019/12/13.
//  Copyright © 2019 平良悠貴. All rights reserved.
//

import UIKit
import Vision
import  VisionKit

class ViewController: UIViewController,VNDocumentCameraViewControllerDelegate {

    @IBOutlet var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func camerabutton(sender:UIControl?){
        let cameraViewController = VNDocumentCameraViewController()
        cameraViewController.delegate = self
        present(cameraViewController, animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        controller.dismiss(animated: true)
        for pageIndex in 0 ..< scan.pageCount{
        let image = scan.imageOfPage(at: pageIndex)
        imageView.image = image
        }
    }

}

