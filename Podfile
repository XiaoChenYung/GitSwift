# Podfile

def rx_swift
    pod 'RxSwift'
end

def rx_cocoa
    pod 'RxCocoa'
end

def test_pods
    pod 'RxTest'
    pod 'RxBlocking'
    pod 'Nimble'
end

def net_work
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
end

target 'GitSwift' do
    use_frameworks!
    rx_swift
    rx_cocoa
    pod 'RAMAnimatedTabBarController'
    pod 'SnapKit'
    pod 'Kingfisher'
    target 'GitSwiftTests' do
        inherit! :search_paths
        test_pods
    end
end

target 'Domain' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    
    target 'DomainTests' do
        inherit! :search_paths
        test_pods
    end
    
end

target 'NetWork' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    net_work

    target 'NetWorkTests' do
        inherit! :search_paths
        test_pods
    end
    
end

target 'GitClient' do
    
    use_frameworks!
    rx_swift
    net_work
    
    target 'GitClientTests' do
        inherit! :search_paths
        test_pods
    end
    
end
    
