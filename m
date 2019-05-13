From: Olaf Hering <olaf@aepfle.de>
Subject: Re: Anyone using blktap2?
Date: Mon, 13 May 2019 18:14:03 +0200
Message-ID: <20190513181403.42161773.olaf@aepfle.de>
References: <20190513153414.GU2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8635347849577265449=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQDag-0005MY-Oh
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:14:15 +0000
In-Reply-To: <20190513153414.GU2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, Alistair Francis <alistair.francis@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============8635347849577265449==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/b3s.RUJIoyJHSust02V8FtJ"; protocol="application/pgp-signature"

--Sig_/b3s.RUJIoyJHSust02V8FtJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 16:34:14 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Seeing that you were the last people who changed blktap2 in a meaningful
> way: do you use it at all?

The default for --enable-blktap2 in tools/configure.ac is off, and nothing
seems to pass --enable-blktap2 to configure. So I'm ok to remove the code.

Olaf

--Sig_/b3s.RUJIoyJHSust02V8FtJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmXzAAKCRBdQqD6ppg2
ftxsAJ9VXVNnUkngnb+lhNGmpPi/TkaIvwCgsm1pCGUWLuPtQIFq3lUfeCYV9yc=
=gT2h
-----END PGP SIGNATURE-----

--Sig_/b3s.RUJIoyJHSust02V8FtJ--


--===============8635347849577265449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8635347849577265449==--
