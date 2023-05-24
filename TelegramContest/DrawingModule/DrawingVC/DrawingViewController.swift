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
    let clearAllNavigationBarButton = UIBarButtonItem(title: "Clear All", style: .plain, target: nil, action: nil)
    let doneTextNavigationBarButton = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil)
    
    let segmentedMainEditorView = SegmentedMainEditorView()
    let leftMainEditorView = LeftMainEditorView()
    let rightMainEditorView = RightMainEditorView()
    //image that we add from addButton (from rightMainEditorView)
    var shapeImage = UIImageView()

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
    var selectedTool = Tool()
    
    var toolWidth: CGFloat = 0
    var toolColor: UIColor = .red
    
    let pen = Tool(toolBody: "pen", toolTip: "penTip")
    let pencil = Tool(toolBody: "pencil", toolTip: "pencilTip")
    let eraser = Tool(toolBody: "eraser", toolTip: nil)
    let brush = Tool(toolBody: "brush", toolTip: "brushTip")
    let lasso = Tool(toolBody: "lasso", toolTip: nil)
    
//MARK: - textView
    private var textViewContainer = TextView()
    private var textSlider: CustomSlider!
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //initial tool width is 0
        canvasView.tool = PKInkingTool(.pen, color: toolColor, width: toolWidth)
        print("initial tool width", toolWidth)
        print("initial tool color", toolColor)
       
        presenter.setPhoto()
        
        initialSetupNavigationBar()

        view.backgroundColor = .gray
        
        setupContainerView()

        setupContainerSubview()
        
        setupCanvasView()

        setupGradientView()
        
        setupRightEditorView()
        setupLeftEditorView()
        setupToolMainViewConstraints()
        initialSetupMainEditorView()

    }
    

//MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let image = imageForDrawing.image else { return }
        canvasView.frame = SizeManager.setSize(image, toFitIn: imageForDrawing)
    }
    
//MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //our toolPicker - not system
    }
    
//MARK: - methods    
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
        
        clearAllNavigationBarButton.tintColor = .white
        clearAllNavigationBarButton.target = self
        clearAllNavigationBarButton.action = #selector(clearAll)
        
        doneTextNavigationBarButton.tintColor = .white
        doneTextNavigationBarButton.target = self
        doneTextNavigationBarButton.action = #selector(doneText)
        
        navigationItem.rightBarButtonItems = [clearAllNavigationBarButton, doneTextNavigationBarButton]
        
    }
    
    private func initialSetupMainEditorView() {
//FIXME: - should be foreground - not on the view or remove colors for canvas view  - opacity + top anchor (fixed)
        segmentedMainEditorView.delegate = self
        segmentedMainEditorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedMainEditorView)
        
        NSLayoutConstraint.activate([
            segmentedMainEditorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedMainEditorView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            segmentedMainEditorView.topAnchor.constraint(equalTo: segmentedMainEditorView.drawOrTextSegmentedControl.topAnchor),
            segmentedMainEditorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupLeftEditorView() {
        leftMainEditorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftMainEditorView)
        
        leftMainEditorView.colorWheel.addTarget(self, action: #selector(changingColor(sender:)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            leftMainEditorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftMainEditorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            leftMainEditorView.topAnchor.constraint(equalTo: rightMainEditorView.addButton.topAnchor),
            leftMainEditorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupRightEditorView() {
        rightMainEditorView.translatesAutoresizingMaskIntoConstraints = false
        rightMainEditorView.delegate = self
        rightMainEditorView.presentationDelegate = self
        view.addSubview(rightMainEditorView)
        
        NSLayoutConstraint.activate([
            rightMainEditorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rightMainEditorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rightMainEditorView.topAnchor.constraint(equalTo: rightMainEditorView.addButton.topAnchor),
            rightMainEditorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupToolMainViewConstraints() {
        pen.translatesAutoresizingMaskIntoConstraints = false
        pencil.translatesAutoresizingMaskIntoConstraints = false
        eraser.translatesAutoresizingMaskIntoConstraints = false
        brush.translatesAutoresizingMaskIntoConstraints = false
        lasso.translatesAutoresizingMaskIntoConstraints = false
        
        
        pen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(penTapped)))
        pencil.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pencilTapped)))
        brush.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(brushTapped)))
        
        eraser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eraserTapped)))
        lasso.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(lassoTapped)))
        
        //added to view (were on canvas view) because we will save canvas view to gallery
        view.addSubview(pen)
        view.addSubview(pencil)
        view.addSubview(eraser)
        view.addSubview(brush)
        view.addSubview(lasso)
        
        NSLayoutConstraint.activate([
            pen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            pen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
            pen.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            pen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            pencil.leadingAnchor.constraint(equalTo: pen.trailingAnchor),
            pencil.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
            pencil.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            pencil.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            brush.leadingAnchor.constraint(equalTo: pencil.trailingAnchor),
            brush.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
            brush.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            brush.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            lasso.leadingAnchor.constraint(equalTo: brush.trailingAnchor),
            lasso.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
            lasso.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            lasso.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            eraser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            eraser.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
            eraser.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            eraser.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func setupGradientView() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .clear
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
    }
    
    private func setupContainerSubview() {
        imageForDrawing.backgroundColor = .clear
        imageForDrawing.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageForDrawing)
        
        imageForDrawing.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            imageForDrawing.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageForDrawing.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageForDrawing.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageForDrawing.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    private func setupCanvasView() {
        canvasView.backgroundColor = .clear
        canvasView.drawing = drawing
        canvasView.delegate = self
        containerView.addSubview(canvasView)
        

    }
    
    @objc private func undoTapped() {
        print("undo tapped")
        //go back to second screen through presenter
        presenter.undoAction()
    }
    
    @objc private func clearAll() {
        print("clear all")
        canvasView.drawing = PKDrawing()
        textViewContainer.removeFromSuperview()
        shapeImage.removeFromSuperview()
    }
    
//MARK: - colorWheel will update tool's tip color
    @objc func changingColor(sender: UIColorWell) {
        guard let selectedColor = sender.selectedColor else { return }
        toolColor = selectedColor
        selectedTool.toolTipImage.tintColor = toolColor
//TODO: - here should be width
        switch selectedTool {
        case pen:
            canvasView.tool = PKInkingTool(.pen, color: toolColor)
            print("changed color", toolColor)
        case pencil:
            canvasView.tool = PKInkingTool(.pencil, color: toolColor)
            print("changed color", toolColor)
        case brush:
            canvasView.tool = PKInkingTool(.marker, color: toolColor)
            print("changed color", toolColor)
        default:
            break
        }
    }
    
//MARK: - tools' methods
    func setupWidth(_ width: CGFloat?) {
        switch selectedTool {
        case pen:
            canvasView.tool = PKInkingTool(.pen, color: toolColor, width: width)
            print("set up tool width with color", toolColor)
        case pencil:
            canvasView.tool = PKInkingTool(.pencil, color: toolColor, width: width)
            print("set up tool width with color", toolColor)
        case brush:
            canvasView.tool = PKInkingTool(.marker, color: toolColor, width: width)
            print("set up tool width with color", toolColor)
        default:
            break
        }
    }

    @objc func penTapped() {
        print("pen tapped")
        selectedTool = pen
        print(selectedTool)
        canvasView.tool = PKInkingTool(.pen)
        print("final pen width", toolWidth)
        print("final pen color", toolColor)
        let interaction = UIContextMenuInteraction(delegate: self)
        pen.addInteraction(interaction)
    }
    
    @objc func pencilTapped() {
        print("pencil tapped")
        selectedTool = pencil
        print(selectedTool)

        canvasView.tool = PKInkingTool(.pencil)
        print("final pencil width", toolWidth)
        print("final pencil color", toolColor)
        
        let interaction = UIContextMenuInteraction(delegate: self)
        pencil.addInteraction(interaction)
    }
    
    @objc func brushTapped() {
        print("brush tapped")
        selectedTool = brush
        print(selectedTool)

        canvasView.tool = PKInkingTool(.marker)
        print("final brush width", toolWidth)
        print("final brush color", toolColor)
        
        let interaction = UIContextMenuInteraction(delegate: self)
        brush.addInteraction(interaction)
    }
    
    @objc func eraserTapped() {
        print("eraser tapped")
        selectedTool = eraser
        print(selectedTool)
        
        if #available(iOS 16.4, *) {
            canvasView.tool = PKEraserTool(.bitmap, width: 20)
        } else {
            canvasView.tool = PKEraserTool(.bitmap)
        }
    }
    
    @objc func lassoTapped() {
        print("lasso tapped")
        selectedTool = lasso
        print(selectedTool)
        canvasView.tool = PKLassoTool()
    }
    
//MARK: - textViewMethods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textViewContainer.textView.resignFirstResponder()
    }
    
//call when switch to index 1 on the segmented control
    private func setupTextView() {
        textViewContainer.textView.backgroundColor = .lightText
        textViewContainer.setText("Write here...")
        
        canvasView.addSubview(textViewContainer)
        
        textViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textViewContainer.topAnchor.constraint(equalTo: canvasView.topAnchor, constant: 10),
            textViewContainer.widthAnchor.constraint(equalToConstant: 250),
            textViewContainer.heightAnchor.constraint(equalToConstant: 50),
            textViewContainer.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 30),
        ])
        
    }
    
    @objc func doneText() {
        canvasView.endEditing(true)
    }
    
//call when switch to index 1 on the segmented control together with text view
    private func setupTextSlider() {
        textSlider = CustomSlider(frame: CGRectZero)
        textSlider.translatesAutoresizingMaskIntoConstraints = false
        textSlider.value = 0.5
        textSlider.minimumTrackTintColor = .white
        textSlider.maximumTrackTintColor = .darkGray
        textSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        textSlider.minimumValue = 15
        textSlider.maximumValue = 50
        textSlider.addTarget(self, action: #selector(changeTextViewFontSize(sender:)), for: .valueChanged)
        
        view.addSubview(textSlider)
        
        NSLayoutConstraint.activate([
            textSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -50),
            textSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            textSlider.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func changeTextViewFontSize(sender: UISlider) {
        textViewContainer.textView.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
    }
}

extension DrawingViewController: MainEditorDelegate {
    func chooseDrawOrText(_ switcher: UISegmentedControl) {
        print("IN DRAWING VIEW CONTROLLER CHOOSE DRAW OR TEXT")
        switch switcher.selectedSegmentIndex {
        case 0:
            print("DRAW")
            textSlider.removeFromSuperview()
        case 1:
            print("TEXT")
            setupTextView()
            setupTextSlider()
        default:
            break
        }
    }

    private func createFullImage(drawingLayer: UIImage) -> UIImage? {
        let bottomImage = imageForDrawing.image
        let newImage = autoreleasepool { () -> UIImage in
            UIGraphicsBeginImageContextWithOptions(self.canvasView.frame.size, false, 0.0)
            bottomImage?.draw(in: CGRect(origin: CGPoint.zero, size: self.canvasView.frame.size))
            //getting all the subviews (drawing and text) from canvas view
            self.canvasView.drawHierarchy(in: self.canvasView.bounds, afterScreenUpdates: true)
            guard let createdImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
            UIGraphicsEndImageContext()
            return createdImage
        }
        return newImage
    }
    
    
    func saveImageToPhotos() {
        print("save image to photos")
        let drawing = self.canvasView.drawing.image(from: self.canvasView.bounds, scale: 0)
        if let editedImage = self.createFullImage(drawingLayer: drawing) {
            UIImageWriteToSavedPhotosAlbum(editedImage, nil, nil, nil)
        }
    }
}

extension DrawingViewController: PresentationViewDelegate {
    func addImageToViewController(_ image: UIImageView) {
        print("add image to vc")
        print(image.image == nil)
        shapeImage = image
        setupShapeImage(shapeImage)
    }
    
    private func setupShapeImage(_ shape: UIImageView) {
        print("set up shape image")
        shape.translatesAutoresizingMaskIntoConstraints = false
        shape.tintColor = .white
        shape.contentMode = .scaleAspectFit
        
        shape.zoomImage()
        shape.changePosition()
        shape.rotate()
        
        canvasView.addSubview(shape)
        
        NSLayoutConstraint.activate([
            shape.topAnchor.constraint(equalTo: canvasView.topAnchor, constant: CGFloat(arc4random_uniform(300))),
            shape.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 50),
            shape.widthAnchor.constraint(equalTo: canvasView.widthAnchor, multiplier: 0.2)
        ])
    }
}


