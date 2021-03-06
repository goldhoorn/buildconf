# Write in this file customization code that will get executed before 
# autoproj is loaded.

# Set the path to 'make'
# Autobuild.commands['make'] = '/path/to/ccmake'

# Set the parallel build level (defaults to the number of CPUs)
# Autobuild.parallel_build_level = 10

# Uncomment to initialize the environment variables to default values. This is
# useful to ensure that the build is completely self-contained, but leads to
# miss external dependencies installed in non-standard locations.
#
# set_initial_env
#
# Additionally, you can set up your own custom environment with calls to env_add
# and env_set:
#
# env_add 'PATH', "/path/to/my/tool"
# env_set 'CMAKE_PREFIX_PATH', "/opt/boost;/opt/xerces"
# env_set 'CMAKE_INSTALL_PATH', "/opt/orocos"
#
# NOTE: Variables set like this are exported in the generated 'env.sh' script.
#

require 'autoproj/gitorious'
Autoproj.gitorious_server_configuration('GITORIOUS', 'gitorious.org')
Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
Autoproj.gitorious_server_configuration('SPACEGIT', 'git.hb.dfki.de', :fallback_to_http => false, default: 'ssh', disabled_methods: 'http,git')

Autoproj.env_set 'TYPELIB_CXX_LOADER', 'clang'
Autoproj.env_inherit 'CMAKE_PREFIX_PATH'

Autoproj.env_set 'CFLAGS', '-std=c++11'
Autoproj.env_set 'CXXFLAGS', '-std=c++11'
Autoproj.post_import do |pkg|
    if pkg.kind_of?(Autobuild::CMake)
	pkg.define 'ROCK_USE_CXX11','true'
    end
end


