Summary: This package is a sample for quickly build dummy RPM package.
Name: dummy_package
Version: 0.0.1
Release: 1%{?dist}
License: GPL
Packager: Udo Seidel
Group: Development/Tools
Source: %{name}.tar.gz
##BuildRequires: coreutils, make, gcc

%global debug_package %{nil}

%description
%{summary}

%prep
%setup -n dummy_package

%build
###make hello_world

%install
mkdir -p "%{buildroot}/opt/dummy_package"
cp downtime.icinga2.sh "%{buildroot}/opt/dummy_package/"

%files
/opt/dummy_package/downtime.icinga2.sh

%clean

%post
chmod 755 -R /opt/dummy_package

%changelog
* Wed Oct 05 2022 Udo Seidel <udoseidel@gmx.de>
- initial release

