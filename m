From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] xen-pciback: Allow enabling/disabling
 expansion ROM
Date: Mon, 3 Dec 2018 15:47:38 +0100
Message-ID: <20181203144738.GQ781__42612.8991567113$1543848391$gmane$org@mail-itl>
References: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <a05e3cf451d692dc4b1c81c8b5d66fc75d1fa325.1543772656.git-series.marmarek@invisiblethingslab.com>
 <5C050CF3020000780020223F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2616467087599527543=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo7p=OM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gTpVg-0003tm-ID
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 14:47:44 +0000
In-Reply-To: <5C050CF3020000780020223F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Dwayne Litzenberger <dlitz@dlitz.net>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org


--===============2616467087599527543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YPYi+6JBnn8IjLOH"
Content-Disposition: inline


--YPYi+6JBnn8IjLOH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 04:01:07AM -0700, Jan Beulich wrote:
> >>> On 02.12.18 at 18:47, <marmarek@invisiblethingslab.com> wrote:
> > From: Dwayne Litzenberger <dlitz@dlitz.net>
> >=20
> > Newer AMD GPUs store their initialization routines as bytecode on the
> > ROM.  This fixes the following initialization error inside the VM when
> > doing PCI passthrough:
> >=20
> >     radeon 0000:00:05.0: Invalid PCI ROM header signature: expecting 0x=
aa55, got 0xffff
> >     radeon 0000:00:05.0: Invalid PCI ROM header signature: expecting 0x=
aa55, got 0xffff
> >     [drm:radeon_get_bios [radeon]] *ERROR* Unable to locate a BIOS ROM
> >     radeon 0000:00:05.0: Fatal error during GPU init
>=20
> Isn't it that qemu is supposed to surface the ROM image to guests,
> making it unnecessary to allow guests control over the physical
> enable bit?=20

Unless that qemu is in stubdomain, where it use pciback to access
everything about the device...

> Also why would allowing to alter the bit depend on
> whether the address portion of the value is non-zero?

That's a good question. According to commit message I think it should be
a ROM presence check instead. If needed at this point at all - is this
function even called if there is no ROM?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--YPYi+6JBnn8IjLOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwFQgoACgkQ24/THMrX
1yzHOwgAlmyX8AwWoWYIW87CGtuTbVpBXQmaYjhCULHvRQaHsxW2b2xeviyuAScY
cC3TKViZwgtFEHkH/mODR96Dn0KDxabDMxIym/FAXu179KS5lPpFZQhNo1oDNaL6
072FLHQ1xOXxqHVUp4AQOc9gBnXmFGXBG+WXqOyCT0/PiJDeymucnsQuu1jdVRgb
5pU2gsB8bYbyy6ZXfpbLLm/mQR8i6k8SR0TBmNHK5H43SR4eUDDPZQqOCwyWTBUn
hMfSw2zUyNJllugBbclxxXEFZM+Vq8ZAiriqND/xLWl4wrlpqT654E2aymSD6qTU
djuJIkiQ15nhaZe7UecjCpyRyegojA==
=IdtU
-----END PGP SIGNATURE-----

--YPYi+6JBnn8IjLOH--


--===============2616467087599527543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2616467087599527543==--
