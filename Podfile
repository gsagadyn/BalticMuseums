platform :ios, '11.2'
inhibit_all_warnings!
use_frameworks!

# ----------------------------------------------------------------------------------------------------------------
# Pods Definition
# ----------------------------------------------------------------------------------------------------------------

def shared_pods
    pod 'Snapify'
    pod 'SnapKit'
    pod 'RxOptional'
    pod 'EstimoteSDK', '~> 4.27.0'
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
