(declare-project
  :name "joy"
  :description "A full stack janet web framework"
  :dependencies ["https://github.com/andrewchambers/janet-uri"
                 "https://github.com/janet-lang/json"
                 "https://github.com/janet-lang/path"
                 "https://github.com/janet-lang/sqlite3"
                 "https://github.com/joy-framework/cipher"
                 "https://github.com/joy-framework/codec"
                 "https://github.com/joy-framework/halo"
                 "https://github.com/joy-framework/bundler"
                 "https://github.com/joy-framework/db"
                 "https://github.com/joy-framework/tester"
                 "https://github.com/joy-framework/dotenv"]
  :author "Sean Walker"
  :license "MIT"
  :url "https://github.com/joy-framework/joy"
  :repo "git+https://github.com/joy-framework/joy")

(declare-binscript
  :main "joy")

(declare-source
  :source @["src/joy" "src/joy.janet"])

# symlink joy executable in /usr/local/bin for convenience
(try
  (do
    (def JANET_BINPATH (or (os/getenv "JANET_BINPATH")
                           (string (dyn :syspath) "/bin")))
    (def joy-binscript (string (dyn :binpath JANET_BINPATH) "/joy"))
    (os/link joy-binscript "/usr/local/bin/joy" true))
  ([err]))
   # purposely ignore any errors here
