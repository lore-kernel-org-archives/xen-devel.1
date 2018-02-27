From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Security Advisory 255 - grant table v2 -> v1
	transition may crash Xen
Date: Tue, 27 Feb 2018 23:37:37 +1100
Message-ID: <5824473.GPQyEnWDtB@dell15>
References: <E1eqdvU-0006ly-7n@xenbits.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5336668034199309779=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <E1eqdvU-0006ly-7n@xenbits.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: "Xen. org security team" <security@xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============5336668034199309779==
Content-Type: multipart/signed; boundary="nextPart2307857.GyM0ito94r"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2307857.GyM0ito94r
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 27 February 2018 11:00:08 PM AEDT Xen. org security team wrote:
>                     Xen Security Advisory XSA-255
>                               version 3
>=20
>              grant table v2 -> v1 transition may crash Xen
>=20
<snip>
> RESOLUTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Applying the appropriate attached patch resolves this issue.
>=20
> xsa255-?.patch         xen-unstable, Xen 4.10.x
> xsa255-4.9-?.patch     Xen 4.9.x, Xen 4.8.x
> xsa255-4.7-?.patch     Xen 4.7.x
> xsa255-4.6-?.patch     Xen 4.6.x

Is there a missing pre-requisite patch required for 4.6.6?

I'm currently getting a failure on these patches as follows:

Patch #55 (xsa255-4.6-1.patch):
+ echo 'Patch #55 (xsa255-4.6-1.patch):'
+ /bin/cat /builddir/build/SOURCES/xsa255-4.6-1.patch
+ /usr/bin/patch -p1 --fuzz=3D2
patching file xen/arch/arm/domain.c
patching file xen/arch/arm/mm.c
Hunk #2 FAILED at 1075.
Hunk #3 FAILED at 1090.
2 out of 3 hunks FAILED -- saving rejects to file xen/arch/arm/mm.c.rej

The patches for 4.7, 4.9 and 4.10 seem to apply successfully.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart2307857.GyM0ito94r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlqVUREACgkQQa811Xp9
MdzfFRAAu7cE8pi5cAcuJc1ZsZHzyQf7Z619Q2w99TrkM2QrMXVO42irewrDlKoH
XP2vGe9znnzTrmSw0+GvbIQkXp+G4+eoijQJ6EDheWTgsWTuV+QH6xXjZxamANC6
RE+x6wCsA63Zbyyq2/+ZJk3ZkCu0rk/t269Br1OxvMHqEHhF1BmqxdMjaGEQ4Blp
2LSYE5SpZmAXnzRsag2Mx5tZrmrJtsQ43embwZMm/5Q1M5bkYh/WqS+3FVmWMa6+
krhKJgeTW2/IwfTVHf5GdMel94wIav5+Gm1MDLcErHrlD0N4bDbki1IVRf4u89fo
aTvkgs6UH3Uz/45tkTb7WAbL7LrXfml3UW4fnERZWymP3XwqrAS0DTFDZeHZ6quV
DqSuteUOEThv4YBl2hCqO9I/HyE5x/deGxe/DccQuinLypL7aFdWY2aVvvOP9yMZ
2NPsxjhcD2AYgVtfkX7DgdZ25+O5OKG/9cqWku2sn5Gd/SvyCeKOz/hVKAj4NWOq
wdzenBbVWTXVGR+tOnh/fq0PDwfrB/E8IPMC44duhCQ4lkHH+iEV9lHktl0dgDNs
8X8K3s0GZG4dJbIuEVb6co3Xq422fhmG22spSK6WtP2ozZmQOSccR7nHYSq8YC1J
XNlrafKEloOn4TBpWl+2MoYK/tQYWf9rpXdVLCZARYeZyyV708A=
=3RuG
-----END PGP SIGNATURE-----

--nextPart2307857.GyM0ito94r--





--===============5336668034199309779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5336668034199309779==--
