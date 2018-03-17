source 'https://github.com/gsagadyn/CocoaPodsSpecs.git'
source 'https://github.com/artsy/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.2'
inhibit_all_warnings!
use_frameworks!

# ----------------------------------------------------------------------------------------------------------------
# Pods Definition
# ----------------------------------------------------------------------------------------------------------------

def shared_pods
    pod 'Snapify'
    pod 'SnapKit'
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'SwiftLint'
    pod 'SwiftGen'
    pod 'RxOptional'
    pod 'IQKeyboardManagerSwift'
end

target 'BalticMuseums' do
    shared_pods
end

# ----------------------------------------------------------------------------------------------------------------
# Setup Optimization Level
# ----------------------------------------------------------------------------------------------------------------

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = (config.name == 'Release' ? '-Owholemodule' : '-Onone')
    end
end
