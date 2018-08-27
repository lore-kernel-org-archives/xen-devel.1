From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Unable to build staging-4.9 on RHEL6
Date: Mon, 27 Aug 2018 21:30:17 +1000
Message-ID: <4042528.4QxGzAFDWl@wopr.lan.crc.id.au>
References: <b4cf0fe633df980a1d9299ae1520be9a@crc.id.au>
 <2134533.qq8BOla9DR@wopr.lan.crc.id.au>
 <5B83D44202000078001E21D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8459039196476254782=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suj4=lk=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fuFiz-0000iM-LQ
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 11:30:26 +0000
In-Reply-To: <5B83D44202000078001E21D7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============8459039196476254782==
Content-Type: multipart/signed; boundary="nextPart3354417.A8d4g6hQpE"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3354417.A8d4g6hQpE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Monday, 27 August 2018 8:36:50 PM AEST Jan Beulich wrote:
> >>> On 27.08.18 at 12:03, <netwiz@crc.id.au> wrote:
> > On Monday, 27 August 2018 6:32:17 PM AEST Jan Beulich wrote:
> >> >>> On 24.08.18 at 04:56, <netwiz@crc.id.au> wrote:
> >> > When trying to build both xen and qemu-xen from the staging-4.9
> >> > branches, I'm running into issues compiling.
> >> >=20
> >> > Errors start with:
> >> >=20
> >> > BUILDSTDERR: sse.c: In function 'simd_test':
> >> > BUILDSTDERR: sse.c:319: error: subscripted value is neither array nor
> >> > pointer
> >>=20
> >> That's the x86 insn emulator test harness afaict, which doesn't get
> >> built unless you explicitly ask for it. Why are you building it? It's
> >> well known that it requires a new enough compiler (and the bar will
> >> raise with AVX512 support, which is in the works).
> >=20
> > Hi Jan,
> >=20
> > I don't specifically enable any testing (that I'm aware of).
> >=20
> > The current SPEC file that I'm using is at:
> > https://git.crc.id.au/netwiz/xen49/src/devel/SPECS/xen49.spec
> >=20
> > Essentially it boils down to:
> > ./configure --enable-systemd --prefix=3D/usr --enable-xsmpolicy
> > %{?enable_ocaml}
> > \
> >=20
> >   --libdir=3D%{_libdir} --enable-efi --disable-qemu-traditional \
> >   --with-extra-qemuU-configure-args=3D"--enable-spice --enable-usb-redi=
r"
> >=20
> > (cd xen; make defconfig; sed -i 's/# CONFIG_LIVEPATCH is not set/
> > CONFIG_LIVEPATCH=3Dy/g' .config; make oldconfig)
> >=20
> > export XEN_DOMAIN=3Dxen.crc.id.au
> > make %{?_smp_mflags} %{?efi_flags} dist
>=20
> It's this last step which is of interest afaict; how you configure
> things does not seem to matter. The dist target implies building
> dist-tools, which in turn has install-tools as a dependency. Most
> of the sub-directories under tools/tests/ have an empty
> install target in their makefiles though, which means nothing is
> going to be done when entering the respective directories.

This is actually interesting.

I tried originally doing a 'make build', then 'make DESTDIR=3D%{buildroot}=
=20
install' - however I found that this didn't produce any EFI binaries in /bo=
ot/
efi/efi/$EFI_VENDOR/ like the 'make dist' option does.

This seemed to persist across all versions (4.6 - 4.10) hence the path that=
 I=20
had taken.

Should this then be a part of fixing why no EFI binaries exist in the make=
=20
build / make install method, and not trying to fix a test as a side effect =
of=20
having to use 'make dist'?
=20
> > I'll note that 4.6, 4.7, and 4.10 do not fail in this fashion using alm=
ost
> > the same command set to build.
>=20
> I can't spot any relevant difference between the versions you
> mention (or master). I'm afraid you'll need to dig a little deeper
> yourself (unless someone else has an idea).
>=20
> Jan



=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart3354417.A8d4g6hQpE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAluD4MkACgkQQa811Xp9
MdxuaQ/+LQvE8WC+YSsDMAiNIAqw7bwv7K1An92wFGqM0XMECPziDVt4g+ZzsaBC
2oIHBsb+1wQ+varA60iAtNyXU3dMzmXkIz+c5EsNbN3ztZrcjn8KJTgOREQ1fOE5
p1LzlC+lvQPXS92dDfCwcOXc/Rav0pBRUNh+BGORyQiMHEeJQus6HlWxBRvG/NsL
9Ajw+hPa9Jm/9ZT0Y7N+kwr9ZXXB1UOZgDsnCIhXaUeJfSp6yEc4qfLvyAsq+G5i
RuOZUNltx5C58G5fbI/oq9fFQFHbXBn+DKlVE5pPG/iVcsUKtlKdFd8gcMy9srps
zhYdyHD3S86GcpJE5NehRMpscUrbAtHdw/IomftG4S6T2aDXnkSsuyuIadj0Nhll
9kuuO3HAU7BAAJi6EtHcBDGK19GadqHlFA7AGoi0j50VAi52iAr5khj5FUomscyQ
qbo+ZzvrssFYmjKkRekVjb2VQlNvR6zDfJlVvJfF0IfvGz6p2rrmMVGZY/iodZcn
pFjEIjt2SE0cRClEUjf92faiz1rK8SXnt8xuPoNdCoNRaS1kuWemF5gkBbI0vd8S
zGhoqArq6xSKabkfTFLH+qSN8H25IvntFx0rdWzIOI3Jtd6azaXiFmEtfRHg1JZs
8M15IVBg/n1b5vxj7oka70Ai7v9f1IZpWjLkXYdNQWtUrUQkXWc=
=N/jm
-----END PGP SIGNATURE-----

--nextPart3354417.A8d4g6hQpE--





--===============8459039196476254782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8459039196476254782==--
