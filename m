From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 13:09:31 +0100
Message-ID: <20190311130931.737ee8c6.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
 <20190311114947.1d47e04e.olaf@aepfle.de>
 <5C864446020000780021D29A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0817609312146688035=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y/+I=RO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h3JkR-0008Iu-TP
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 12:09:40 +0000
In-Reply-To: <5C864446020000780021D29A@prv1-mh.provo.novell.com>
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

--===============0817609312146688035==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/FwlF6JuVDYblBWl2qRtvPhd"; protocol="application/pgp-signature"

--Sig_/FwlF6JuVDYblBWl2qRtvPhd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Mar 2019 05:19:34 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> But of course the seemingly
> random 200 will itself need a much better reasoning, or at least a
> clear indication of the data base (number of different systems) that
> it was derived from. "Large number of hosts", after all, may mean 12
> to you and tens of thousands to me.

How many hosts would be relevant?
My own test hosts calibrate itself in a range of maybe 30 khz.
I gave up to track the exact numbers after every reboot.

If it helps, I can gather 'cpu_khz' once again.


Olaf

--Sig_/FwlF6JuVDYblBWl2qRtvPhd
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIZP+wAKCRBdQqD6ppg2
fp3cAJ0drHtwY+YmeJm0d65T2FGQJZNyJgCgs9G9xI481AK9rXwYdvHENa+LOiE=
=Px1G
-----END PGP SIGNATURE-----

--Sig_/FwlF6JuVDYblBWl2qRtvPhd--


--===============0817609312146688035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0817609312146688035==--
