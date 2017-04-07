//
//  ViewController.swift
//  MotionTracker
//
//  Created by Joy Hsu on 4/6/17.
//  Copyright © 2017 Joy Hsu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import CoreMotion

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func backend() {
        let prefs = UserDefaults.standard
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        ref = ref.child("motion").childByAutoId()
        ref.child("x").setValue(prefs.integerForKey("x"))
        ref.child("y").setValue(prefs.integerForKey("y"))
        ref.child("z").setValue(prefs.integerForKey("z"))
        ref.child("time").setValue(prefs.stringForKey("time"))
        
    }*/
    
    @IBAction func backend() {
        /*Timer.scheduledTimer(timeInterval: 5,
                             target: self,
                             selector: #selector(self.backend),
                             userInfo: nil,
                             repeats: true)*/
        
         var motionManager: CMMotionManager!
         motionManager = CMMotionManager()
         motionManager.startAccelerometerUpdates()
         let data = motionManager.accelerometerData
         let curr = Date()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "YYYY-MM-dd\'T\'HH:mm:ssZZZZZ"
         let newDate = dateFormatter.string(from: curr)
         
         var ref: FIRDatabaseReference!
         ref = FIRDatabase.database().reference()
         ref = ref.child("motion").childByAutoId()
         ref.child("x").setValue(data?.acceleration.x)
         ref.child("y").setValue(data?.acceleration.y)
         ref.child("z").setValue(data?.acceleration.z)
         ref.child("time").setValue(newDate)
        
        
    }



}

