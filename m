From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 3/5] drivers/video: Drop framebuffer size
 constraints
Date: Mon, 6 May 2019 17:09:19 +0200
Message-ID: <20190506170919.6035d4d9.olaf@aepfle.de>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2989303213712202922=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt3T=TG=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hNfFX-0005Aw-Qc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:09:52 +0000
In-Reply-To: <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2989303213712202922==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/EPC7HSK/YS7rienJN6rsw9+"; protocol="application/pgp-signature"

--Sig_/EPC7HSK/YS7rienJN6rsw9+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon,  6 May 2019 16:50:19 +0200
schrieb Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>:

> The limit 1900x1200 do not match real world devices (1900 looks like a
> typo, should be 1920). But in practice the limits are arbitrary and do
> not serve any real purpose. As discussed in "Increase framebuffer size
> to todays standards" thread, drop them completely.

ACK for the idea.

Olaf

--Sig_/EPC7HSK/YS7rienJN6rsw9+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNBOHwAKCRBdQqD6ppg2
fqxSAKDVkuA80W3PBX+Gyiezp627IZcpYACdFia4Uau1ggjdqBedMW8tERGtsqU=
=WOkV
-----END PGP SIGNATURE-----

--Sig_/EPC7HSK/YS7rienJN6rsw9+--


--===============2989303213712202922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2989303213712202922==--
