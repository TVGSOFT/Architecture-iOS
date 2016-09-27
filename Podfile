source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

workspace 'Foody.xcworkspace'

target 'View' do
    project 'View/View.xcodeproj'

    #CocoaPod
    pod 'Alamofire', '~> 3.5'
    pod 'AlamofireImage', '~> 2.0'
    pod 'SwiftyJSON', '~> 2.3.2'
    
    pod 'DGElasticPullToRefresh', '~> 1.0.3'
    pod 'Material', :git => 'https://github.com/CosmicMind/Material.git', :branch => 'swift-2.3'
    pod 'IQKeyboardManagerSwift', '4.0.5'
    
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Swinject'

    pod 'RealmSwift'

    target 'ViewTests' do
        #CocoaPod
        pod 'RxBlocking'
        pod 'RxTests'
    end

    target 'ViewUITests' do

    end
end

target 'ViewModel' do
    project 'ViewModel/ViewModel.xcodeproj'

    #CocoaPod
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Swinject'
    
    pod 'RealmSwift'

    target 'ViewModelTests' do    
        #CocoaPod
        pod 'RxBlocking'
        pod 'RxTests'
    end
end

target 'Model' do
    project 'Model/Model.xcodeproj'
    
    #CocoaPod
    pod 'Alamofire', '~> 3.5'
    pod 'SwiftyJSON', '~> 2.3.2'

	pod 'RealmSwift'

    target 'ModelTests' do

    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end

