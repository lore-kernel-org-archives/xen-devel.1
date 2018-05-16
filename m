From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Wed, 16 May 2018 16:53:28 +0200
Message-ID: <20180516165328.73d2a86a.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180510104018.GA2057@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1844536511975099720=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180510104018.GA2057@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============1844536511975099720==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/1ir2caURImpqzXWfHXdsmm6"; protocol="application/pgp-signature"

--Sig_/1ir2caURImpqzXWfHXdsmm6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 10 May 2018 11:40:18 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> I did fix the bug in QEMU 2.11 (5d6c599fe1d69a1bf8c5c4d3c58be2b31cd625ad)
> so Xen 4.11 does include it it the qemu-xen tree.

Is this supposed to be called also for PV? In my testing qmp_xen_save_devic=
es_state shows up only on HVM.

Olaf

--Sig_/1ir2caURImpqzXWfHXdsmm6
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvxF6AAKCRBdQqD6ppg2
flAjAJwJvS9Gcqai1nxNlKY4I+7ytpz2ngCgpN1N857FfD6TfqFWZCbF+GxBOvg=
=IT22
-----END PGP SIGNATURE-----

--Sig_/1ir2caURImpqzXWfHXdsmm6--


--===============1844536511975099720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1844536511975099720==--
