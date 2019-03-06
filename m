From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: [GIT PULL] (xen) stable/for-jens-5.1 to your
 'for-5.1/block' branch.
Date: Tue, 5 Mar 2019 21:25:31 -0500
Message-ID: <20190306022530.GC25368__26236.8802724936$1551839205$gmane$org@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8500575288788288105=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KL1z=RJ=gmail.com=konrad.r.wilk@srs-us1.protection.inumbo.net>)
 id 1h1MFT-0008Sj-4G
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 02:25:35 +0000
Received: by mail-qt1-x842.google.com with SMTP id d18so11232169qtg.12
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2019 18:25:34 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============8500575288788288105==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

Apologies for doing it right at the merge window time. This patchset has been brewing
for quite a while.

git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-jens-5.1

This patchset makes the backend more robust by reading a negotiation
variable only once and not twice.

Thank you!

 drivers/block/xen-blkback/xenbus.c | 99 ++++++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 42 deletions(-)

Dongli Zhang (2):
      xen/blkback: add stack variable 'blkif' in connect_ring()
      xen/blkback: rework connect_ring() to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront


--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcfy+aAAoJEFKlDoTx2wm/L9EP/1hInhOLDpzp4j9svuArMEtf
2HbAezkSPcAXhhXr+yXCxrLYqZldxG00ohwQikogxugqDiPWGzR1NU+7FvmkUDg7
0EJAumsuTT/Ok7vNt0TlrNATKYvE2RQroOJ8KknNFA3vOXaN4WPaT/Qr0KIyJnli
10PgigQzvLvkbdXg91cZfVHLAcTVWp48FT0r2q/KFI1r0ehiOEzmdrB8bnZ9hxQ8
yvRFHBNEeHd2UGJpLZ2Cq6KwfDXae4GKW201n03QHN4obgI8tKjlZmDWZS52RK+Q
C+KaSlCVwISr4CMibWAsOJ3ChL/e/y7TB02MNDyF9EBS8przv3BjdLfPBEE4XUn1
EpAvNUGiV4TlCR0A4NEaJimcZD0pBBEFpyjX6ja2c1bEBu/iuCK8pgsg34NIze3k
XPcM/ovxesyOrBgCQ3E/QceiBHULYulTskv+vv67P6/DCie/Jcg2PD2YbxyKLq/M
DKk6VHJNRMl2CwiKx8EyIBD11vDd8WMWP86i/0GSqqh7ckV8C6MjgT8UtNgZDr21
wh+Efg3hgsC7d4XfbT9zu9uVMsMhSV+EzF1ajDXTBF1wsGmbwxkoMtqyejziitHZ
WntO/bAAfkbB3dXpUcS+XLhN4HIUXemfnZdDLCFxy9T2l7VMydswi7X5YlnyaxRt
ANzNPES7tCHFeNwGr8hW
=L583
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--


--===============8500575288788288105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8500575288788288105==--
