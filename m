From: Olaf Hering <olaf@aepfle.de>
Subject: Re: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 12:35:11 +0200
Message-ID: <20180425123511.0f66639d.olaf@aepfle.de>
References: <20180425091956.7e4c98bc.olaf@aepfle.de>
 <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
 <20180425093924.13c56296.olaf@aepfle.de>
 <20180425085923.k6bxc5j4nhoadhzl@citrix.com>
 <20180425110426.1427b6ab.olaf@aepfle.de>
 <20180425100653.64qclgt6i6cgculn@citrix.com>
 <5AE057BE02000078001BE50B@prv1-mh.provo.novell.com>
 <20180425103125.kllxadyujbqbiamq@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8585894316475603170=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vzh0=ho=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fBHll-0007js-UP
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 10:35:26 +0000
In-Reply-To: <20180425103125.kllxadyujbqbiamq@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============8585894316475603170==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/p6r2=FU9RbhFxP219avTZeq"; protocol="application/pgp-signature"

--Sig_/p6r2=FU9RbhFxP219avTZeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 25 Apr 2018 11:31:25 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> My bad. Yes, they are converted to int, not unsigned int.

Hopefully that happens only if the target is int, not if all involved varia=
bles are short.

Unless there are objections I will prepare a patch to deal with RING_IDX be=
ing u16.

Olaf

--Sig_/p6r2=FU9RbhFxP219avTZeq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuBZ3wAKCRBdQqD6ppg2
frMVAJ4/BM8cjX1hZdic4Ck3zVAW7aFlYwCgqgiA2n1op2gfuTYc8Z4Q6JxAof0=
=SXCe
-----END PGP SIGNATURE-----

--Sig_/p6r2=FU9RbhFxP219avTZeq--


--===============8585894316475603170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8585894316475603170==--
