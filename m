From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Tue, 19 Mar 2019 15:20:43 +0100
Message-ID: <20190319152043.71df47c5.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
 <20190314153322.2fcf6808.olaf@aepfle.de>
 <5C8A66E0020000780021EBD3@prv1-mh.provo.novell.com>
 <20190314154155.6cfc6690.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8244036242237399483=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aT/6=RW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h6Fbt-0007Pk-3N
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 14:20:57 +0000
In-Reply-To: <20190314154155.6cfc6690.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei
 Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============8244036242237399483==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/YpAaJalOJ7WfW+uY9RstGw0"; protocol="application/pgp-signature"

--Sig_/YpAaJalOJ7WfW+uY9RstGw0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 14 Mar 2019 15:41:55 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> So before I spam you guys with any more variants, I better ask if any fur=
ther attempt would fly anyway.

So, should I spend any more time to fix this bug?

Olaf

--Sig_/YpAaJalOJ7WfW+uY9RstGw0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXJD6uwAKCRBdQqD6ppg2
fnWeAJ0UnF2CGytI3QRg6jvr6Uy+uLyUsACg3R+vEjYB3gSO73tJMURdMdmsKxU=
=4lJ2
-----END PGP SIGNATURE-----

--Sig_/YpAaJalOJ7WfW+uY9RstGw0--


--===============8244036242237399483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8244036242237399483==--
