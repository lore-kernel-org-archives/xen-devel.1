From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xen-tip tree
Date: Mon, 30 Jul 2018 15:12:13 +1000
Message-ID: <20180730151213.4b1e1af4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/73HHtKXX1qw=vgpi/4uaEGA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/73HHtKXX1qw=vgpi/4uaEGA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/xen/gntdev-dmabuf.c:360:12: error: initialization from incompatible=
 pointer type [-Werror=3Dincompatible-pointer-types]
  .attach =3D dmabuf_exp_ops_attach,
            ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  a240d6e42e28 ("xen/gntdev: Implement dma-buf export functionality")

interacting with commit

  a19741e5e5a9 ("dma_buf: remove device parameter from attach callback v2")

from the drm tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Jul 2018 15:08:21 +1000
Subject: [PATCH] xen/gntdev: fix up for attach callback API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/xen/gntdev-dmabuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index faaa4d3970ea..744cfe9b0311 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -217,7 +217,6 @@ dmabuf_pages_to_sgt(struct page **pages, unsigned int n=
r_pages)
 }
=20
 static int dmabuf_exp_ops_attach(struct dma_buf *dma_buf,
-				 struct device *target_dev,
 				 struct dma_buf_attachment *attach)
 {
 	struct gntdev_dmabuf_attachment *gntdev_dmabuf_attach;
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/73HHtKXX1qw=vgpi/4uaEGA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlteni0ACgkQAVBC80lX
0GwDxwgAk1uyJwmu37U9AWLxDpWymcewjFApvhkWp/9YTADWVlUtm/4WnXziEUYN
g5455MQIMNr9WGJSzWlONVZPvDHZq/xq04DSGzwNA+FwQo4r87oaW6agVlUQfVt6
oAWjU9OPkRViphl2BWVdRNZjEGf8OdShCUKXdm8A5YkxOg0FB7ibEWc+VKwJmy5j
CCEOyth8nd41mnTMEGJoVbcR86xg58Th3wEWaj2QBPsxhlG9LiheYvJhZd3BH5SL
XgiTBwl5p8iirAYF+yIY/SahQQcY/ptuF25VbL6sEfudIIKLG5yiP/jZ3lu5C8rR
4KKLGfFAvJzrYAMektpcS22I5qcsBw==
=HLLG
-----END PGP SIGNATURE-----

--Sig_/73HHtKXX1qw=vgpi/4uaEGA--
