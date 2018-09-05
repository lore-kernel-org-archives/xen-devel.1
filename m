From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2 2/2] x86/HVM: split page straddling
 emulated accesses in more cases
Date: Wed, 5 Sep 2018 09:22:00 +0200
Message-ID: <20180905092200.6d09007c.olaf@aepfle.de>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B8D561F02000078001E4BED@prv1-mh.provo.novell.com>
 <5B8D56E602000078001E4C0B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5906455107663142490=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=domh=lt=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fxS8j-0006n1-50
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 07:22:13 +0000
In-Reply-To: <5B8D56E602000078001E4C0B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5906455107663142490==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/znHm21lOSOaY+B/6qtalLwG"; protocol="application/pgp-signature"

--Sig_/znHm21lOSOaY+B/6qtalLwG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 03 Sep 2018 09:44:38 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Assuming consecutive linear addresses map to all RAM or all MMIO is not
> correct. Nor is assuming that a page straddling MMIO access will access
> the same emulating component for both parts of the access. If a guest
> RAM read fails with HVMTRANS_bad_gfn_to_mfn and if the access straddles
> a page boundary, issue accesses separately for both parts.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tested-by: Olaf Hering <olaf@aepfle.de>

Olaf

--Sig_/znHm21lOSOaY+B/6qtalLwG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4+EGAAKCRBdQqD6ppg2
fh7PAKDH0IeKCsv+/Qey1IQs71rAxJzG+QCcCI/aEoVOSAxZwf5kdSIkVkfZ5lE=
=IwwR
-----END PGP SIGNATURE-----

--Sig_/znHm21lOSOaY+B/6qtalLwG--


--===============5906455107663142490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5906455107663142490==--
