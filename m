From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 13 Dec 2018 11:47:40 +0100
Message-ID: <20181213114740.183827d7.olaf@aepfle.de>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
 <20181213091845.54212b83.olaf@aepfle.de>
 <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
 <20181213100442.3510b91b.olaf@aepfle.de>
 <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8848236106315002825=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwXq=OW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gXOX3-0003JB-7D
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 10:47:53 +0000
In-Reply-To: <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8848236106315002825==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/R0IiP1qfZk3oz+x+y3t4cLR"; protocol="application/pgp-signature"

--Sig_/R0IiP1qfZk3oz+x+y3t4cLR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Dec 2018 03:41:44 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> In a second step, let's consider what impact errors in calibration have.
> Between two systems with exactly the same hardware crystal
> frequency there of course is going to be some drift. The problem
> though is - between the two calibrated clock values from two systems
> you can't easily tell what part of the difference is a result of the
> calibration being imprecise, and what part of it is because of the
> crystals not providing the exact same frequency. Without knowing
> the possible range of both errors, the argumentation of _one of
> them_ being tolerable within a certain range to consider _both_
> systems sufficiently equal is at least questionable.

We already have a knob for that, if a reference clock can not be provided:
 tsc_mode=3Dalways_emulate
This would exactly cover the case there the assumed frequency that is
available during the start of domU will be used after migration.

Olaf

--Sig_/R0IiP1qfZk3oz+x+y3t4cLR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBI4zAAKCRBdQqD6ppg2
frsvAKDPJIOa1Rofgsye7aGGUCZzNt9zvwCg6wexlagVZ8IoyLKTj4ZBAY7UU/I=
=eF2k
-----END PGP SIGNATURE-----

--Sig_/R0IiP1qfZk3oz+x+y3t4cLR--


--===============8848236106315002825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8848236106315002825==--
