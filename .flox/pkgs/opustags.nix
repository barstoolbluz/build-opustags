{ stdenv
, lib
, fetchFromGitHub
, cmake
, pkg-config
, libogg
}:

stdenv.mkDerivation rec {
  pname = "opustags";
  version = "1.10.1";

  src = fetchFromGitHub {
    owner = "fmang";
    repo = "opustags";
    rev = version;  # Tag without 'v' prefix
    hash = "sha256-0lo+4VMYXGwXUuRxU1xZRxzlUQ4o4n/CDHXDM27FK44=";
  };

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ libogg ];

  # CMake build configuration
  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  meta = with lib; {
    description = "Ogg Opus tag editor";
    longDescription = ''
      opustags is an Ogg Opus tag editor. It reads and edits the comment header
      of Ogg Opus audio files, with full UTF-8 support. It can also convert Vorbis
      comments to and from ID3v2 tags.
    '';
    homepage = "https://github.com/fmang/opustags";
    license = licenses.bsd3;
    maintainers = [ ];
    platforms = platforms.unix;
    mainProgram = "opustags";
  };
}
