//
//  main.swift
//  201124_week4_Practice
//
//  Created by 조중윤 on 2020/11/24.
//

import Foundation

class BackgroundWork {
    //Use this class when you want to have an Objective-C method run in its own thread of execution. Threads are especially useful when you need to perform a lengthy task, but don’t want it to block the execution of the rest of the application.
    var thread: Thread? = nil
    
    func doTimeConsumingWork(operation: Any?) {
        thread = Thread(target: self, selector: #selector(runHelper), object: operation)
        // why does it need question mark?
        thread?.start()
    }
    @objc func runHelper(operation: Any?) {
        autoreleasepool { () in
                //operation.doOperation()
                print("Other thread is running...")
        }
    }
}
let some = BackgroundWork()
some.doTimeConsumingWork(operation: nil)
