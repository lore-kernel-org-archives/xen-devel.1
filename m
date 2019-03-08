From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Fri, 8 Mar 2019 20:29:07 +0100
Message-ID: <20190308202907.56f7609a.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8917197907345791135=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKkW=RL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h2LBH-0008At-BJ
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 19:29:19 +0000
In-Reply-To: <20190308192059.24610-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8917197907345791135==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/C_EgcOe5OEDWTQO58vZv.Bu"; protocol="application/pgp-signature"

--Sig_/C_EgcOe5OEDWTQO58vZv.Bu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri,  8 Mar 2019 20:20:59 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> To reiterate the second paragraph: if a domU uses TSC as primary clock
> source, it is expected that it runs NTP to cover for the resulting
> drift. Therefore this change does no need a knob to turn it on or off.

One interesting aspect is: the xenlinux based kernels report clocksource=3D=
tsc,
but I think there was no explicit requirement to run NTP in domU.
There was even that 'independent_wallclock' knob. Why is that?

Olaf

--Sig_/C_EgcOe5OEDWTQO58vZv.Bu
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXILCgwAKCRBdQqD6ppg2
foRNAKDMCS7YMdNmJ9rk54gPrwkqRarCbwCgh31Y2Y91St/C0GKB029DDGjPX88=
=iyfz
-----END PGP SIGNATURE-----

--Sig_/C_EgcOe5OEDWTQO58vZv.Bu--


--===============8917197907345791135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8917197907345791135==--
