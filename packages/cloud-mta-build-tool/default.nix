{
  supportedSystems,

  lib,

  buildGoModule,
  fetchFromGitHub
}: buildGoModule rec {
  pname = "Cloud MTA Build Tool";
  version = "1.2.34";

  src = fetchFromGitHub {
    owner = "SAP";
    repo = "cloud-mta-build-tool";
    rev = "refs/tags/v${version}";
    hash = "sha256-hnTvDDlttzMgC4MaMBymc78a/Fe3/1bdqUerFJovX2k=";
  };
  vendorHash = "sha256-vKHMSGncX3NjiS+htqBG+WCZdIRqx0rlsrTV+kfk7R8=";

  ldflags = ["-s" "-w" "-X main.Version=${version}"];

  doCheck = false;

  postInstall = ''
    pushd "''${out}/bin" &> /dev/null
    ln --symbolic 'cloud-mta-build-tool' 'mbt'
    popd
  '';

  meta = with lib; {
    description = "Multi-Target Application (MTA) build tool for Cloud Applications";
    homepage = "https://sap.github.io/cloud-mta-build-tool";
    license = licenses.asl20;
    changelog = "https://github.com/SAP/cloud-mta-build-tool/releases/tag/v${version}";
    platforms = supportedSystems;
    sourceProvenance = [ lib.sourceTypes.fromSource ];
  };
}
