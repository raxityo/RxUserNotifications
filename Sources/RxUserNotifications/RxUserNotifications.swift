//
//  UNUserNotificationCenter+Rx.swift
//
//  Created by Rakshit Majithiya on 4/5/21.
//  Copyright © 2021 Rakshit Majithiya. All rights reserved.
//

import RxSwift
import UserNotifications

public extension Reactive where Base: UNUserNotificationCenter {

    /// Requests the notification settings for this app.
    func notificationSettings() -> Observable<UNNotificationSettings> {
        Observable.create { observer in
            self.base.getNotificationSettings { settings in observer.onNext(settings) }
            return Disposables.create()
        }
    }

    /// Requests authorization to interact with the user when local and remote notifications are delivered to the user’s device.
    func requestAuthorization(options: UNAuthorizationOptions = []) -> Observable<Bool> {
        Observable.create { observer -> Disposable in
            self.base.requestAuthorization(options: options) { authorized, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(authorized)
                }
            }
            return Disposables.create()
        }
    }
}
