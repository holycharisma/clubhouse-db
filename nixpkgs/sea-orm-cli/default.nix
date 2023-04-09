{ 
  fetchurl
, rustPlatform
, cmake
, pkg-config
, openssl
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "sea-orm-cli";
  version = "0.8.1";

  src = fetchurl {
    url = "https://crates.io/api/v1/crates/sea-orm-cli/0.8.1/download";
    sha256 = "sha256-/Khi/boSx1O/+6nJrfldPT9dzIL9WJsS+u7nBouxc9U=";
  };

  # fix the tarball name from crates.io
  preUnpack = ''
    cp $src $src.tar.gz
    export src=$src.tar.gz
  '';

  cargoSha256 = "sha256-Ppz5PuqDGq1yw3a3SHLR5mnOQuD7UOICFB/ms9ij0Sk=";

  nativeBuildInputs = [ cmake pkg-config installShellFiles ];
  buildInputs = [ 
      openssl
      openssl.bin
   ]; 

  doCheck = false;

}
