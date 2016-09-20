source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

workspace 'Foody.xcworkspace'

target 'View' do
    project 'View/View.xcodeproj'

    #CocoaPod
    pod 'Alamofire', '~> 3.0'
    pod 'AlamofireImage', '~> 2.0'
    pod 'SwiftyJSON'
    
    pod 'DGElasticPullToRefresh'
    pod 'Material', '~> 1.0'
	pod 'IQKeyboardManagerSwift'

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
    pod 'Alamofire', '~> 3.0'
    pod 'SwiftyJSON'

	pod 'RealmSwift'

    target 'ModelTests' do

    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '2.2'
    end
  end
end

