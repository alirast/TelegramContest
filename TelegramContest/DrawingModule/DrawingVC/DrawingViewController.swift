//
//  DrawingViewController.swift
//  TelegramContest
//
//  Created by N S on 10.04.2023.
//

import UIKit
import PencilKit
import Photos

class DrawingViewController: UIViewController, PKCanvasViewDelegate, DrawingViewProtocol {
    
    //navigation buttons
//TODO: - separate buttons to view
    let undoNavigationBarImage = UIImage(named: "undo")?.withRenderingMode(.alwaysTemplate)
    let clearNavigationBarButton = UIBarButtonItem(title: "Clear All", style: .plain, target: nil, action: nil)

    var presenter: DrawingPresenterProtocol!
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    
    //drawing object to store drawing
    let drawing = PKDrawing()
    
    //to store the image
    let imageForDrawing = UIImageView()
    //to store drawing and image together
    let containerView = UIView()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupNavigationBar()
        view.backgroundColor = .darkGray
        
        containerView.backgroundColor = .blue
        view.addSubview(containerView)
        
//TODO: - background should be an image (phasset)
        imageForDrawing.backgroundColor = .green
        containerView.addSubview(imageForDrawing)

        canvasView.backgroundColor = .magenta
        canvasView.drawing = drawing
        canvasView.delegate = self
        containerView.addSubview(canvasView)
        
    }
//MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.frame = view.bounds
        imageForDrawing.frame = view.bounds
        canvasView.frame = view.bounds
    }
//MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //our toolPicker - not system
    }
//MARK: - methods
    func save(_ sender: Any) {
        //save ready image with drawing
    }
    
    //protocol method
    func setPhoto(photo: PHAsset?) {
        
    }
    
    func initialSetupNavigationBar() {
        //color for navigation bar and safe
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        
        if let undoButtonImage = undoNavigationBarImage, let cgImage = undoButtonImage.cgImage {
            let undoButtonScaledImage = UIImage(cgImage: cgImage, scale: 2.0, orientation: undoButtonImage.imageOrientation)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: undoButtonScaledImage, style: .plain, target: nil, action: nil)
            navigationItem.leftBarButtonItem?.tintColor = .lightGray
        }
        
        navigationItem.hidesBackButton = true
        clearNavigationBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = clearNavigationBarButton
    }
    
    
}
