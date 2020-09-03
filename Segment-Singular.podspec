Pod::Spec.new do |s|
    s.name             = "Segment-Singular"
    s.version          = "1.2.0"
    s.summary          = "Singular integration for Segment"

    s.description      = "This is the Singular integration for Segment"
    s.authors          = "Singular Labs"
    s.homepage         = "https://www.segment.com"
    s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.source           = { :git => "https://github.com/singular-labs/segment-singular-ios.git", :tag => s.version.to_s }

    s.static_framework = true
    s.ios.deployment_target = "8.0"
    s.ios.source_files      = 'Segment-Singular-iOS/*.{h,m,mm}'
    s.ios.dependency 'Analytics'
    s.ios.dependency 'Singular-SDK'
end
