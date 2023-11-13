Name:           cgame
Version:        1.0.0    
Release:        2%{?dist}
Summary:        guess the number game   

License:        GPLv3+
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make

%description
an interactive game that challenges users to guess a randomly generated number between 1 and 100.

%prep
%setup -q


%build
make %{?_smp_mflags}


%install
make install DESTDIR=%{buildroot}


%files
%{_bindir}/%{name}


%changelog
* Mon Nov 13 2023 First Last <first@example.com> - 1.0-2
- Initial package