{ pkgs, home-manager, username, ... }:
{  
   # ---- Home Configuration ----
   home-manager.users.${username} = { pkgs, ... }: {
    programs.bash = {
      enable = true;
    };
   };

  # ---- System Configuration ----
  programs.bash = {
    interactiveShellInit = ''
      	nitch
    '';
    shellAliases = {
	cp = "cp -ia";
	mv = "mv -i";
  ls = "exa";
  ll = "exa -alh";
  tree = "exa --tree";
  b = "btop";
	c = "clear";
	e = "exit";

	g = "git";
	ga = "git add";
	gaa = "git add --all";
	gap = "git add --patch";
	gapp = "git apply";
	gb = "git branch --verbose";
	gbr = "git branch --verbose --remotes";
	gbd = "git branch --delete";
	gbD = "git branch --delete --force";
	gc = "git commit -m";
	gca = "git commit --amend";
	gcl = "git clone";
	gco = "git checkout";
	gcot = "git checkout --theirs";
	gcp = "git cherry-pick --strategy-option theirs";
	gcpx = "git cherry-pick --strategy-option theirs -x";
	gd = "git diff";
	gds = "git diff --staged";
	gf = "git fetch";
	gi = "git init";
	gl = "git log --oneline --decorate --graph -n 10";
	gm = "git merge";
	gp = "git push";
	gpu = "git pull";
	gr = "git reset HEAD~";
	gR = "git restore";
	gRs = "git restore --staged";
	gra = "git remote add";
	gre = "git remote --verbose";
	grh = "git reset HEAD";
	grr = "git reset --hard HEAD~";
	grb = "git rebase --interactive";
	grbc = "git rebase --continue";
	gs = "git status";
	gsma = "git submodule add";
	gsmu = "git submodule update --init --remote --recursive";
	gst = "git stash";
	gstp = "git stash pop";
	gsw = "git switch";
	gt = "git tag";
	gts = "git tag -s";

	vim = "nvim";
	n = "nvim";
	t = "tmux";
	r = "ranger";

	nf = "nix flake";
	nfu = "nix flake update";
	nd = "nix develop";
	nb = "nix build";
	ns = "nix shell";
	nr = "nix run";
	ncg = "sudo nix-collect-garbage -d";
	sw = "sudo nixos-rebuild switch --flake .";
	vm = "nixos-rebuild build-vm --flake . && ./result/bin/run-nixos-vm && trash put result nixos.qcow2";

	ci = "cargo init";
	cin = "cargo info";
	cu = "cargo update";
	ca = "cargo add";
	cab = "cargo add --build";
	cad = "cargo add --dev";
	cb = "cargo build";
	cr = "cargo run";
	cs = "cargo search";
	ct = "cargo tree --depth 1";
	cn = "cargo new";
	crm = "cargo remove";
	crmb = "cargo remove --build";
	crmd = "cargo remove --dev";
	cc = "cargo clippy";
	cf = "cargo fmt";

	py = "${pkgs.python312}/bin/python3";
      };
    };

}
