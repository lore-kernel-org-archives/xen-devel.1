From: Olaf Hering <ohering@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 13:38:57 +0200
Message-ID: <20190516133857.742e4f13.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4344895836808377484=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hREj5-0002o4-6U
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:39:07 +0000
In-Reply-To: <20190516112450.GW2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4344895836808377484==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/rCcMbuleSmr=hZMmtAYln1Z"; protocol="application/pgp-signature"

--Sig_/rCcMbuleSmr=hZMmtAYln1Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 12:24:50 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> The problem with this approach is that it doesn't help existing libxl
> users. They will need to be fixed by calling this new API.

If the API needs to be changed, a LIBXL_HAVE_ came with the change.

I'm not sure how to fix this without changing some API.
libxl__domain_build_info_setdefault would need a d_config to make a
usable decision. The callers do not have a d_config. And what their
calles have is an incomplete d_config because libxl lacks a public API
to properly populate missing defaults in d_config.

To me it looks like something like libxl_domain_config_finish(libxl_domain_=
config*)
is missing now.

Maybe I am just misunderstanding what you trying to say, but to me it
looks like freemem() would need to call an updated libxl public API
anyway. Surely not freemem itself, but xl:create_domain as a whole.

Olaf

--Sig_/rCcMbuleSmr=hZMmtAYln1Z
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1L0QAKCRBdQqD6ppg2
fk1QAJ9sVUkYV/bAQeMpVGi76Ssg/MAjuACg8CVs0nmd5+fWfSvF+EsofXELfqY=
=q0Yv
-----END PGP SIGNATURE-----

--Sig_/rCcMbuleSmr=hZMmtAYln1Z--


--===============4344895836808377484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4344895836808377484==--
