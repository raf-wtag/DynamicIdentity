# This project is created as a **P**roof **O**f **C**oncept of Two Questions -
- Is there any way to change the **App Name** programmatically after installing the app on the device?
- Is there any way to change the **App Icon** programmatically after installing the app on the device?

<br><hr><br>

# Changing App Name
It is not possible to change the app name as the app name is in the Info.plist which is read only. 

But there is a way to add the localization for the app name.

## How to add the localization for App Name?
- Create a '.string' file and add localization for that file. 
- Then add that file in the Project -> Info -> Localization
- Then for different languages add corresponding `.string` files. 
- Finally add the desired string against this `CFBundleDisplayName` key

Video Demostration of this feature - 

![App name localization](https://github.com/raf-wtag/DynamicIdentity/assets/79823087/d19ee769-d670-4ab3-b0be-88996fceaf49)

<br><hr><br>

# Changing App Icon
From iOS 10.3 Apple [provides APIs](https://developer.apple.com/documentation/xcode/configuring_your_app_to_use_alternate_app_icons) to have alternate icons in the app.
But the default behavior is to display an alert if the icon is updated (Displayed by the OS itself). 
But I’ve added a way to [change the icon silently](https://stackoverflow.com/a/49730130/8733843) as well.

Video Demostration of this feature - 

![App Icon change silently](https://github.com/raf-wtag/DynamicIdentity/assets/79823087/5e704504-e420-4585-af0f-13916bd60f29)
