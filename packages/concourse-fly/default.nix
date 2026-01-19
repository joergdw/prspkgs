{
  lib,

  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  stdenv
}: buildGoModule rec {
  pname = "fly";
  version = "7.10.0";

  src = fetchFromGitHub {
    owner = "concourse";
    repo = "concourse";
    rev = "v${version}";
    hash = "sha256-KmKIr7Y3CQmv1rXdju6xwUHABqj/dkXpgWc/yNrAza8=";
  };

  vendorHash = "sha256-lc0okniezfTNLsnCBIABQxSgakRUidsprrEnkH8il2g=";

  subPackages = [ "fly" ];

  ldflags = [
    "-s"
    "-w"
    "-X github.com/concourse/concourse.Version=${version}"
  ];

  nativeBuildInputs = [ installShellFiles ];

  doCheck = false;

  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    installShellCompletion --cmd fly \
                --bash <($out/bin/fly completion --shell bash) \
                --fish <($out/bin/fly completion --shell fish) \
                --zsh <($out/bin/fly completion --shell zsh)
  '';

  meta = {
    description = "Command line interface to Concourse CI";
    longDescription = ''
      This is a port of the fly-cli for concourse to newer build-tools. It makes the cli run on more
      recent macOS-versions (≥ 26.x).
    '';
    mainProgram = "fly";
    homepage = "https://concourse-ci.org";
    license = lib.licenses.asl20;
    originalMaintainers = with lib.maintainers; [
      ivanbrennan
      SuperSandro2000
    ];
  };
}
