From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 15:33:22 +0100
Message-ID: <20190314153322.2fcf6808.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6910214040481493595=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6KDy=RR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4RQL-0004ec-1g
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:33:33 +0000
In-Reply-To: <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6910214040481493595==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/pwKZZ0NlKBUDKpe/soPr2WH"; protocol="application/pgp-signature"

--Sig_/pwKZZ0NlKBUDKpe/soPr2WH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 14 Mar 2019 15:24:59 +0100
schrieb Juergen Gross <jgross@suse.com>:

> I believe a per-domain controllable value is to be preferred. Different
> guests might have different jitter tolerance.

If others agree with that, I can resume v10 of this patch, which was sent e=
nd last year.

Olaf

--Sig_/pwKZZ0NlKBUDKpe/soPr2WH
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIpmMgAKCRBdQqD6ppg2
fpUWAJ963Llyrq9nuV6axq1dtHrT6mlhNACg13mgUU8JFeGcAkk2PoU6WLc0FRU=
=gRJD
-----END PGP SIGNATURE-----

--Sig_/pwKZZ0NlKBUDKpe/soPr2WH--


--===============6910214040481493595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6910214040481493595==--
