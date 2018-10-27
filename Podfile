# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def network
  pod 'Moya', '~> 11.0'
end

def formatter
  pod 'SwiftLint', '~> 0.26.0'
  pod 'SwiftFormat/CLI', '0.33.7'
  pod 'Sourcery', '0.13.1'
end

target 'QiitaExample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for QiitaExample
  network
  formatter

  target 'QiitaExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'QiitaExampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
