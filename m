From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 14:35:41 +0100
Message-ID: <20190313143541.6a008762.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190313112339.73774003.olaf@aepfle.de>
 <5C88DD8E020000780021E0A6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2432228725378957473=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3/bD=RQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h442x-0002mX-Hi
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 13:35:52 +0000
In-Reply-To: <5C88DD8E020000780021E0A6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2432228725378957473==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/OY9zzxRutJj.v/GoNi08ND2"; protocol="application/pgp-signature"

--Sig_/OY9zzxRutJj.v/GoNi08ND2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 04:38:06 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> But this affects a guest even ahead of migration. What if one
> uses migration really just for emergencies? Why would they
> run their guests in always-emulate mode?

Because this is what they will end up for the lifetime of the domU after mi=
gration?
The domU can not be just migrated back in the hope the originating
host has the expected cpu_khz value.

Olaf


--Sig_/OY9zzxRutJj.v/GoNi08ND2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIkHLQAKCRBdQqD6ppg2
fkB2AJ9W1k3PMCJZ65MS3HO+GWGnDaxLAACeKV1mYVdEh63uR8vtmkvs41pCDhM=
=wtK1
-----END PGP SIGNATURE-----

--Sig_/OY9zzxRutJj.v/GoNi08ND2--


--===============2432228725378957473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2432228725378957473==--
