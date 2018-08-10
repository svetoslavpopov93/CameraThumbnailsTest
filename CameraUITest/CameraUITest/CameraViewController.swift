//
//  CameraViewController.swift
//  Socourt
//
//  Created by Svetoslav Popov on 21.06.18.
//  Copyright © 2018 Socourt. All rights reserved.
//

import UIKit

@objcMembers
class CameraViewController: UIViewController {
    var requestBackgroundView: UIView!
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var cameraContainerViewTopConstraint: NSLayoutConstraint!
    
    var switchCamerasItem: UIBarButtonItem!
    var flashItem: UIBarButtonItem!
    var endItem: UIBarButtonItem!
    var timeItem: UIBarButtonItem!
    
    var bottomStackView: UIStackView!
    var bottomButtonsContainer: UIView!
    var galleryButton: UIButton!
    var captureHilightButton: UIButton!
    var takePhotoButton: UIButton!
    var bottomStackViewHeightAnchor: NSLayoutDimension!
    var snapshotsContainer: UIView!
    var timePickerContainer: UIView!
    
    
    var snapshotsContainerHeight: CGFloat {
        let viewHeight = view.frame.height
        return viewHeight * 0.045
    }
    
    var bottomButtonsContainerHeight: CGFloat {
        return contentViewHeight * 0.177
    }
    
    var contentViewHeight: CGFloat {
        return view.frame.height
    }
    
    var contentViewWidth: CGFloat {
       return view.frame.width
    }
    
    private var isTimePickerHidden: Bool = true {
        didSet {
            
            bottomStackViewHeightAnchor.constraint(equalToConstant: isTimePickerHidden ? snapshotsContainerHeight : snapshotsContainerHeight + timePickerContainerHeight)
            
            let strongSelf = self
            strongSelf.view.layoutIfNeeded()
            
            let isPickerHidden = strongSelf.isTimePickerHidden
            strongSelf.timePickerContainer.isHidden = isPickerHidden
            strongSelf.timeItem.tintColor = isPickerHidden ? ApplicationConstants.Colors.lightButtonColor : ApplicationConstants.Colors.brandColor
        }
    }
    
    var timePickerContainerHeight: CGFloat {
        let viewHeight = view.frame.height
        return viewHeight * 0.07
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    // MARK: Actions
    @objc func timerButtonTapped() {
        print("timerButtonTapped")
        isTimePickerHidden = !isTimePickerHidden
    }
    
    @objc func switchCamerasButtonTapped() {
        
    }
    
    @objc func flashButtonTapped() {
        print("flashButtonTapped")
    }
    
    @objc func endButtonTapped() {
        print("endButtonTapped")
    }
    
    @objc func galleryButtonTapped() {
        print("galleryButtonTapped")
    }
    
    @objc func captureHighlightButtonTapped() {
        
    }
    
    @objc func capturePhotoButtonTapped() {
        dismiss(animated: true,
                completion: nil)
    }
}

// MARK: - UISetupable
extension CameraViewController {
    func setupUIElements() {
        
        setupNavigationBar()
        
        setupRequestBackgroundView()
        
        UIApplication.shared.isStatusBarHidden = true
        
        setupBottomElements()
    }
    
    func setupNavigationBar() {
        let navigationButtonColor = ApplicationConstants.Colors.lightButtonColor
        
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.makeNavigationBarTransparent()
        navigationController?.makeCurrentViewControllerAsRoot()
        
        let navigationHeight = navigationController?.navigationBar.frame.height ?? 0
        cameraContainerViewTopConstraint.constant = -navigationHeight
        
        timeItem = UIBarButtonItem(image: #imageLiteral(resourceName: "time_bordered_white"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(timerButtonTapped))

        timeItem.tintColor = navigationButtonColor


        switchCamerasItem = UIBarButtonItem(image: #imageLiteral(resourceName: "switch_cameras_bordered_white"),
                                                style: .plain,
                                                target: self,
                                                action: #selector(switchCamerasButtonTapped))

        switchCamerasItem.tintColor = navigationButtonColor


        flashItem = UIBarButtonItem(image: #imageLiteral(resourceName: "flash_bordered_white"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(flashButtonTapped))

        flashItem.tintColor = navigationButtonColor


        endItem = UIBarButtonItem(title: "end",
                                      style: .plain,
                                      target: self,
                                      action: #selector(endButtonTapped))
        
        endItem.tintColor = navigationButtonColor
        endItem.setTitleTextAttributes([NSAttributedStringKey.font:UIFont(name: "Raleway", size: 16)!], for: .normal)

        navigationItem.leftBarButtonItems = [timeItem, switchCamerasItem, flashItem]
        navigationItem.rightBarButtonItem = endItem
    }
    
    func setupBottomElements() {
        // Stack View
        bottomStackView = UIStackView()
        
        bottomStackView.layer.masksToBounds = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .vertical
        bottomStackView.alignment = .fill
        bottomStackViewHeightAnchor = bottomStackView.heightAnchor
        bottomStackViewHeightAnchor.constraint(equalToConstant: timePickerContainerHeight + snapshotsContainerHeight)
        view.addSubview(bottomStackView)
        
        bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Bottom Button Container
        bottomButtonsContainer = UIView()
        bottomButtonsContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsContainer.heightAnchor.constraint(equalToConstant: bottomButtonsContainerHeight).isActive = true
        bottomButtonsContainer.backgroundColor = .clear
        bottomStackView.insertArrangedSubview(bottomButtonsContainer, at: 0)
        
        // Gallery button
        galleryButton = UIButton()
        galleryButton.addTarget(self, action: #selector(galleryButtonTapped), for: .touchUpInside)
//        galleryButton.roundCornersWith(radius: galleryButton.frame.height / 2)
        galleryButton.setImage(#imageLiteral(resourceName: "switch_cameras_bordered_white"), for: .normal)
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsContainer.addSubview(galleryButton)
        galleryButton.heightAnchor.constraint(equalTo: bottomButtonsContainer.heightAnchor, multiplier: 0.411).isActive = true
        galleryButton.widthAnchor.constraint(equalTo: galleryButton.heightAnchor).isActive = true
        galleryButton.topAnchor.constraint(equalTo: bottomButtonsContainer.topAnchor, constant: bottomButtonsContainerHeight * 0.44).isActive = true
        galleryButton.leadingAnchor.constraint(equalTo: bottomButtonsContainer.leadingAnchor, constant: contentViewWidth * 0.1).isActive = true
        
        // Capture Highlight Button
        captureHilightButton = UIButton()
        captureHilightButton.addTarget(self, action: #selector(captureHighlightButtonTapped), for: .touchUpInside)
        captureHilightButton.setImage(#imageLiteral(resourceName: "switch_cameras_bordered_white"), for: .normal)
        captureHilightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsContainer.addSubview(captureHilightButton)
        captureHilightButton.heightAnchor.constraint(equalTo: bottomButtonsContainer.heightAnchor, multiplier: 0.823).isActive = true
        captureHilightButton.widthAnchor.constraint(equalTo: captureHilightButton.heightAnchor).isActive = true
        captureHilightButton.centerXAnchor.constraint(equalTo: bottomButtonsContainer.centerXAnchor).isActive = true
        captureHilightButton.centerYAnchor.constraint(equalTo: bottomButtonsContainer.centerYAnchor).isActive = true
        
        // Take Picture Button
        takePhotoButton = UIButton()
        takePhotoButton.addTarget(self, action: #selector(capturePhotoButtonTapped), for: .touchUpInside)
//        takePhotoButton.roundCornersWith(radius: takePhotoButton.frame.height / 2)
        takePhotoButton.setImage(#imageLiteral(resourceName: "switch_cameras_bordered_white"), for: .normal)
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsContainer.addSubview(takePhotoButton)
        takePhotoButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor).isActive = true
        takePhotoButton.widthAnchor.constraint(equalTo: takePhotoButton.heightAnchor).isActive = true
        takePhotoButton.bottomAnchor.constraint(equalTo: galleryButton.bottomAnchor).isActive = true
        takePhotoButton.trailingAnchor.constraint(equalTo: bottomButtonsContainer.trailingAnchor, constant: -contentViewWidth * 0.1).isActive = true
        
        // Time Picker Container
        timePickerContainer = UIView()
        timePickerContainer.translatesAutoresizingMaskIntoConstraints = false
        timePickerContainer.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        timePickerContainer.heightAnchor.constraint(equalToConstant: timePickerContainerHeight).isActive = true
        timePickerContainer.isHidden = isTimePickerHidden
        bottomStackView.insertArrangedSubview(timePickerContainer, at: 1)
        
        // Snapshot Container
        snapshotsContainer = UIView()
        snapshotsContainer.translatesAutoresizingMaskIntoConstraints = false
        snapshotsContainer.backgroundColor = .clear
        snapshotsContainer.heightAnchor.constraint(equalToConstant: snapshotsContainerHeight).isActive = true
        bottomStackView.insertArrangedSubview(snapshotsContainer, at: 2)
    }
}

// MARK: AccessRequestable
extension CameraViewController {
    func setupRequestBackgroundView() {
        requestBackgroundView = UIView(frame: view.frame)
        
        let errorTitleLabel = UILabel()
        errorTitleLabel.text = "Camera permissions denied." // TEMP!
        errorTitleLabel.textColor = ApplicationConstants.Colors.textColor
        errorTitleLabel.sizeToFit()
        
        let requestBackgroundViewFrame = requestBackgroundView.frame
        let errorTitleLabelCenterX = requestBackgroundViewFrame.width / 2
        errorTitleLabel.center.x = errorTitleLabelCenterX
        let errorTitleLabelCenterY = requestBackgroundViewFrame.height / 2
        errorTitleLabel.center.y = errorTitleLabelCenterY
        
        requestBackgroundView.addSubview(errorTitleLabel)
        requestBackgroundView.backgroundColor = ApplicationConstants.Colors.brandBackgroundColor
        
        let returnButton = UIButton()
        returnButton.setTitle("Return", for: .normal)
        returnButton.setTitleColor(ApplicationConstants.Colors.activeInteractionColor, for: .normal)
        returnButton.sizeToFit()
        let errorTitleLabelMaxY = errorTitleLabel.frame.maxY
        let returnButtonY = errorTitleLabelMaxY + 6
        let returnButtonX = errorTitleLabelCenterX
        returnButton.frame.origin.y = returnButtonY
        returnButton.center.x = returnButtonX
        returnButton.addTarget(self, action: #selector(userDidTapReturnButton), for: .touchUpInside)
        
        requestBackgroundView.addSubview(returnButton)
    }
    
    @objc func userDidTapReturnButton() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}


class SnapshotCollectionViewDataHandler: CollectionViewDataHandler {
    
}

