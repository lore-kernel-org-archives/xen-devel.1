From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Mon, 14 May 2018 16:15:22 +0200
Message-ID: <20180514161522.21a527f9.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180510104018.GA2057@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5031821011442786089=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180510104018.GA2057@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============5031821011442786089==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/.t.w/CNb5JwzHrafkGL0MM7"; protocol="application/pgp-signature"

--Sig_/.t.w/CNb5JwzHrafkGL0MM7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 10 May 2018 11:40:18 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> I'm not sure if that information is going to help, but that what I have
> for now about the lock of block images.

I think the issue is not with two dom0s locking the same file, but with one=
 qemu process trying to lock the same region within a file twice. That woul=
d not happen if an 'unplug' happens before the PV driver within qemu takes =
control. I'm sure migration with qcow2 will fail with a pvops domU if 512b1=
09ec962 gets reverted.

I will look into vmstate_xen_platform, as suggested by Stefano, to preserve=
 the unplug state during the lifetime of a domU. I think that is the correc=
t approach, and 512b109ec962 should have never ever go upstream.

Olaf

--Sig_/.t.w/CNb5JwzHrafkGL0MM7
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvmZ+gAKCRBdQqD6ppg2
frf4AKDHRd0rRwU3V9ZhDO706OTQhznGJQCcD0v2O6gRWDfvo6I4hyeAoyfsUnw=
=lXHc
-----END PGP SIGNATURE-----

--Sig_/.t.w/CNb5JwzHrafkGL0MM7--


--===============5031821011442786089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5031821011442786089==--
