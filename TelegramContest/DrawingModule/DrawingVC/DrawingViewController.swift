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
    
    let mainEditorView = MainEditorView()
    let toolEditorView = ToolEditorView() //when a tool is chosen - didnt add to subview now and didnt call the function for the setup

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
    //gradient view
    let gradientView = GradientLayerView()
//MARK: - tools
    let pen = Tool(toolBody: "pen", toolTip: "penTip")
    let pencil = Tool(toolBody: "pencil", toolTip: "pencilTip")
    let eraser = Tool(toolBody: "eraser", toolTip: nil)
    let brush = Tool(toolBody: "brush", toolTip: "brushTip")
    let lasso = Tool(toolBody: "lasso", toolTip: nil)
//MARK: - textView
    private var textViewContainer = TextView()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setPhoto()
        
        initialSetupNavigationBar()

        initialSetupMainEditorView()
        
        view.backgroundColor = .darkGray
        
        containerView.backgroundColor = .blue
        view.addSubview(containerView)
        
        setupGradientView()
        
//TODO: - background should be an image (phasset)
        imageForDrawing.backgroundColor = .green
        containerView.addSubview(imageForDrawing)

        canvasView.backgroundColor = .magenta
        canvasView.drawing = drawing
        canvasView.delegate = self
        containerView.addSubview(canvasView)
        
        
        
        //tool
//FIXME: - should be toolsView
        //canvasView.addSubview(pen)
        setupToolMainViewConstraints()
        
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
        photo?.convertToImage(completion: { image in
            if let image = image {
                self.imageForDrawing.image = image
            }
        })
        //imageForDrawing.image = photo
    }
    
    private func initialSetupNavigationBar() {
        //color for navigation bar and safe
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        
        if let undoButtonImage = undoNavigationBarImage, let cgImage = undoButtonImage.cgImage {
            let undoButtonScaledImage = UIImage(cgImage: cgImage, scale: 2.0, orientation: undoButtonImage.imageOrientation)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: undoButtonScaledImage, style: .plain, target: self, action: #selector(undoTapped))
            navigationItem.leftBarButtonItem?.tintColor = .lightGray
        }
        
        navigationItem.hidesBackButton = true
        clearNavigationBarButton.tintColor = .white
        navigationItem.rightBarButtonItem = clearNavigationBarButton
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(clearAll)
    }
    
    private func initialSetupMainEditorView() {
//FIXME: - should be foreground - not on the view or remove colors for canvas view  - opacity
        mainEditorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainEditorView)
        NSLayoutConstraint.activate([
            mainEditorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainEditorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainEditorView.topAnchor.constraint(equalTo: view.topAnchor),
            mainEditorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupToolEditorView() {
        toolEditorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolEditorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolEditorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolEditorView.topAnchor.constraint(equalTo: view.topAnchor),
            toolEditorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupToolMainViewConstraints() {
        pen.translatesAutoresizingMaskIntoConstraints = false
        pencil.translatesAutoresizingMaskIntoConstraints = false
        eraser.translatesAutoresizingMaskIntoConstraints = false
        brush.translatesAutoresizingMaskIntoConstraints = false
        lasso.translatesAutoresizingMaskIntoConstraints = false
        
        canvasView.addSubview(pen)
        canvasView.addSubview(pencil)
        canvasView.addSubview(eraser)
        canvasView.addSubview(brush)
        canvasView.addSubview(lasso)
        
        NSLayoutConstraint.activate([
            pen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            pen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            pen.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            pen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            pencil.leadingAnchor.constraint(equalTo: pen.trailingAnchor),
            pencil.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            pencil.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            pencil.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            brush.leadingAnchor.constraint(equalTo: pencil.trailingAnchor),
            brush.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            brush.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            brush.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            lasso.leadingAnchor.constraint(equalTo: brush.trailingAnchor),
            lasso.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            lasso.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            lasso.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            eraser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            eraser.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            eraser.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            eraser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    
    private func setupGradientView() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    @objc private func undoTapped() {
        print("undo tapped")
        //go back to second screen through presrnter
        presenter.undoAction()
    }
    
    @objc private func clearAll() {
        print("clear all")
        canvasView.drawing = PKDrawing()
    }
    
//MARK: - textViewMethods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textViewContainer.textView.resignFirstResponder()
    }
    
//call when switch to index 1 on the segmented control
    private func setupTextView() {
        textViewContainer.translatesAutoresizingMaskIntoConstraints = false
        textViewContainer.backgroundColor = .clear
        textViewContainer.setText("Write here...")
        view.addSubview(textViewContainer)
        
        textViewContainer.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        textViewContainer.center = CGPoint(x: view.center.x, y: view.center.y - 30)
    
    }
}
