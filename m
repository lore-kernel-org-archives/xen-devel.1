From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Xen Security Advisory 254 - Information leak via
 side effects of speculative execution
Date: Fri, 5 Jan 2018 11:22:25 -0600
Message-ID: <10684fe8-5aca-3ce0-c109-1c7cd1d952be@cardoe.com>
References: <E1eWrXs-0007D0-Bg@xenbits.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3518798959862378143=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <E1eWrXs-0007D0-Bg@xenbits.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org, xen-devel@lists.xen.org, xen-users@lists.xen.org, oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3518798959862378143==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="8IQptyakRbnfMa8SSyuCeDWFRbyMuvG3R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8IQptyakRbnfMa8SSyuCeDWFRbyMuvG3R
Content-Type: multipart/mixed; boundary="43cm8qMKcf7xGHs54TlcvDEc9E1uMLr3o";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Message-ID: <10684fe8-5aca-3ce0-c109-1c7cd1d952be@cardoe.com>
Subject: Re: [Xen-devel] Xen Security Advisory 254 - Information leak via side
 effects of speculative execution
References: <E1eWrXs-0007D0-Bg@xenbits.xenproject.org>
In-Reply-To: <E1eWrXs-0007D0-Bg@xenbits.xenproject.org>

--43cm8qMKcf7xGHs54TlcvDEc9E1uMLr3o
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I'm just adding some comments below on some updates that might be
helpful to add to help clarify things for interested parties. These
comments are driven purely based on the questions that I've had to field
from others.

- Since this advisory talks about 3 CVEs and then breaks the issue into
3 items SP1, SP2 and SP3 it would be helpful to directly map them to
their CVEs.
- There has been some confusion around mitigation and resolution where
people misunderstand the terms and therefore there might be some value
in providing some updates to provide some more clarity.

>=20
> SP1, "Bounds-check bypass": Poison the branch predictor, such that
> operating system or hypervisor code is speculatively executed past
> boundary and security checks.  This would allow an attacker to, for
> instance, cause speculative code in the normal hypercall / emulation
> path to execute with wild array indexes.

please add CVE-2017-5753

>=20
> SP2, "Branch Target Injection": Poison the branch predictor.
> Well-abstracted code often involves calling function pointers via
> indirect branches; reading these function pointers may involve a
> (slow) memory access, so the CPU attempts to guess where indirect
> branches will lead.  Poisoning this enables an attacker to
> speculatively branch to any code that exists in the hypervisor.

please add CVE-2017-5715


>=20
> SP3, "Rogue Data Load": On some processors, certain pagetable
> permission checks only happen when the instruction is retired;
> effectively meaning that speculative execution is not subject to
> pagetable permission checks.  On such processors, an attacker can
> speculatively execute arbitrary code in userspace with, effectively,
> the highest privilege level.

please add CVE-2017-5754 and/or reference this is meltdown.

>=20
> MITIGATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> There is no mitigation for SP1 and SP2.
>=20
> SP3 can be mitigated by running guests in HVM or PVH mode.
>=20
> For guests with legacy PV kernels which cannot be run in HVM mode, we
> have developed a "shim" hypervisor that allows PV guests to run in PVH
> mode.  Unfortunately, due to the accelerated schedule, this is not yet
> ready to release.  We expect to have it ready for 4.10, as well as PVH
> backports to 4.9 and 4.8, available over the next few days.
>=20
> RESOLUTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> There is no available resolution for SP1 or SP3.

I believe there has been some confusion among some people about the
terms here. There are some people that understand "mitigation" as "what
can I do now to avoid this" and "resolution" as "what updates can I
apply". As a result they are misunderstanding here what the net result
is. Some clarifications could be that the PVH shim is the resolution for
the SP3 issue. However its not a fix for PV itself but instead changes
the very nature of how PV guests are started up.


--=20
Doug Goldstein


--43cm8qMKcf7xGHs54TlcvDEc9E1uMLr3o--

--8IQptyakRbnfMa8SSyuCeDWFRbyMuvG3R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpPtFFfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3uIRAAgPDbI32pAZafdRYBbqYgytdFb26s5elMJIiP0GFbNxiA3YhbDU/BSxSH
58QTd3p+fjWBBKSnkWR3kwFuFdlQoPXaFXRh4aLthnuF2oSs3XV4S1vZt57QyZcV
f9OMpItxlrq/1W7XD8t5suY9ZZPll1RNYl3wGQUSa7SI8KxEcFmqUOfRlWw+bM0z
fZOsfilxhCGpMJUJipqcukKMk5Ok3EJQm1aonZAScLo5txDZD7kic4NF3xkC6dpY
HelCO2TDcXtFvLY0TMk2TWuqcz56ijbVPJG/4QkBf6iXpWFt8/Olw1deuUR0mX/A
aFtWbUHm7Uvgugq0Iu7LQOhVgNXGf8VrmHpijxtxDbd3E90VydZkg72aCvdrTxv6
xXHNblT+TIbswCNSxY13mnszgOtfOcd0+IUYVDf63abzn3x3IXWfsFHJRiuDlOm4
9W+UNvylh25FCdYsRDNRKsESq1eliX0gEeU2DSIRZfWeXJ99uQnFvPbPxTMfL8eJ
PtC2NZhQ25hEgNw2dn/tIqkvOkqYNM1zRytGZ9UaziyF5Mll49kQQY7pKeN7MD8W
j1JkFmmkz/smBB9fwXnjpFhnfotaZYRQVtI6/7QtB2z3AbaJC55+RVZZwr6U+DmP
CrgjjPet/hPdgDG969D6/nU4Kx5+M4h/2MBz07UpUvavbyiG6rE=
=oWc2
-----END PGP SIGNATURE-----

--8IQptyakRbnfMa8SSyuCeDWFRbyMuvG3R--


--===============3518798959862378143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3518798959862378143==--
