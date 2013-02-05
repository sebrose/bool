require 'mkmf'

if CONFIG['CC'] =~ /mingw/
  $CFLAGS << ' -O2 -Werror' 
elsif CONFIG['CC'] =~ /gcc|clang/
  $CFLAGS << ' -O2 -Werror' 
end

extension_name = 'bool_ext'
dir_config(extension_name)

unless find_header('ast.h')
  abort "ast.h is missing."
end

create_makefile(extension_name)
