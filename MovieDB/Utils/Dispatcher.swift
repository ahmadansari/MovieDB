//
//  MainQueue.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 24.08.23.
//

import Foundation

func performBlock(_ queue: DispatchQueue = .main, block: @escaping () -> Void) {
  if queue == .main, Thread.isMainThread {
    block()
  } else {
    queue.async(execute: block)
  }
}

// Perform delayed execution on main queue
typealias DelayedBlock = () -> Void
func performDelayedBlock(_ queue: DispatchQueue = .main, delay: TimeInterval, block: @escaping DelayedBlock) {
  queue.asyncAfter(deadline: .now() + delay, execute: block)
}
