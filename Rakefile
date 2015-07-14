#
#
#

require 'java'
require 'ant'

# Defining Constants
PROJECT_NAME = 'HelloWorld'
SOURCE_DIR = 'src'
BUILD_DIR = 'build'
CLASSES_DIR = "#{BUILD_DIR}/classes"
JAR_DIR = "#{BUILD_DIR}/jars"
MAIN_CLASS = "sample.HelloWorld"

task :default => [ 'ant:clean', 'ant:compile' ]

namespace :ant do
  task :setup do
    ant.path :id => 'classpath' do
      fileset :dir => "."
    end
  end
  
  desc "Clean up the build directory"
  task :clean do
    ant.delete :dir => BUILD_DIR
    puts
  end

  desc "Compile the Classes"
  task :compile => [ :setup, :clean ] do
    ant.mkdir :dir => CLASSES_DIR
    ant.javac :includeantruntime => "no",
     :srcdir => SOURCE_DIR,
     :destdir => CLASSES_DIR
  end

  desc "Build the JARs"
  task :jar => [ :compile ] do
    ant.jar :destfile => "#{JAR_DIR}/#{PROJECT_NAME}.jar", :basedir => CLASSES_DIR do 
      manifest { attribute(:name => "Main-Class", :value => MAIN_CLASS) }  
    end
  end

  desc "Run the Class file"
  task :run_class => [ :compile ] do
    puts "Running the class file"
    ant.java :fork => "yes", 
      :failonerror => "yes",
      :dir => CLASSES_DIR,
      :classname => MAIN_CLASS
  end

  desc "Run the JAR file"
  task :run_jar => [ :jar ] do
    puts "Running the JAR file"
    ant.java :fork => "yes", :classname => MAIN_CLASS do
      classpath do
        path(:refid => 'classpath') 
        path(:location => "#{JAR_DIR}/#{PROJECT_NAME}.jar") 
      end
    end
  end
end

