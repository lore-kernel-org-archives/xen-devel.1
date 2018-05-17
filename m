From: Olaf Hering <olaf@aepfle.de>
Subject: Re: how to recognize in libxl that a domU has qemu-xen
 attached?
Date: Thu, 17 May 2018 17:09:33 +0200
Message-ID: <20180517170933.17ef54dc.olaf@aepfle.de>
References: <20180517143352.1227b39e.olaf@aepfle.de>
 <f4845c2b-d967-7b3b-b567-d83e18fb6f66@suse.com>
 <20180517165400.6b9b9825.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6707654393760656354=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180517165400.6b9b9825.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6707654393760656354==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_//bmZQJ8Evd4UzIBk894iZ5L"; protocol="application/pgp-signature"

--Sig_//bmZQJ8Evd4UzIBk894iZ5L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 May 2018 16:54:00 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Thanks. Too bad, d_config is not available in that context. It is probabl=
y known somewhere by the callers. I guess such caller needs to pass a bool =
down to suspend/resume.

It seems nothing inside libxl knows about libxl_domain_config, only callers=
 of the public libxl_domain_suspend API do actually create it once. AFAICS =
only the LIBXL_SUSPEND_* 'flags' would allow to pass something down to the =
relevant code. But the resumer may not know about them...

Olaf

--Sig_//bmZQJ8Evd4UzIBk894iZ5L
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv2bLQAKCRBdQqD6ppg2
fhu+AKCalqMnhl5/JVLuwjMkuvAysEuMqQCfV3RUhs7K1vg/o7YNDjiLhhIZcHs=
=f0/v
-----END PGP SIGNATURE-----

--Sig_//bmZQJ8Evd4UzIBk894iZ5L--


--===============6707654393760656354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6707654393760656354==--
