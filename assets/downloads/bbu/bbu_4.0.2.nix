with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "bbu";

  src = fetchurl {
    url = http://oocran.dynu.com/bbu_4.0.2.tar.gz;
    sha256 ="c0bc22ca2f9f1516de4276b409096bc004af7dbc7d347c249a984a3caa39125c";
  };

  buildInputs = [ boost libusb cmake git uhd qwt fftw python27Full fftwFloat fftwLongDouble python27Packages.psutil_1 python2.7-requests-1.2.3  ];

  installPhase = ''
    make install
    cp -r $(pwd) "$out/build"
    mkdir "$out/bin"
    mv srslte/examples/pdsch_enodeb "$out/bin/bbutx"
    mv srslte/examples/pdsch_ue "$out/bin/bburx"
  '';

  meta = {
    description = "Open Orchestrator Cloud Radio Access Network";
    homepage = http://www.oocran.dynu.com;
    license = "AGPLv3";
  };
}