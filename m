From: Olaf Hering <olaf@aepfle.de>
Subject: Re: memory leak in block/xen_disk in qemu-3.x
Date: Tue, 11 Dec 2018 17:07:52 +0100
Message-ID: <20181211160752.GD18447@aepfle.de>
References: <20181211153047.GB18447@aepfle.de>
 <74c1c30c147444cea915ee1befa56cf6@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7736515679904603336=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t2nM=OU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gWkZm-0000qp-9n
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:08:02 +0000
In-Reply-To: <74c1c30c147444cea915ee1befa56cf6@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org


--===============7736515679904603336==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline


--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, Paul Durrant wrote:

> > -----Original Message-----
> > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On Beha=
lf
> > Of Olaf Hering
> > Sent: 11 December 2018 15:31
> > To: xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
> > Subject: [Xen-devel] memory leak in block/xen_disk in qemu-3.x
> >=20
> > What are the live time rules of ioreq->buf?
> > In my testing the memory usage of qemu is constantly growing from about
> > 250MB to several GB after a few days.
> Are you perhaps running into the problem addressed by this patch?
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg00244.html

This looks like a fix, rather than an improvement.
More than a month passed already, why is it not yet in qemu.git#master?

Olaf

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXA/g1QAKCRBdQqD6ppg2
fhfgAJ9RbUUcFAEtEsrsGiJTIS7yNgRGfACg8QiXSJxRrueSFhGycacns2r8BUg=
=cLnZ
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--


--===============7736515679904603336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7736515679904603336==--
