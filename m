From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] unmodified_drivers: unplug the emulated
 devices at resume time
Date: Tue, 12 Jun 2018 17:05:44 +0200
Message-ID: <20180612170544.5b5a7d12.olaf@aepfle.de>
References: <20180612141013.15698-1-olaf@aepfle.de>
 <5B1FE03302000078001CA86C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8541209345280004262=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B1FE03302000078001CA86C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8541209345280004262==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ITiDg=aJIdnPFB07woDdedP"; protocol="application/pgp-signature"

--Sig_/ITiDg=aJIdnPFB07woDdedP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 12 Jun 2018 09:01:07 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> So there's no plan to fix this on the qemu side?

Even if there would be one, existing dom0s may not get an update in time.

I sent some prototype of a potential fix for qemu, it needs more work.


Olaf

--Sig_/ITiDg=aJIdnPFB07woDdedP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWx/hSAAKCRBdQqD6ppg2
fm9GAKDq1C6l3bm94uNUyJnkm9vPWctaSwCeIU+l4HHqTA6vVPDWw1bfZ/gUcys=
=yycN
-----END PGP SIGNATURE-----

--Sig_/ITiDg=aJIdnPFB07woDdedP--


--===============8541209345280004262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8541209345280004262==--
