From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] iommu: setup inclusive mappings before
 enabling iommu
Date: Fri, 14 Sep 2018 18:35:45 +0200
Message-ID: <3f7a1365869f97de24b4f46f0eeebde5b3e4922d.camel@suse.com>
References: <20180914135843.24899-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8034284366691686182=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fooi=l4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0r57-0000UF-RX
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 16:36:33 +0000
In-Reply-To: <20180914135843.24899-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org


--===============8034284366691686182==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SvA+XlwxT/Nr+46Rgegr"


--=-SvA+XlwxT/Nr+46Rgegr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-14 at 15:58 +0200, Roger Pau Monne wrote:
> Or else it can lead to freezes when enabling the iommu on certain
> Intel hardware:
>=20
> [...]
> (XEN) ELF: addresses:
> (XEN)     virt_base        =3D 0xffffffff80000000
> (XEN)     elf_paddr_offset =3D 0x0
> (XEN)     virt_offset      =3D 0xffffffff80000000
> (XEN)     virt_kstart      =3D 0xffffffff81000000
> (XEN)     virt_kend        =3D 0xffffffff82953000
> (XEN)     virt_entry       =3D 0xffffffff8274e180
> (XEN)     p2m_base         =3D 0x8000000000
> (XEN)  Xen  kernel: 64-bit, lsb, compat32
> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x295300
> <freeze>
>=20
> This restores the behavior before commit 66a9274cc3435 that changed
> the order and enabled the iommu without having the inclusive mappings
> setup.
>=20
> Note that on AMD hardware the order is also changed to add inclusive
> mappings before adding any devices.
>=20
> Reported-by: Dario Faggioli <dfaggioli@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
I tested this too (sorry it took a bit more) and, like v1, it works.

Tested-by: Dario Faggioli <dfaggioli@suse.com>

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-SvA+XlwxT/Nr+46Rgegr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlub42IACgkQFkJ4iaW4
c+6hqA//dQQOU/8aqNbSoQUCWEKQPXV09h7xe3U4qb6AFY/ucjHrzQPfuXNZC7KQ
OyDXJyLCSAzlNmjRI3glG6jeANGh3Rc1WZFjCkZTUpI1Xxoi4BJbBzZupzg2ClBh
+Rj+HfQRPnv0PHE8TIRKjoAM59qV+E+B/QqyiylSawG0coIHeaUfjwx1vxqMaCE2
0FF10S/VF87zWgjKCSp8mQF+6lejdEQMC7NUKrcU/W/ClYcqfnXtLi4DvgHeRfKr
POqj2u3+YFolVZpqKw1vB4NLIXdrXz8dH+KJ484YulkvX36GT26mUCq/tFojXvD2
R1RsVXRbqB4tRq/O1I3IU2xa4OEv6TPPaIPL/W6mv2+ki8+Or+GbnK9GXswI9Vo8
O9eApyWkpXKpp1UQCTbNMLGoc6Hwt+7ozCzCgAFNjhtHekZP2H4tUPt4WXkdkKH7
jibW61agTMtwoi+uZJZJJ7enP8pKxSrIbA4/D3ZuhdXRaKLC3B/uSJcK5F5irpW8
YEhSWaM2fWt3FXKjAO7JS5VBHk729Sv7oeFxi/7JPDNlV4zvBp6H8RhIq4CdUD2u
jZcQFvRFJn0vj0n71nfgsaB90h7R4zAvajy65e4tOqD5CAB8XCLnBViQTLGab0q7
58++iksacrzJePr3hNI5LJ9xpI7g2ys5pA3XO4Et9IYl+ak7lSU=
=AuKq
-----END PGP SIGNATURE-----

--=-SvA+XlwxT/Nr+46Rgegr--



--===============8034284366691686182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8034284366691686182==--
