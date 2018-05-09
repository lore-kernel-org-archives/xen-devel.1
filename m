From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Wed, 9 May 2018 14:23:16 +0200
Message-ID: <20180509142316.66171ffd.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180508184026.4f0af76a.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3298321326755944887=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180508184026.4f0af76a.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, Stefano Stabellini <stefano.stabellini@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3298321326755944887==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/6OWZcjhKP1Z7R3Fe5Gr7+4m"; protocol="application/pgp-signature"

--Sig_/6OWZcjhKP1Z7R3Fe5Gr7+4m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 8 May 2018 18:40:26 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> It looks like the IDE unplug is not permanent.

Stefano,

Jochen pointed me to commit 512b109ec962 ("xen: unplug the emulated devices=
 at resume time"), which I think is wrong. The kernel will most likely not =
be able to switch from a PV backed device to an emulated device. Not sure w=
hat issue could have been addressed by that commit. What should have been d=
one instead is to transfer the unplug state from one qemu to the other. Ple=
ase advice how to do that. Right now, with xen-4.10, all xenlinux based HVM=
 domUs can not be migrated anymore. With the upcoming xen-4.11 the migrated=
 domU will need to be killed.

Olaf

--Sig_/6OWZcjhKP1Z7R3Fe5Gr7+4m
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvLoNAAKCRBdQqD6ppg2
fhzGAJ9JvbqxxDi06Zj/GQ+lNH/Xhm7jhgCgk3OV1WaM7khHSGu1elMwuylgFaA=
=4Un0
-----END PGP SIGNATURE-----

--Sig_/6OWZcjhKP1Z7R3Fe5Gr7+4m--


--===============3298321326755944887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3298321326755944887==--
