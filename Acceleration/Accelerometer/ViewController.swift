//
//  ViewController.swift
//  Accelerometer
//
//  Created by Tanmay Desai on 4/4/23.
//
import CoreMotion
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var xMotion: UILabel!
    @IBOutlet weak var yMotion: UILabel!
    @IBOutlet weak var zMotion: UILabel!
    
    @IBOutlet weak var xDist: UILabel!
    @IBOutlet weak var yDist: UILabel!
    @IBOutlet weak var zDist: UILabel!
    
    let motion = CMMotionManager()
    let updateQueue = OperationQueue()
    var startTime: TimeInterval=0
    var previousTime: TimeInterval=0
    var previousAcceleration: CMAcceleration?
    var totalDistanceX: Double=0
    var totalDistanceY: Double=0
    var totalDistanceZ: Double=0
    
    enum Axis{
        case x
        case y
        case z
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDeviceMotion()
        startTrackingDistance()

    }
    
    func myDeviceMotion(){
        motion.deviceMotionUpdateInterval = 0.5
        motion.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
            print(data as Any)
            if let trueData = data{
                self.view.reloadInputViews()
                let mPitch = trueData.attitude.pitch
                let mRoll = trueData.attitude.roll
                let mYaw  = trueData.attitude.yaw
                self.xMotion.text = "Pitch: \(Double(mPitch).rounded(toPlaces: 3))"
                self.yMotion.text = "Roll: \(Double(mRoll).rounded(toPlaces: 3))"
                self.zMotion.text = "Yaw: \(Double(mYaw).rounded(toPlaces: 3))"
                
            }
        }
        
    }
    
    func startTrackingDistance(){
        startTime = CACurrentMediaTime()
        previousTime = startTime
        
        motion.startAccelerometerUpdates(to: updateQueue) { [weak self](accelerometerData,error) in
            guard let acceleration = accelerometerData?.acceleration, error == nil else {return}
    
            let currentTime = CACurrentMediaTime()
            let elapsedTime = currentTime-(self?.previousTime ?? 0.0)
            
            
            if let previousAcceleration = self?.previousAcceleration{
                let (velocityX, velocityY, velocityZ) = self?.calculateVelocity(acceleration: acceleration, previousAcceleration: previousAcceleration, elapsedTime: elapsedTime) ?? (0.0, 0.0, 0.0)
                
//                let velocityY = self?.calculateVelocity(acceleration: acceleration.y, previousAcceleration: previousAcceleration.y, elapsedTime: elapsedTime) ?? 0
//                let velocityZ = self?.calculateVelocity(acceleration: acceleration.z, previousAcceleration: previousAcceleration.z, elapsedTime: elapsedTime) ?? 0
                
                let distanceX = self?.calculateDistance(velocity: velocityX, elapsedTime: elapsedTime) ?? 0
                let distanceY = self?.calculateDistance(velocity: velocityY, elapsedTime: elapsedTime) ?? 0
                let distanceZ = self?.calculateDistance(velocity: velocityZ, elapsedTime: elapsedTime) ?? 0
//
                self?.totalDistanceX += distanceX
                self?.totalDistanceY += distanceY
                self?.totalDistanceZ += distanceZ
                
                
                DispatchQueue.main.async {
                    self?.xDist.text = String(format: "X: %.2f meters", self?.totalDistanceX ?? 0.0)
                    self?.yDist.text = String(format: "Y: %.2f meters", self?.totalDistanceY ?? 0.0)
                    self?.zDist.text = String(format: "Z: %.2f meters", self?.totalDistanceZ ?? 0.0)
                }
              
            }
            
            self?.previousAcceleration = acceleration
            self?.previousTime = currentTime
            
        }
    }
    
    func stopTrackingDistance(){
        motion.stopAccelerometerUpdates()
        previousAcceleration = nil
        previousTime = 0
        totalDistanceX = 0
        totalDistanceY = 0
        totalDistanceZ = 0
    }
    
    func calculateVelocity(acceleration: CMAcceleration, previousAcceleration: CMAcceleration, elapsedTime: TimeInterval) -> (Double, Double, Double){
        let changeinVelX = (acceleration.x + previousAcceleration.x)/2*elapsedTime
        let changeinVelY = (acceleration.y + previousAcceleration.y)/2*elapsedTime
        let changeinVelZ = (acceleration.z + previousAcceleration.z)/2*elapsedTime

//        let velocity = sqrt(changeinVelX*changeinVelY+changeinVelX*changeinVelZ+changeinVelY*changeinVelZ)

       return (changeinVelX, changeinVelY, changeinVelZ)

    }
    func calculateDistance(velocity: Double,elapsedTime: TimeInterval)->Double{
        var distance: Double = 0
        
        distance = velocity*elapsedTime
        

        return distance
    }
   
}

extension Double{
    func rounded(toPlaces places:Int)-> Double{
        let divisor = pow(10.0, Double(places))
        return (self*divisor).rounded()/divisor
    }
}

