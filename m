From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Wed, 9 May 2018 23:13:36 +0200
Message-ID: <20180509231336.7f962d11.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180508184026.4f0af76a.olaf@aepfle.de>
 <20180509142316.66171ffd.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091405040.9199@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1723103816125970142=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805091405040.9199@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: anthony.perard@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============1723103816125970142==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/t=diZ1tESVQA3UrI__eu30E"; protocol="application/pgp-signature"

--Sig_/t=diZ1tESVQA3UrI__eu30E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 May 2018 14:08:14 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> I cannot find 512b109ec962 or "xen: unplug the emulated devices at
> resume time" anywhere, neither in qemu.org/master nor in the qemu-xen
> trees. What am I missing?

It is a 7 years old kernel patch.

Olaf

--Sig_/t=diZ1tESVQA3UrI__eu30E
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvNkgAAKCRBdQqD6ppg2
frzYAJ9m2iPcHY3rWzLap+k9/om3OTFLFQCdHVbHWw+4B7Haqi6e4vx000s0VbM=
=NU+v
-----END PGP SIGNATURE-----

--Sig_/t=diZ1tESVQA3UrI__eu30E--


--===============1723103816125970142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1723103816125970142==--
