From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Fri, 14 Dec 2018 16:33:49 +0100
Message-ID: <20181214163349.6d32aeb3.olaf@aepfle.de>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
 <20181213091845.54212b83.olaf@aepfle.de>
 <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
 <20181213100442.3510b91b.olaf@aepfle.de>
 <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
 <20181213142559.78a19242.olaf@aepfle.de>
 <5C1270CC0200007800205E5A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7952806404785564385=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Axb2=OX=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gXpTU-00081W-93
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 15:34:01 +0000
In-Reply-To: <5C1270CC0200007800205E5A@prv1-mh.provo.novell.com>
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

--===============7952806404785564385==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/hYp+Yx7i4uDB4=z322fDeQb"; protocol="application/pgp-signature"

--Sig_/hYp+Yx7i4uDB4=z322fDeQb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Dec 2018 07:46:36 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 13.12.18 at 14:25, <olaf@aepfle.de> wrote: =20
> > The question is, how much drift can be tolerated even without my patch.=
 =20
> This depends on what a system is used for. A few seconds off may
> be fine for one purpose, but a significant problem for another.
> Similarly a sudden (however small) change to the TSC tick rate
> may be a problem for one purpose, but not for another.

Sure it depends on the usage. Should the default favor the "common" case
for domUs that are aware of a drift when using TSC and therefore use NTP,
or should the default favor the other case of domUs that, intentionally
or not, rely on emulation to reduce the expected drift?

And if this has to become a knob, then v10 might be the way to go.

Olaf

--Sig_/hYp+Yx7i4uDB4=z322fDeQb
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBPNXQAKCRBdQqD6ppg2
fncfAKDwsn3M2Ef1nqWrHqrV0L3eA4JSDwCgyvlIpXLll/kXdv9ke3RY7aOG898=
=NJYC
-----END PGP SIGNATURE-----

--Sig_/hYp+Yx7i4uDB4=z322fDeQb--


--===============7952806404785564385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7952806404785564385==--
