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
      gnutls = gnutls.overrideAttrs (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
      });
      zsh = zsh.overrideAttrs (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
      });
      autogen = autogen.overrideAttrs (oldAttrs: {
        postInstall = ''
          mkdir -p $dev/bin
          mv $bin/bin/autoopts-config $dev/bin
          for f in $lib/lib/autogen/tpl-config.tlib $out/share/autogen/tpl-config.tlib; do
            sed -e "s|$dev/include|/no-such-autogen-include-path|" -i $f
            sed -e "s|$bin/bin|/no-such-autogen-bin-path|" -i $f
            sed -e "s|$lib/lib|/no-such-autogen-lib-path|" -i $f
          done
          # remove /tmp/** from RPATHs
          for f in "$bin"/bin/*; do
            local nrp="$(patchelf --print-rpath "$f" | sed -E 's@(:|^)/tmp/[^:]*:@\1@g')"
            patchelf --set-rpath "$nrp" "$f"
          done
        '' + stdenv.lib.optionalString (!stdenv.hostPlatform.isDarwin) ''
          # remove /build/** from RPATHs
          for f in "$bin"/bin/*; do
            local nrp="$(patchelf --print-rpath "$f" | sed -E 's@(:|^)/build/[^:]*:@\1@g')"
            patchelf --set-rpath "$nrp" "$f"
          done
        '';
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
