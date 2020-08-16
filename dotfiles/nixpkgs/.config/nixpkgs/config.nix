{
  packageOverrides = pkgs:
    with pkgs; {
      libuv = libuv.overrideAttrs (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
      });
      bash-completion = bash-completion.overrideAttrs (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
      });
      nix = nix.overrideAttrs (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
        prePatch = ''
          substituteInPlace src/libstore/local-store.cc \
            --replace '(eaName == "security.selinux")' \
                      '(eaName == "security.selinux" || eaName == "system.nfs4_acl")'
          substituteInPlace src/libstore/gc.cc \
            --replace 'auto mapLines =' \
                      'continue; auto mapLines ='
          substituteInPlace src/libstore/sqlite.cc \
            --replace 'SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, 0) != SQLITE_OK)' \
                      'SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, "unix-dotfile") != SQLITE_OK)'
        '';
      });
    };
}

# pkgs: {
#   packageOverrides = self: {
#     nix = self.nix.override {
#       storeDir = "/users/home/rog32/.nix/store";
#       stateDir = "/users/home/rog32/.nix/var";
#     };
#   };
# }
