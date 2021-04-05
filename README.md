# RxUserNotifications

Rx wrapper around `UserNotifications`.

## Usage:
- Get notification settings:

    ```swift
    UNUserNotificationCenter.rx
        .notificationSettings()
        .observe(on: MainScheduler.instance)
        .subscribe(
            onNext: { settings in print(settings) }
        )
    ```
- Request authorization:

    ```swift
    UNUserNotificationCenter.rx
        .requestAuthorization(options: [.alert, .sound, .badge])
        .observe(on: MainScheduler.instance)
        .subscribe(
            onNext: { settings in print(settings) }
        )
    ```
        
Author: [@raxityo](https://github.com/raxityo)  
