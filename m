From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Unable to build staging-4.9 on RHEL6
Date: Mon, 27 Aug 2018 20:03:36 +1000
Message-ID: <2134533.qq8BOla9DR@wopr.lan.crc.id.au>
References: <b4cf0fe633df980a1d9299ae1520be9a@crc.id.au>
 <5B83B71102000078001E205E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8930529402286483863=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=suj4=lk=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fuENC-0001sS-L4
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 10:03:50 +0000
In-Reply-To: <5B83B71102000078001E205E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============8930529402286483863==
Content-Type: multipart/signed; boundary="nextPart2595603.JacL9BJ3Y3"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2595603.JacL9BJ3Y3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Monday, 27 August 2018 6:32:17 PM AEST Jan Beulich wrote:
> >>> On 24.08.18 at 04:56, <netwiz@crc.id.au> wrote:
> > When trying to build both xen and qemu-xen from the staging-4.9
> > branches, I'm running into issues compiling.
> >=20
> > Errors start with:
> >=20
> > BUILDSTDERR: sse.c: In function 'simd_test':
> > BUILDSTDERR: sse.c:319: error: subscripted value is neither array nor
> > pointer
>=20
> That's the x86 insn emulator test harness afaict, which doesn't get
> built unless you explicitly ask for it. Why are you building it? It's
> well known that it requires a new enough compiler (and the bar will
> raise with AVX512 support, which is in the works).

Hi Jan,

I don't specifically enable any testing (that I'm aware of).

The current SPEC file that I'm using is at:
https://git.crc.id.au/netwiz/xen49/src/devel/SPECS/xen49.spec

Essentially it boils down to:
=2E/configure --enable-systemd --prefix=3D/usr --enable-xsmpolicy %{?enable=
_ocaml}=20
\
  --libdir=3D%{_libdir} --enable-efi --disable-qemu-traditional \
  --with-extra-qemuU-configure-args=3D"--enable-spice --enable-usb-redir"

(cd xen; make defconfig; sed -i 's/# CONFIG_LIVEPATCH is not set/
CONFIG_LIVEPATCH=3Dy/g' .config; make oldconfig)

export XEN_DOMAIN=3Dxen.crc.id.au
make %{?_smp_mflags} %{?efi_flags} dist

I'll note that 4.6, 4.7, and 4.10 do not fail in this fashion using almost =
the=20
same command set to build.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart2595603.JacL9BJ3Y3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAluDzHgACgkQQa811Xp9
MdwImQ/+M8Ft7Aa40KN2oDceQ7nByemfoD+nvu/FeSmgIUuumSLBvZPQYHXl8iI0
TBPfTUeYk3dgMP/d1jaqBFohgDmtFrqI2SSnHGKJy/w5t0yeGfbrkx4ZADaJHp8G
RYKL8QbssjuHYRobz6thGWTGKXWX3Es2DC5/y4nCCcARi1AdFIjpMWBwsyXT8ri6
TTXRIy8HlPQIiE5WoXvTlwAdmDf0gymlorhOKqHEFW2rXx4i5fiLF2u2mucMiyce
TOW9l8q/1yyBMhL8DII5BdwgLMc8xE203D1X9xkPtInWK9OlDHYM7kDg1O1FwTvz
ey0n+eSHbO8VfvIglTsOQjK1vj7M0qfI+ozFGldO1WvvRjhkqtX+Jb51h/QUzPgy
etWVevUKFDwHw5N6y4aFvCagGhH5yrXoZoSRo0v1vhWpTJk3rCDBByp9j7ifun4m
Q7/IrZaxP7fC2wzj7w4zkcNeF4+0TjgF4NfXNv4Rtm/OtcON3pk0r1JL6O4MHR8V
f8ZhYJKHpC+eUvDdqeip0RUvrtAOcekO5At99qz9S8q72CzqPzv8GonQXvuji8fe
YG+ui9OTZGHsMNT7yy6zb1GkGMZddb75IO2LkEh7gCm02paU8hFVN40za4NXW2q5
Ts7ldvavHMXXn0+K6mYZSxli13smk1OEMR/qB1FsswCqR9Fp2W4=
=sQhw
-----END PGP SIGNATURE-----

--nextPart2595603.JacL9BJ3Y3--





--===============8930529402286483863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8930529402286483863==--
