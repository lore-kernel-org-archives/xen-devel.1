From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] intel/iommu: setup inclusive mappings
 before enabling iommu
Date: Fri, 14 Sep 2018 15:07:29 +0200
Message-ID: <5c8132cb4ece4623608323408d22f75d5c325f63.camel@suse.com>
References: <20180914080243.20961-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8396344233888906344=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fooi=l4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0npK-0007h2-Vp
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 13:08:03 +0000
In-Reply-To: <20180914080243.20961-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============8396344233888906344==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VU5T7k3VYCymEy4urjjo"


--=-VU5T7k3VYCymEy4urjjo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-14 at 10:02 +0200, Roger Pau Monne wrote:
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
>=20
> This restores the behavior before commit 66a9274cc3435 that changed
> the order and enabled the iommu without having the inclusive mappings
> setup.
>=20
> Note that in order to restore previous behavior a new enable hook is
> added to the iommu_ops struct that's only used by VT-d.
>=20
> Reported-by: Dario Faggioli <dfaggioli@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
My box (the one that was freezing with current staging) boots fine if I
apply this patch.

Tested-by: Dario Faggioli <dfaggioli@suse.com>

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-VU5T7k3VYCymEy4urjjo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlubspIACgkQFkJ4iaW4
c+7YvxAAmbeIA14q+tdwRr6UocSDXvleoUcfDIj9ReYKdd35vWGjFjMUXzx8C1OH
ZM13IKvJyAoWWjhheceHhjyY88lLvXBN4mNfcMCEqBzMiWl9ZT16eZIk4f1KXlxd
2TaOsTbtEkk4I1YX37W3OvVN6lNJQLZ9YPGpbqPX/XejzSebEbym92R0A2vfLPuQ
NuOjl+XI1GxBVDtz0PyFHQU73R+dP4eBWINiHiaPaNNYvGbbs+r/hEwrq6vD8XFO
AaSkkexlFm1k67M2JORsncc+ROBPVRtupJvB9qJ7X64i6jp2NSoMcwoxrdQrz+XZ
SZsLh9bixnkIUa0OdcFq86mEZmTWFgvgkSp9STEngdbrNejMnk7/6waS4z15f/Q0
fjZ/nhdIkutJ5GnX/mE/tPL9+qXmaX/2K57jThrKTRsj04ZHsElF+10o2fvFEvQc
m94q/svLN3qMTQts3YZcMHjJq97sU1c3YaBEM2uJYNPgl1wA0vwVJu+PF/h/yztD
xDZS1p0a3G7ItcxDxhpr0+r43crOJyEBG9IcDzPS58bJSwfaBHMvS6NZkSTPvvhv
RPym47WFNGQVLx8H9+MzQvdoer/09hXwIXQa3Anxu9TpaGyjx1aJ+eJjUseuFjny
NiBHFoAQTn9wUF+WJYNfoGN0jm2H5j/TKfQgajCnUe4umEuKoPs=
=gHZ3
-----END PGP SIGNATURE-----

--=-VU5T7k3VYCymEy4urjjo--



--===============8396344233888906344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8396344233888906344==--
