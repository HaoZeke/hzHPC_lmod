self: super: {
  haskell = super.haskell // {
    packageOverrides =
      super.lib.composeExtensions super.haskell.packageOverrides
      (hself: hsuper: {
        mkDerivation = args: hsuper.mkDerivation (args // { doCheck = false; });
      });
  };
}
