Pod::Spec.new do |s|
    s.name             = "Segment-Singular"
    s.version          = "1.0.0"
    s.summary          = "Singular integration for Segment"

    s.description      = "This is the Singular integration for Segment"
    s.authors          = "Singular Labs"
    s.homepage         = "https://www.segment.com"
    s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.source           = { :git => "https://github.com/singular-labs/segment-singular-ios.git", :tag => s.version.to_s }

    s.ios.deployment_target = "8.0"
    s.ios.source_files      = 'Segment-Singular-iOS/*.{h,m,mm}', 'Singular-iOS-SDK/*.{h}'
    s.ios.dependency 'Analytics', '~> 3.0'
    s.ios.vendored_library = 'Singular-iOS-SDK/libSingular.a'
    s.ios.libraries = ['sqlite3', 'z']
    s.ios.frameworks = 'SystemConfiguration'
    s.ios.pod_target_xcconfig = {
        'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Segment-Singular-iOS/Singular-iOS-SDK/**',
        'OTHER_LDFLAGS' => '$(inherited) -l"Singular"'
    }
end
