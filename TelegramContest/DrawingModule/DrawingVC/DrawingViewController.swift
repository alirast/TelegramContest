//
//  DrawingViewController.swift
//  TelegramContest
//
//  Created by N S on 10.04.2023.
//

import UIKit
import PencilKit

class DrawingViewController: UIViewController, PKCanvasViewDelegate {
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    
    //drawing object to store drawing
    let drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//TODO: - background should be an image (phasset)
        canvasView.backgroundColor = .orange
        canvasView.drawing = drawing
        canvasView.delegate = self
        view.addSubview(canvasView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //our toolPicker - not system
    }
    
    func save(_ sender: Any) {
        //save ready image with drawing
    }
}
