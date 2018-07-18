From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] tools/firmware: reproducible seabios
 build
Date: Wed, 18 Jul 2018 11:58:21 +0200
Message-ID: <20180718115821.53fc47bf.olaf@aepfle.de>
References: <20180713110442.13265-1-olaf@aepfle.de>
 <20180718093931.gjtzvcd7lrh7k67o@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3293589381011052232=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mcpn=kc=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ffjE9-0006Bn-8h
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:58:33 +0000
In-Reply-To: <20180718093931.gjtzvcd7lrh7k67o@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3293589381011052232==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/6khEq40r715a2R.KUfZdFig"; protocol="application/pgp-signature"

--Sig_/6khEq40r715a2R.KUfZdFig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Jul 2018 10:39:31 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> > +	rm -f seabios-dir/.version =20
> There is no need to rm -f here because the following > will clear its
> content anyway.


The content of seabios-dir is coming from upstream, ".version" might be a s=
ymlink. Thats why I added this rm command.

Olaf

--Sig_/6khEq40r715a2R.KUfZdFig
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW08PPQAKCRBdQqD6ppg2
fnEfAKDyDyHEPgrpVmMNmD/RICM9QtdX7QCfYVzUNamZIARHXNbUoVVvEjnn/Ks=
=OQ58
-----END PGP SIGNATURE-----

--Sig_/6khEq40r715a2R.KUfZdFig--


--===============3293589381011052232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3293589381011052232==--
