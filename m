From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] domctl: revert double increment of domctl
	version
Date: Wed, 21 Feb 2018 19:14:50 +0100
Message-ID: <20180221191450.5a693de1.olaf@aepfle.de>
References: <20180221173422.10550-1-olaf@aepfle.de>
 <20180221173802.4asubsivkejs2ihy@citrix.com>
 <af2837e6-93dc-4552-ca3c-5e1e50c05cc0@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7574976692906893081=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <af2837e6-93dc-4552-ca3c-5e1e50c05cc0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============7574976692906893081==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/7kSo28F_=cG=X=JmXyZ=Irp"; protocol="application/pgp-signature"

--Sig_/7kSo28F_=cG=X=JmXyZ=Irp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 21 Feb 2018 17:53:54 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> I continue to think that this is a mistake (which is backed up by
> everyone else being confused about what is going on), and demonstrates
> the ineffectiveness of the *_INTERFACE_VERSIONS in general.

Well, my change was cosmetic anyway.
I'm updating valgrind and noticed this small inconsistency in staging.

Olaf

--Sig_/7kSo28F_=cG=X=JmXyZ=Irp
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWo23GgAKCRBdQqD6ppg2
fgNWAKDEi48dP1sSVTmWrMKagWS1yEir9wCfV/b0BWozc3noTP6+BuiwmApFSXM=
=6+Bc
-----END PGP SIGNATURE-----

--Sig_/7kSo28F_=cG=X=JmXyZ=Irp--


--===============7574976692906893081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7574976692906893081==--
