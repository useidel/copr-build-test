Summary: This package is a sample for quickly build dummy RPM package.
Name: dummy_package
Version: 0.0
Release: 1
License: GPL
Packager: Udo Seidel
Group: Development/Tools
Source: %{name}.tar.gz
BuildRequires: coreutils

%description
%{summary}

%prep
%setup -n dummy_package

%build
make hello_world

%install
mkdir -p "%{buildroot}/opt/dummy_package"
cp hello_world "%{buildroot}/opt/dummy_package/"

%files
/opt/dummy_package/hello_world

%clean
%if "%{clean}" != ""
  rm -rf %{_topdir}/BUILD/%{name}
  [ %{buildroot} == "%{name}-%{version}-%{release}.%{_target_cpu}" ] && rm -rf %{buildroot}
%endif

%post
chmod 755 -R /opt/dummy_package

%changelog
* Wed Oct 05 2022 Udo Seidel <udoseidel@gmx.de>
- initial release

