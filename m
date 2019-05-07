From: Konrad Rzeszutek Wilk <konrad@kernel.org>
Subject: [GIT PULL] (swiotlb) stable/for-linus-5.2
Date: Tue, 7 May 2019 12:24:47 -0400
Message-ID: <20190507162434.GA27798__45419.2525403172$1557246350$gmane$org@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2378694655181119826=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhYC=TH=gmail.com=ketuzsezr@srs-us1.protection.inumbo.net>)
 id 1hO2ti-0008F4-Un
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:24:55 +0000
Received: by mail-qk1-x731.google.com with SMTP id a132so10428923qkb.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2019 09:24:53 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org


--===============2378694655181119826==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please git pull the following branch:


git pull git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-5.2

which has cleanups in the swiotlb code and extra debugfs knobs to help with the field
diagnostics.

Thank you!

Christoph Hellwig (4):
      swiotlb-xen: make instances match their method names
      swiotlb-xen: use ->map_page to implement ->map_sg
      swiotlb-xen: simplify the DMA sync method implementations
      swiotlb-xen: ensure we have a single callsite for xen_dma_map_page

Dongli Zhang (2):
      swiotlb: dump used and total slots when swiotlb buffer is full
      swiotlb: save io_tlb_used to local variable before leaving critical section


 drivers/xen/swiotlb-xen.c | 196 ++++++++++++++--------------------------------
 kernel/dma/swiotlb.c      |   6 +-
 2 files changed, 64 insertions(+), 138 deletions(-)

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJc0bFJAAoJEFKlDoTx2wm/rjkQAIA42+eXI4nVD/i+qetJbNxF
XmUUNt+WjKuUTvlllQGfiqN5Za9+Qc5vQAPOxXsi6UYxsYkuJEiOMsOpGsMjF3rd
v7/i5SuDOdhLnVyoQZZOoIQ2sKmYmNXFVr0eT9Va/jVnphC+06EGdgQd+KTLYVTv
KZUpIvgXLo4zZGqTuYKtBE6CmT1DKfZlYd5wCz7Z410FLvbKItv/R5Jh00dzlEVy
YaukyLLJ9tKVqIvKDVbhj1l5rbh+BFuYTHriIl8/KVvPE6Z+Ku0Cz7chKAhB8RRS
BoQfRtqK02kEEryPK9yNAdpUhSWb6v6yw8kXdabs+Bz1OTE7XrmFdk0aVVcWmoPz
Dv4lHrO0Lp6OriOkJY2IlTGaiBGQo3Qq1/31gDkazMoBBBHcUidTOy8AO3tr3QuE
uljmtKCzDSd61rhUFKnGzkZNaQ2QnMUjUZylUFq6CbIwaoRagUPJBUpqeKz1emJy
SY+38LNdtaTwPc5FVirtoz0sa2eG56L+wX8XGR5ATvqIk+ACR3/VANMW6kLR2DG5
Lj3fiUzOl8X5fksC6SaAu3/NCWw/HsSzh1i7qVxiXKgZHHY+Z9NqAOWQAqFXx4ob
RxAUVe2jxnDzErRpO5+52a8B+px5b1ijInXBaK9uAH/s3RywU9xT/LK9lFvtxBl1
e7TDyyIMZyXvhmBhnv2O
=wKk8
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--


--===============2378694655181119826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2378694655181119826==--
