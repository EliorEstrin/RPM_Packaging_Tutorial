#!/bin/bash
install_packages() {
  echo "Installing necessary packages..."
  sudo yum install -y rpmdevtools rpmlint
}

setup_rpm_build() {
  echo "Setting up the RPM build environment..."
  rpmdev-setuptree
}

prepare_game_package() {
  echo "Preparing the game package..."
  mkdir cgame-1.0.0
  mv cgame.c Makefile cgame-1.0.0/
}

create_tarball() {
  echo "Creating a tarball of the game package..."
  tar -czvf cgame-1.0.0.tar.gz cgame-1.0.0
}

move_to_rpm_sources() {
  echo "Moving the tarball to the RPM build SOURCES directory..."
  mv cgame-1.0.0.tar.gz ~/rpmbuild/SOURCES/
}

move_spec_file(){
  echo "Performing move_spec_file operation..."
  mv cgame.spec ~/rpmbuild/SPECS/
}

bump_spec(){
  echo "Performing bump_spec operation..."
  rpmdev-bumpspec --comment 'Initial package' ~/rpmbuild/SPECS/cgame.spec
}

lint_spec(){
  echo "Performing lint_spec operation..."
  rpmlint ~/rpmbuild/SPECS/cgame.spec
}

build_package(){
  rpmbuild -bb ~/rpmbuild/SPECS/cgame.spec
}

# Main script execution
echo "Make sure you are inside the repo folder when you run this script"
install_packages
setup_rpm_build
prepare_game_package
create_tarball
move_to_rpm_sources
move_spec_file
bump_spec
lint_spec
build_package

echo "Script execution completed successfully."
