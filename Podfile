# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

target 'Binder' do

  # Pods for Binder
  pod 'JSQMessagesViewController','~> 7.3'
  pod 'R.swift','~> 3.2'
  pod 'Firebase'
  pod 'Firebase/Database'
  pod 'Firebase/Auth'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
