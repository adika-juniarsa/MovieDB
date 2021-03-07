# Uncomment the next line to define a global platform for your project
install! 'cocoapods', :warn_for_unused_master_specs_repo => false
platform :ios, '12.0'
use_frameworks!

def movies_pods
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'AlamofireNetworkActivityLogger'
  pod 'ReachabilitySwift'
  pod 'Kingfisher'
  pod 'SVPullToRefresh'
  pod "youtube-ios-player-helper"
end

target 'Movies DB' do
  movies_pods
end

target 'Movies DBTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'Movies DBUITests' do
  # Pods for testing
end
