//
//  ViewController.swift
//  LightBoard
//
//  Created by Nakajima Kenta on 2016/06/21.
//  Copyright © 2016年 Nakajima Kenta. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var iv: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let img = NSImage(named: "logo")
        iv.image = img
    }
    
    override func viewDidDisappear() {
        iv.removeFromSuperview();
    }
    
    @IBAction func click(sender: NSButton) {
        iv.image = nil
        //iv.removeFromSuperview();
    }
    
    @IBAction func open(sender: NSButton) {
        let openPanel=NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["gif","jpg","png"]
        openPanel.message = "開くで"         // ダイアログに表記される説明
        openPanel.directoryURL = NSURL(fileURLWithPath: "\(NSHomeDirectory())/Desktop)")    // デフォルトで表示されるフォルダ
        let result=openPanel.runModal()
        if result == NSFileHandlingPanelOKButton {
            let img=NSImage(contentsOfURL:openPanel.URL!)
            iv.image=img
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

