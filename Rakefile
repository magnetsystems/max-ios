include FileUtils::Verbose

namespace :test do
  task :prepare do
    mkdir_p "Tests/MagnetMax Tests.xcodeproj/xcshareddata/xcschemes"
    cp Dir.glob('Tests/Schemes/*.xcscheme'), "Tests/MagnetMax Tests.xcodeproj/xcshareddata/xcschemes/"
  end

  desc "Run the MagnetMax Tests for iOS"
  task :ios => :prepare do
    simulators = get_ios_simulators
    destinations = Array.new
    simulators.each {|version, available_simulators|
      destinations.push("platform=iOS Simulator,OS=#{available_simulators[:runtime]},name=#{available_simulators[:device_names][0]}")
      puts "Will run tests for iOS Simulator on iOS #{available_simulators[:runtime]} using #{available_simulators[:device_names][0]}"
    }

    run_tests('iOS Tests', 'iphonesimulator', destinations)
    tests_failed('iOS') unless $?.success?
  end

  desc "Run the MagnetMax Tests for Mac OS X"
  task :osx => :prepare do
    run_tests('OS X Tests', 'macosx', ['platform=OS X,arch=x86_64'])
    tests_failed('OSX') unless $?.success?
  end
end

desc "Run the MagnetMax Tests for iOS & Mac OS X"
task :test do
  Rake::Task['test:ios'].invoke
  # Rake::Task['test:osx'].invoke if is_mavericks_or_above
end

task :default => 'test'


private

def run_tests(scheme, sdk, destinations)
  destinations = destinations.map! { |destination| "-destination \'#{destination}\'" }.join(' ')
  sh("xcodebuild -workspace MagnetMax.xcworkspace -scheme '#{scheme}' -sdk '#{sdk}' #{destinations} -configuration Release clean test | xcpretty -c -r junit ; exit ${PIPESTATUS[0]}") rescue nil
end

def is_mavericks_or_above
  osx_version = `sw_vers -productVersion`.chomp
  Gem::Version.new(osx_version) >= Gem::Version.new('10.9')
end

def tests_failed(platform)
  puts red("#{platform} unit tests failed")
  exit $?.exitstatus
end

def red(string)
 "\033[0;31m! #{string}"
end

def get_ios_simulators
  device_section_regex = /== Devices ==(.*?)(?=(?===)|\z)/m
  runtime_section_regex = /== Runtimes ==(.*?)(?=(?===)|\z)/m
  runtime_version_regex  = /iOS (.*) \((.*) - .*?\) (\(.*\))/
  xcrun_output = `xcrun simctl list`
  puts "Available iOS Simulators: \n#{xcrun_output}"

  simulators = Hash.new
  runtimes_section = xcrun_output.scan(runtime_section_regex)[0]
  runtimes_section[0].scan(runtime_version_regex) {|result|
    if result[2] !~ /unavailable/
      simulators[result[0]] = Hash.new
      simulators[result[0]][:runtime] = result[1]
    end
  }

  device_section = xcrun_output.scan(device_section_regex)[0]
  version_regex = /-- iOS (.*?) --(.*?)(?=(?=-- .*? --)|\z)/m
  simulator_name_regex = /(.*) \([A-F0-9-]*\) \(.*\)/
  device_section[0].scan(version_regex) {|result|
    if simulators.has_key?(result[0])
      simulators[result[0]][:device_names] = Array.new
      result[1].scan(simulator_name_regex) { |device_name_result|
        device_name = device_name_result[0].strip
        simulators[result[0]][:device_names].push(device_name)
      }
    end
   }
   return simulators
end
