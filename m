From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] Increase framebuffer size to todays
 standards
Date: Mon, 26 Nov 2018 17:03:35 +0100
Message-ID: <20181126170335.01a6ac58.olaf@aepfle.de>
References: <20181125191405.3028-1-olaf@aepfle.de>
 <5BFBCB7F02000078001FFD9B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7501960092973797448=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bbsm=of=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRJMW-0000e6-SS
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 16:03:53 +0000
In-Reply-To: <5BFBCB7F02000078001FFD9B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7501960092973797448==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/FoLqpkE49XPOQQmvnUgwcZ8"; protocol="application/pgp-signature"

--Sig_/FoLqpkE49XPOQQmvnUgwcZ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 26 Nov 2018 03:31:27 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> And I think a change like this should (a) address the more general
> case rather than just your laptop (or laptops in general) and (b)
> actually add some headroom. Hence at the very least I'd see us
> go to 4096x3072. WHUXGA would even call for 7680x4800.

So should I resend this patch with higher values, or should I remove
the bounds check entirely? Not sure what it is trying to achieve, the
framebuffer may fail either way if the BIOS provides bogus values.

Olaf

--Sig_/FoLqpkE49XPOQQmvnUgwcZ8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/wZVwAKCRBdQqD6ppg2
fltDAKCcJF/LelVCzNtCLJQDAL63eKcXMgCfbd1KiwAhv3LwPhlst5Ls359wMqI=
=T9J6
-----END PGP SIGNATURE-----

--Sig_/FoLqpkE49XPOQQmvnUgwcZ8--


--===============7501960092973797448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7501960092973797448==--
