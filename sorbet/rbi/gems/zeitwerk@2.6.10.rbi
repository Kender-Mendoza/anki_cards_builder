# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `zeitwerk` gem.
# Please instead update this file by running `bin/tapioca gem zeitwerk`.

# source://zeitwerk//lib/zeitwerk/kernel.rb#3
module Kernel
  private

  # source://zeitwerk//lib/zeitwerk/kernel.rb#27
  def require(path); end

  class << self
    # source://zeitwerk//lib/zeitwerk/kernel.rb#27
    def require(path); end
  end
end

# source://zeitwerk//lib/zeitwerk.rb#3
module Zeitwerk
  class << self
    # This is a dangerous method.
    #
    # source://zeitwerk//lib/zeitwerk.rb#20
    def with_loader; end
  end
end

# source://zeitwerk//lib/zeitwerk/error.rb#4
class Zeitwerk::Error < ::StandardError; end

# Centralizes the logic for the trace point used to detect the creation of
# explicit namespaces, needed to descend into matching subdirectories right
# after the constant has been defined.
#
# The implementation assumes an explicit namespace is managed by one loader.
# Loaders that reopen namespaces owned by other projects are responsible for
# loading their constant before setup. This is documented.
#
# source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#11
module Zeitwerk::ExplicitNamespace
  extend ::Zeitwerk::RealModName

  class << self
    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#35
    def __register(cpath, loader); end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#53
    def __registered?(cpath); end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#45
    def __unregister_loader(loader); end

    private

    # Maps constant paths that correspond to explicit namespaces according to
    # the file system, to the loader responsible for them.
    #
    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#20
    def cpaths; end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#58
    def disable_tracer_if_unneeded; end

    # Returns the value of attribute mutex.
    #
    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#24
    def mutex; end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#35
    def register(cpath, loader); end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#53
    def registered?(cpath); end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#65
    def tracepoint_class_callback(event); end

    # Returns the value of attribute tracer.
    #
    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#28
    def tracer; end

    # source://zeitwerk//lib/zeitwerk/explicit_namespace.rb#45
    def unregister_loader(loader); end
  end
end

# source://zeitwerk//lib/zeitwerk/gem_inflector.rb#5
class Zeitwerk::GemInflector < ::Zeitwerk::Inflector
  # @return [GemInflector] a new instance of GemInflector
  #
  # source://zeitwerk//lib/zeitwerk/gem_inflector.rb#6
  def initialize(root_file); end

  # source://zeitwerk//lib/zeitwerk/gem_inflector.rb#13
  def camelize(basename, abspath); end
end

# @private
#
# source://zeitwerk//lib/zeitwerk/gem_loader.rb#5
class Zeitwerk::GemLoader < ::Zeitwerk::Loader
  # @return [GemLoader] a new instance of GemLoader
  #
  # source://zeitwerk//lib/zeitwerk/gem_loader.rb#19
  def initialize(root_file, namespace:, warn_on_extra_files:); end

  # source://zeitwerk//lib/zeitwerk/gem_loader.rb#34
  def setup; end

  private

  # source://zeitwerk//lib/zeitwerk/gem_loader.rb#42
  def warn_on_extra_files; end

  class << self
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/gem_loader.rb#14
    def __new(root_file, namespace:, warn_on_extra_files:); end
  end
end

# source://zeitwerk//lib/zeitwerk/inflector.rb#4
class Zeitwerk::Inflector
  # Very basic snake case -> camel case conversion.
  #
  #   inflector = Zeitwerk::Inflector.new
  #   inflector.camelize("post", ...)             # => "Post"
  #   inflector.camelize("users_controller", ...) # => "UsersController"
  #   inflector.camelize("api", ...)              # => "Api"
  #
  # Takes into account hard-coded mappings configured with `inflect`.
  #
  # source://zeitwerk//lib/zeitwerk/inflector.rb#15
  def camelize(basename, _abspath); end

  # Configures hard-coded inflections:
  #
  #   inflector = Zeitwerk::Inflector.new
  #   inflector.inflect(
  #     "html_parser"   => "HTMLParser",
  #     "mysql_adapter" => "MySQLAdapter"
  #   )
  #
  #   inflector.camelize("html_parser", abspath)      # => "HTMLParser"
  #   inflector.camelize("mysql_adapter", abspath)    # => "MySQLAdapter"
  #   inflector.camelize("users_controller", abspath) # => "UsersController"
  #
  # source://zeitwerk//lib/zeitwerk/inflector.rb#32
  def inflect(inflections); end

  private

  # Hard-coded basename to constant name user maps that override the default
  # inflection logic.
  #
  # source://zeitwerk//lib/zeitwerk/inflector.rb#42
  def overrides; end
end

# This is a private module.
#
# source://zeitwerk//lib/zeitwerk/internal.rb#4
module Zeitwerk::Internal
  # source://zeitwerk//lib/zeitwerk/internal.rb#5
  def internal(method_name); end
end

# source://zeitwerk//lib/zeitwerk/loader.rb#6
class Zeitwerk::Loader
  include ::Zeitwerk::RealModName
  include ::Zeitwerk::Loader::Callbacks
  include ::Zeitwerk::Loader::Helpers
  include ::Zeitwerk::Loader::Config
  include ::Zeitwerk::Loader::EagerLoad
  extend ::Zeitwerk::Internal
  extend ::Zeitwerk::RealModName

  # @return [Loader] a new instance of Loader
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#98
  def initialize; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#42
  def __autoloaded_dirs; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#32
  def __autoloads; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#76
  def __namespace_dirs; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#308
  def __shadowed_file?(file); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#87
  def __shadowed_files; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#58
  def __to_unload; end

  # @raise [Zeitwerk::Error]
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#232
  def cpath_expected_at(path); end

  # Unloads all loaded code, and calls setup again so that the loader is able
  # to pick any changes in the file system.
  #
  # This method is not thread-safe, please see how this can be achieved by
  # client code in the README of the project.
  #
  # @raise [Zeitwerk::Error]
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#221
  def reload; end

  # Sets autoloads in the root namespaces.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#117
  def setup; end

  # Removes loaded constants and configured autoloads.
  #
  # The objects the constants stored are no longer reachable through them. In
  # addition, since said objects are normally not referenced from anywhere
  # else, they are eligible for garbage collection, which would effectively
  # unload them.
  #
  # This method is public but undocumented. Main interface is `reload`, which
  # means `unload` + `setup`. This one is available to be used together with
  # `unregister`, which is undocumented too.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#143
  def unload; end

  # Says if the given constant path would be unloaded on reload. This
  # predicate returns `false` if reloading is disabled.
  #
  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#283
  def unloadable_cpath?(cpath); end

  # Returns an array with the constant paths that would be unloaded on reload.
  # This predicate returns an empty array if reloading is disabled.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#291
  def unloadable_cpaths; end

  # This is a dangerous method.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#299
  def unregister; end

  private

  # source://zeitwerk//lib/zeitwerk/loader.rb#454
  def autoload_file(parent, cname, file); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#512
  def autoload_path_set_by_me_for?(parent, cname); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#424
  def autoload_subdir(parent, cname, subdir); end

  # We keep track of autoloaded directories to remove them from the registry
  # at the end of eager loading.
  #
  # Files are removed as they are autoloaded, but directories need to wait due
  # to concurrency (see why in Zeitwerk::Loader::Callbacks#on_dir_autoloaded).
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#42
  def autoloaded_dirs; end

  # Maps absolute paths for which an autoload has been set ---and not
  # executed--- to their corresponding parent class or module and constant
  # name.
  #
  #   "/Users/fxn/blog/app/models/user.rb"          => [Object, :User],
  #   "/Users/fxn/blog/app/models/hotel/pricing.rb" => [Hotel, :Pricing]
  #   ...
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#32
  def autoloads; end

  # Returns the value of attribute mutex.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#91
  def mutex; end

  # Returns the value of attribute mutex2.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#95
  def mutex2; end

  # Maps namespace constant paths to their respective directories.
  #
  # For example, given this mapping:
  #
  #   "Admin" => [
  #     "/Users/fxn/blog/app/controllers/admin",
  #     "/Users/fxn/blog/app/models/admin",
  #     ...
  #   ]
  #
  # when `Admin` gets defined we know that it plays the role of a namespace
  # and that its children are spread over those directories. We'll visit them
  # to set up the corresponding autoloads.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#76
  def namespace_dirs; end

  # `dir` is the directory that would have autovivified a namespace. `file` is
  # the file where we've found the namespace is explicitly defined.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#480
  def promote_namespace_from_implicit_to_explicit(dir:, file:, parent:, cname:); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#526
  def raise_if_conflicting_directory(dir); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#521
  def register_explicit_namespace(cpath); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#550
  def run_on_unload_callbacks(cpath, value, abspath); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#491
  def set_autoload(parent, cname, abspath); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#408
  def set_autoloads_in_dir(dir, parent); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#308
  def shadowed_file?(file); end

  # A shadowed file is a file managed by this loader that is ignored when
  # setting autoloads because its matching constant is already taken.
  #
  # This private set is populated as we descend. For example, if the loader
  # has only scanned the top-level, `shadowed_files` does not have shadowed
  # files that may exist deep in the project tree yet.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#87
  def shadowed_files; end

  # Stores metadata needed for unloading. Its entries look like this:
  #
  #   "Admin::Role" => [".../admin/role.rb", [Admin, :Role]]
  #
  # The cpath as key helps implementing unloadable_cpath? The file name is
  # stored in order to be able to delete it from $LOADED_FEATURES, and the
  # pair [Module, Symbol] is used to remove_const the constant from the class
  # or module object.
  #
  # If reloading is enabled, this hash is filled as constants are autoloaded
  # or eager loaded. Otherwise, the collection remains empty.
  #
  # source://zeitwerk//lib/zeitwerk/loader.rb#58
  def to_unload; end

  # source://zeitwerk//lib/zeitwerk/loader.rb#557
  def unload_autoload(parent, cname); end

  # source://zeitwerk//lib/zeitwerk/loader.rb#563
  def unload_cref(parent, cname); end

  class << self
    # Returns an array with the absolute paths of the root directories of all
    # registered loaders. This is a read-only collection.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#402
    def all_dirs; end

    # Returns the value of attribute default_logger.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#318
    def default_logger; end

    # Sets the attribute default_logger
    #
    # @param value the value to set the attribute default_logger to.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#318
    def default_logger=(_arg0); end

    # Broadcasts `eager_load` to all loaders. Those that have not been setup
    # are skipped.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#374
    def eager_load_all; end

    # Broadcasts `eager_load_namespace` to all loaders. Those that have not
    # been setup are skipped.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#388
    def eager_load_namespace(mod); end

    # This is a shortcut for
    #
    #   require "zeitwerk"
    #
    #   loader = Zeitwerk::Loader.new
    #   loader.tag = File.basename(__FILE__, ".rb")
    #   loader.inflector = Zeitwerk::GemInflector.new(__FILE__)
    #   loader.push_dir(__dir__)
    #
    # except that this method returns the same object in subsequent calls from
    # the same file, in the unlikely case the gem wants to be able to reload.
    #
    # This method returns a subclass of Zeitwerk::Loader, but the exact type
    # is private, client code can only rely on the interface.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#336
    def for_gem(warn_on_extra_files: T.unsafe(nil)); end

    # This is a shortcut for
    #
    #   require "zeitwerk"
    #
    #   loader = Zeitwerk::Loader.new
    #   loader.tag = namespace.name + "-" + File.basename(__FILE__, ".rb")
    #   loader.inflector = Zeitwerk::GemInflector.new(__FILE__)
    #   loader.push_dir(__dir__, namespace: namespace)
    #
    # except that this method returns the same object in subsequent calls from
    # the same file, in the unlikely case the gem wants to be able to reload.
    #
    # This method returns a subclass of Zeitwerk::Loader, but the exact type
    # is private, client code can only rely on the interface.
    #
    # source://zeitwerk//lib/zeitwerk/loader.rb#357
    def for_gem_extension(namespace); end
  end
end

# source://zeitwerk//lib/zeitwerk/loader/callbacks.rb#3
module Zeitwerk::Loader::Callbacks
  include ::Zeitwerk::RealModName

  # Invoked from our decorated Kernel#require when a managed directory is
  # autoloaded.
  #
  # @private
  #
  # source://zeitwerk//lib/zeitwerk/loader/callbacks.rb#34
  def on_dir_autoloaded(dir); end

  # Invoked from our decorated Kernel#require when a managed file is autoloaded.
  #
  # @private
  #
  # source://zeitwerk//lib/zeitwerk/loader/callbacks.rb#10
  def on_file_autoloaded(file); end

  # Invoked when a class or module is created or reopened, either from the
  # tracer or from module autovivification. If the namespace has matching
  # subdirectories, we descend into them now.
  #
  # @private
  #
  # source://zeitwerk//lib/zeitwerk/loader/callbacks.rb#73
  def on_namespace_loaded(namespace); end

  private

  # source://zeitwerk//lib/zeitwerk/loader/callbacks.rb#84
  def run_on_load_callbacks(cpath, value, abspath); end
end

# source://zeitwerk//lib/zeitwerk/loader/config.rb#6
module Zeitwerk::Loader::Config
  include ::Zeitwerk::RealModName
  extend ::Zeitwerk::Internal

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#86
  def initialize; end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#296
  def __ignores?(abspath); end

  def __roots; end

  # Configure directories or glob patterns to be collapsed.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#216
  def collapse(*glob_patterns); end

  # If `namespaces` is falsey (default), returns an array with the absolute
  # paths of the root directories as strings. If truthy, returns a hash table
  # instead. Keys are the absolute paths of the root directories as strings,
  # values are their corresponding namespaces, class or module objects.
  #
  # If `ignored` is falsey (default), ignored root directories are filtered out.
  #
  # These are read-only collections, please add to them with `push_dir`.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#156
  def dirs(namespaces: T.unsafe(nil), ignored: T.unsafe(nil)); end

  # Let eager load ignore the given files or directories. The constants defined
  # in those files are still autoloadable.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#198
  def do_not_eager_load(*paths); end

  # You need to call this method before setup in order to be able to reload.
  # There is no way to undo this, either you want to reload or you don't.
  #
  # @raise [Zeitwerk::Error]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#177
  def enable_reloading; end

  # Configure files, directories, or glob patterns to be totally ignored.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#205
  def ignore(*glob_patterns); end

  # Returns the value of attribute inflector.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#11
  def inflector; end

  # Sets the attribute inflector
  #
  # @param value the value to set the attribute inflector to.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#11
  def inflector=(_arg0); end

  # Logs to `$stdout`, handy shortcut for debugging.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#288
  def log!; end

  # Returns the value of attribute logger.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#14
  def logger; end

  # Sets the attribute logger
  #
  # @param value the value to set the attribute logger to.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#14
  def logger=(_arg0); end

  # Configure a block to be invoked once a certain constant path is loaded.
  # Supports multiple callbacks, and if there are many, they are executed in
  # the order in which they were defined.
  #
  #   loader.on_load("SomeApiClient") do |klass, _abspath|
  #     klass.endpoint = "https://api.dev"
  #   end
  #
  # Can also be configured for any constant loaded:
  #
  #   loader.on_load do |cpath, value, abspath|
  #     # ...
  #   end
  #
  # @raise [TypeError]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#252
  def on_load(cpath = T.unsafe(nil), &block); end

  # Configure a block to be called after setup and on each reload.
  # If setup was already done, the block runs immediately.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#228
  def on_setup(&block); end

  # Configure a block to be invoked right before a certain constant is removed.
  # Supports multiple callbacks, and if there are many, they are executed in the
  # order in which they were defined.
  #
  #   loader.on_unload("Country") do |klass, _abspath|
  #     klass.clear_cache
  #   end
  #
  # Can also be configured for any removed constant:
  #
  #   loader.on_unload do |cpath, value, abspath|
  #     # ...
  #   end
  #
  # @raise [TypeError]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#277
  def on_unload(cpath = T.unsafe(nil), &block); end

  # Pushes `path` to the list of root directories.
  #
  # Raises `Zeitwerk::Error` if `path` does not exist, or if another loader in
  # the same process already manages that directory or one of its ascendants or
  # descendants.
  #
  # @raise [Zeitwerk::Error]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#111
  def push_dir(path, namespace: T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#190
  def reloading_enabled?; end

  # Returns the loader's tag.
  #
  # Implemented as a method instead of via attr_reader for symmetry with the
  # writer below.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#135
  def tag; end

  # Sets a tag for the loader, useful for logging.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#142
  def tag=(tag); end

  private

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#314
  def actual_roots; end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#339
  def collapse?(dir); end

  # The actual collection of absolute directory names at the time the collapse
  # glob patterns were expanded. Computed on setup, and recomputed on reload.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#57
  def collapse_dirs; end

  # Absolute paths of directories or glob patterns to be collapsed.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#50
  def collapse_glob_patterns; end

  # Absolute paths of files or directories not to be eager loaded.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#63
  def eager_load_exclusions; end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#326
  def excluded_from_eager_load?(abspath); end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#349
  def expand_glob_patterns(glob_patterns); end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#344
  def expand_paths(paths); end

  # Absolute paths of files, directories, or glob patterns to be totally
  # ignored.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#36
  def ignored_glob_patterns; end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#309
  def ignored_path?(abspath); end

  # The actual collection of absolute file and directory names at the time the
  # ignored glob patterns were expanded. Computed on setup, and recomputed on
  # reload.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#44
  def ignored_paths; end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#296
  def ignores?(abspath); end

  # User-oriented callbacks to be fired when a constant is loaded.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#76
  def on_load_callbacks; end

  # User-oriented callbacks to be fired on setup and on reload.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#69
  def on_setup_callbacks; end

  # User-oriented callbacks to be fired before constants are removed.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#83
  def on_unload_callbacks; end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#361
  def recompute_collapse_dirs; end

  # source://zeitwerk//lib/zeitwerk/loader/config.rb#356
  def recompute_ignored_paths; end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#321
  def root_dir?(dir); end

  # Absolute paths of the root directories, mapped to their respective root namespaces:
  #
  #   "/Users/fxn/blog/app/channels" => Object,
  #   "/Users/fxn/blog/app/adapters" => ActiveJob::QueueAdapters,
  #   ...
  #
  # Stored in a hash to preserve order, easily handle duplicates, and have a
  # fast lookup by directory.
  #
  # This is a private collection maintained by the loader. The public
  # interface for it is `push_dir` and `dirs`.
  #
  # source://zeitwerk//lib/zeitwerk/loader/config.rb#29
  def roots; end
end

# source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#1
module Zeitwerk::Loader::EagerLoad
  # Eager loads all files in the root directories, recursively. Files do not
  # need to be in `$LOAD_PATH`, absolute file names are used. Ignored and
  # shadowed files are not eager loaded. You can opt-out specifically in
  # specific files and directories with `do_not_eager_load`, and that can be
  # overridden passing `force: true`.
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#9
  def eager_load(force: T.unsafe(nil)); end

  # @raise [Zeitwerk::SetupRequired]
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#32
  def eager_load_dir(path); end

  # @raise [Zeitwerk::SetupRequired]
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#74
  def eager_load_namespace(mod); end

  # Loads the given Ruby file.
  #
  # Raises if the argument is ignored, shadowed, or not managed by the receiver.
  #
  # The method is implemented as `constantize` for files, in a sense, to be able
  # to descend orderly and make sure the file is loadable.
  #
  # @raise [Zeitwerk::Error]
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#116
  def load_file(path); end

  private

  # The caller is responsible for making sure `namespace` is the namespace that
  # corresponds to `dir`.
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#160
  def actual_eager_load_dir(dir, namespace, force: T.unsafe(nil)); end

  # In order to invoke this method, the caller has to ensure `child` is a
  # strict namespace descendant of `root_namespace`.
  #
  # source://zeitwerk//lib/zeitwerk/loader/eager_load.rb#195
  def eager_load_child_namespace(child, child_name, root_dir, root_namespace); end
end

# source://zeitwerk//lib/zeitwerk/loader/helpers.rb#3
module Zeitwerk::Loader::Helpers
  private

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#128
  def cdef?(parent, cname); end

  # @raise [NameError]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#134
  def cget(parent, cname); end

  # @raise [Zeitwerk::NameError]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#149
  def cname_for(basename, abspath); end

  # Symbol#name was introduced in Ruby 3.0. It returns always the same
  # frozen object, so we may save a few string allocations.
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#118
  def cpath(parent, cname); end

  # @raise [NameError]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#140
  def crem(parent, cname); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#67
  def dir?(path); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#45
  def has_at_least_one_ruby_file?(dir); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#72
  def hidden?(basename); end

  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#7
  def log(message); end

  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#15
  def ls(dir); end

  # @return [Boolean]
  #
  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#62
  def ruby?(path); end

  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#109
  def strict_autoload_path(parent, cname); end

  # source://zeitwerk//lib/zeitwerk/loader/helpers.rb#77
  def walk_up(abspath); end
end

# source://zeitwerk//lib/zeitwerk/loader/helpers.rb#144
module Zeitwerk::Loader::Helpers::CNAME_VALIDATOR; end

# source://zeitwerk//lib/zeitwerk/loader.rb#20
Zeitwerk::Loader::MUTEX = T.let(T.unsafe(nil), Thread::Mutex)

# source://zeitwerk//lib/zeitwerk/error.rb#13
class Zeitwerk::NameError < ::NameError; end

# source://zeitwerk//lib/zeitwerk/real_mod_name.rb#3
module Zeitwerk::RealModName
  # source://zeitwerk//lib/zeitwerk/real_mod_name.rb#14
  def real_mod_name(mod); end
end

# source://zeitwerk//lib/zeitwerk/real_mod_name.rb#4
Zeitwerk::RealModName::UNBOUND_METHOD_MODULE_NAME = T.let(T.unsafe(nil), UnboundMethod)

# source://zeitwerk//lib/zeitwerk/registry.rb#4
module Zeitwerk::Registry
  class << self
    # Maps absolute paths to the loaders responsible for them.
    #
    # This information is used by our decorated `Kernel#require` to be able to
    # invoke callbacks and autovivify modules.
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#26
    def autoloads; end

    # Registers gem loaders to let `for_gem` be idempotent in case of reload.
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#17
    def gem_loaders_by_root_file; end

    # @private
    # @return [Boolean]
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#113
    def inception?(cpath); end

    # This hash table addresses an edge case in which an autoload is ignored.
    #
    # For example, let's suppose we want to autoload in a gem like this:
    #
    #   # lib/my_gem.rb
    #   loader = Zeitwerk::Loader.new
    #   loader.push_dir(__dir__)
    #   loader.setup
    #
    #   module MyGem
    #   end
    #
    # if you require "my_gem", as Bundler would do, this happens while setting
    # up autoloads:
    #
    #   1. Object.autoload?(:MyGem) returns `nil` because the autoload for
    #      the constant is issued by Zeitwerk while the same file is being
    #      required.
    #   2. The constant `MyGem` is undefined while setup runs.
    #
    # Therefore, a directory `lib/my_gem` would autovivify a module according to
    # the existing information. But that would be wrong.
    #
    # To overcome this fundamental limitation, we keep track of the constant
    # paths that are in this situation ---in the example above, "MyGem"--- and
    # take this collection into account for the autovivification logic.
    #
    # Note that you cannot generally address this by moving the setup code
    # below the constant definition, because we want libraries to be able to
    # use managed constants in the module body:
    #
    #   module MyGem
    #     include MyConcern
    #   end
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#65
    def inceptions; end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#121
    def loader_for(path); end

    # This method returns always a loader, the same instance for the same root
    # file. That is how Zeitwerk::Loader.for_gem is idempotent.
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#89
    def loader_for_gem(root_file, namespace:, warn_on_extra_files:); end

    # Keeps track of all loaders. Useful to broadcast messages and to prevent
    # them from being garbage collected.
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#11
    def loaders; end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#127
    def on_unload(loader); end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#95
    def register_autoload(loader, abspath); end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#107
    def register_inception(cpath, abspath, loader); end

    # Registers a loader.
    #
    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#71
    def register_loader(loader); end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#101
    def unregister_autoload(abspath); end

    # @private
    #
    # source://zeitwerk//lib/zeitwerk/registry.rb#77
    def unregister_loader(loader); end
  end
end

# source://zeitwerk//lib/zeitwerk/error.rb#7
class Zeitwerk::ReloadingDisabledError < ::Zeitwerk::Error
  # @return [ReloadingDisabledError] a new instance of ReloadingDisabledError
  #
  # source://zeitwerk//lib/zeitwerk/error.rb#8
  def initialize; end
end

# source://zeitwerk//lib/zeitwerk/error.rb#16
class Zeitwerk::SetupRequired < ::Zeitwerk::Error
  # @return [SetupRequired] a new instance of SetupRequired
  #
  # source://zeitwerk//lib/zeitwerk/error.rb#17
  def initialize; end
end

# source://zeitwerk//lib/zeitwerk/version.rb#4
Zeitwerk::VERSION = T.let(T.unsafe(nil), String)
