# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'
 
 
target 'PDFPencilKit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
 
  # Pods for Nexpil
 
  #pod 'Whisper'
  #pod 'DropDown'
  #pod 'lottie-ios'
  #pod 'Pulley', '~> 2.6.3'
  #pod 'VerticalSteppedSlider'
  #pod 'UICircularProgressRing'
  #pod 'SVProgressHUD', '~> 2.2'
  #pod 'ImageSlideshow', '~> 1.5'
  #pod 'DWAnimatedLabel', '~> 1.1'
  #pod 'XLPagerTabStrip', '~> 8.0'
  #pod 'SQLite.swift', '~> 0.11.5'
  #pod 'GoogleMLKit/TextRecognition'
  #pod 'ASHorizontalScrollView', '~> 1.5.1'
  pod 'SkyFloatingLabelTextField'
  pod 'IQKeyboardManagerSwift'
 
end
 
 
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
