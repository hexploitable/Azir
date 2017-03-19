//
//  DualBucket.swift
//  Azir
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

import Foundation
import Dispatch

/// Rate Limit Thing
class DualBucket {

  // MARK: Properties

  /// Dispatch Queue to handle requests
  let worker: DispatchQueue

  /// Array of DispatchWorkItems to execute
  var queue: [DispatchWorkItem] = []

  /// Limit on token count for first limit
  var limit1: Int

  /// Limit on token count for second limit
  var limit2: Int

  /// Interval at which tokens reset for first limit
  var interval1: Int

  /// Interval at which tokens reset for second limit
  var interval2: Int

  /// Current token count for first limit
  var tokens1: Int

  /// Current token count for second limit
  var tokens2: Int

  /// Last reset in terms of Date for first limit
  var lastReset1 = Date()

  /// Last reset in terms of Date for second limit
  var lastReset2 = Date()

  /// Last reset in terms of Dispatch for first limit
  var lastResetDispatch1 = DispatchTime.now()

  /// Last reset in terms of Dispatch for second limit
  var lastResetDispatch2 = DispatchTime.now()

  // MARK: Initializer

  /**
   Creates a bucket

   - parameter name: Name of bucket
   - parameter limit1: Token limit for first limit
   - parameter interval1: Interval at which tokens reset for first limit
   - parameter limit2: Token limit for second limit
   - parameter interval2: Interval at which tokens reset for second limit
   */
  init(name: String, limit1: Int, interval1: Int, limit2: Int, interval2: Int) {
    self.worker = DispatchQueue(label: name, qos: .userInitiated)
    self.limit1 = limit1
    self.tokens1 = limit1
    self.interval1 = interval1
    self.limit2 = limit2
    self.tokens2 = limit2
    self.interval2 = interval2
  }

  // MARK: Functions

  /// Check for token renewal and amount of tokens in bucket. If there are no more tokens then tell Dispatch to execute this function after deadline
  func check() {
    let now = Date()

    if now.timeIntervalSince(self.lastReset1) > Double(self.interval1) {
      self.tokens1 = self.limit1
      self.lastReset1 = now
      self.lastResetDispatch1 = DispatchTime.now()
    }

    if now.timeIntervalSince(self.lastReset2) > Double(self.interval2) {
      self.tokens2 = self.limit2
      self.lastReset2 = now
      self.lastResetDispatch2 = DispatchTime.now()
    }

    guard self.tokens1 > 0 && self.tokens2 > 0 else {
      guard self.tokens2 > 0 else {
        self.worker.asyncAfter(deadline: self.lastResetDispatch2 + .seconds(self.interval2), execute: self.check)

        return
      }

      self.worker.asyncAfter(deadline: self.lastResetDispatch1 + .seconds(self.interval1), execute: self.check)

      return
    }

    self.execute()
  }

  /// Executes the first DispatchWorkItem in self.queue and removes a token from the bucket.
  func execute() {
    let item = self.queue.remove(at: 0)
    self.tokens1 -= 1
    self.tokens2 -= 1
    self.worker.async(execute: item)
  }

  /**
   Queues the given item

   - parameter item: Code block to execute
   */
  func queue(_ item: DispatchWorkItem) {
    self.queue.append(item)
    self.check()
  }

  /**
   Used to take x amount of tokens from bucket (initial http request for route)

   - parameter num: Amount of tokens to take
   */
  func take(_ num: Int) {
    self.tokens1 -= num
    self.tokens2 -= num
  }

}
