//
//  SceneDelegate.swift
//  Place holder (iOS)
//
//  Created by Daniel Klinge on 16/05/2022.
//

import UIKit
import BackgroundTasks

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // MARK: Registered refresh task :)
        NSLog(">>>>>>>> willConnectTo")

        BGTaskScheduler.shared.register(forTaskWithIdentifier: "Need", using: nil){ task in
            self.checkdist(task: task as! BGAppRefreshTask)
        }
    }
        
    func sceneDidEnterBackground(_ scene: UIScene) {
        NSLog(">>>>>>>> sceneDidEnterBackground")

        sqeduleRef()
    }
    
    func sqeduleRef() {
        NSLog(">>>>>>>> sqeduleRef")

        let request = BGAppRefreshTaskRequest(identifier: "Need")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 5) // check after 5 seconds
        
        do{
            try BGTaskScheduler.shared.submit(request)
        }catch{
            print("rejected: \(error)")
        }
    }
    
    func checkdist(task: BGAppRefreshTask){
        NSLog(">>>>>>>> checkdist(task: BGAppRefreshTask)")
        
        sqeduleRef()
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        
        let operations = Operations.update()
        let lastOperation = operations.last!
        
        task.expirationHandler = {
            queue.cancelAllOperations()
        }
        
        lastOperation.completionBlock = {
            task.setTaskCompleted(success: !lastOperation.isCancelled)
        }
        
        queue.addOperations(operations, waitUntilFinished: true)
    }
}
