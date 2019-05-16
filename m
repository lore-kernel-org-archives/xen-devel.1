From: Olaf Hering <ohering@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 13:52:57 +0200
Message-ID: <20190516135257.3a328a77.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7680991932969532712=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hREwY-00050e-CN
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:53:02 +0000
In-Reply-To: <20190516133857.742e4f13.ohering@suse.com>
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

--===============7680991932969532712==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/SUF2mIFr9h7yqJMX/.lqFkA"; protocol="application/pgp-signature"

--Sig_/SUF2mIFr9h7yqJMX/.lqFkA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 13:38:57 +0200
schrieb Olaf Hering <ohering@suse.com>:

> To me it looks like something like libxl_domain_config_finish(libxl_domai=
n_config*)
> is missing now.

If we do not want to add a new API, a hack might be to use container_of()
and assume that the libxl_domain_build_info passed to libxl_domain_need_mem=
ory
is always part of a libxl_domain_config. This is, at this point, true
for at least libvirt and xl. But it is certainly fragile.

Olaf

--Sig_/SUF2mIFr9h7yqJMX/.lqFkA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1PGQAKCRBdQqD6ppg2
fopvAKCdt6LqatflQpzIY5GBX7BvIQepDQCfe9AK5XvpvYMurjN3RRAhrZ1/ve4=
=rx/f
-----END PGP SIGNATURE-----

--Sig_/SUF2mIFr9h7yqJMX/.lqFkA--


--===============7680991932969532712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7680991932969532712==--
