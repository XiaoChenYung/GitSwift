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

target 'GitSwift' do
    use_frameworks!
    rx_swift
    rx_cocoa
    
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
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
    
    target 'NetWorkTests' do
        inherit! :search_paths
        test_pods
    end
    
end
