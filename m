From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Thu, 10 May 2018 08:04:11 +0200
Message-ID: <20180510080411.1c7845b5.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180508184026.4f0af76a.olaf@aepfle.de>
 <20180509142316.66171ffd.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091405040.9199@sstabellini-ThinkPad-X260>
 <20180509231336.7f962d11.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091416310.9199@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5968729381432454016=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805091416310.9199@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: anthony.perard@citrix.com, jgross@suse.com, boris.ostrovsky@oracle.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============5968729381432454016==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/akbVIaaTohVPkPmETGiutjB"; protocol="application/pgp-signature"

--Sig_/akbVIaaTohVPkPmETGiutjB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 May 2018 14:43:17 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> 512b109ec962 is a very old commit: why is it causing problems to Xen
> 4.10 and Xen 4.11 HVM migration? What is the error exactly? Sorry, I
> might be missing some context.

It is papering over the real issue, thats why one can still migrate a
pvops HVM domU with current toolstack. Upstream kernel simply does the
work that is supposed to be done by qemu itself. Since the xenlinux based
kernel does not do that work (it never had a need to do the unplug twice),
migration fails.

qemu has to carry the unplug state from one dom0 to another dom0 during
migration, simply because unplug is a one-time operation that can not=20
be undone. I wonder how to do that, if qemu already has code to carry its
state.

Olaf

--Sig_/akbVIaaTohVPkPmETGiutjB
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvPg2wAKCRBdQqD6ppg2
fgqiAJoCO/885E0UVsHVrDoP8yj3zFnt/QCdGEHgUxPtSFxJ+cy4xqeCxaWZ9RI=
=/69J
-----END PGP SIGNATURE-----

--Sig_/akbVIaaTohVPkPmETGiutjB--


--===============5968729381432454016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5968729381432454016==--
