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

    /// Returns a list of the app’s notifications that are still displayed in Notification Center.
    func getDeliveredNotifications() -> Observable<[UNNotification]> {
        Observable.create { observe -> Disposable in
            self.base.getDeliveredNotifications { notifications in
                observe.onNext(notifications)
            }
            return Disposables.create()
        }
    }

    /// Schedules a local notification for delivery.
    func add(_ request: UNNotificationRequest) -> Observable<Bool> {
        Observable.create { observer -> Disposable in
            self.base.add(request) { error in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(true)
                }
            }
            return Disposables.create()
        }
    }
}
