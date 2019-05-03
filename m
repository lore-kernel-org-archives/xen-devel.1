From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Fri, 3 May 2019 16:11:32 +0200
Message-ID: <20190503161132.06f85271.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8120724134591746262=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1b8=TD=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hMYuj-0004rl-K9
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 14:11:50 +0000
In-Reply-To: <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8120724134591746262==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Y/9umE.ddGPOtXYour46sqS"; protocol="application/pgp-signature"

--Sig_/Y/9umE.ddGPOtXYour46sqS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 May 2019 13:04:11 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Wouldn't it be easier to leave libxl__need_xenpv_qemu alone and just
> use the contents of the migration stream to decide whether to launch a
> QEMU for the PV backends or not? ie: just parsing the domain config on
> the migration stream should be enough for the destination side to
> decide whether a QEMU is needed in order to handle the PV backends?

I think that is done anyway. How would the receiving side know what to do?

I will see how to handle the stubdom case.

Olaf

--Sig_/Y/9umE.ddGPOtXYour46sqS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXMxMFAAKCRBdQqD6ppg2
fk7zAJ9jXOql2fHQfxYrl/os1CQo0A8XqwCgnDxvvtxUl6y95d43tm8UPjIdLDo=
=IVEl
-----END PGP SIGNATURE-----

--Sig_/Y/9umE.ddGPOtXYour46sqS--


--===============8120724134591746262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8120724134591746262==--
