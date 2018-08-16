From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
Date: Thu, 16 Aug 2018 10:09:13 +1000
Message-ID: <20180816100913.0ffa0df5@canb.auug.org.au>
References: <20180730151213.4b1e1af4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aBMld8MOi9ZBxBxSih09DoJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730151213.4b1e1af4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/aBMld8MOi9ZBxBxSih09DoJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Jul 2018 15:12:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the xen-tip tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/xen/gntdev-dmabuf.c:360:12: error: initialization from incompatib=
le pointer type [-Werror=3Dincompatible-pointer-types]
>   .attach =3D dmabuf_exp_ops_attach,
>             ^~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   a240d6e42e28 ("xen/gntdev: Implement dma-buf export functionality")
>=20
> interacting with commit
>=20
>   a19741e5e5a9 ("dma_buf: remove device parameter from attach callback v2=
")
>=20
> from the drm tree.
>=20
> I have added the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 30 Jul 2018 15:08:21 +1000
> Subject: [PATCH] xen/gntdev: fix up for attach callback API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/xen/gntdev-dmabuf.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index faaa4d3970ea..744cfe9b0311 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -217,7 +217,6 @@ dmabuf_pages_to_sgt(struct page **pages, unsigned int=
 nr_pages)
>  }
> =20
>  static int dmabuf_exp_ops_attach(struct dma_buf *dma_buf,
> -				 struct device *target_dev,
>  				 struct dma_buf_attachment *attach)
>  {
>  	struct gntdev_dmabuf_attachment *gntdev_dmabuf_attach;

This is now a conflict between Linus' tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aBMld8MOi9ZBxBxSih09DoJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0wKkACgkQAVBC80lX
0GwHrgf+O6FFsaNS9Ns/qqJwGQglbwJYGtok6HZHX+YpwBufT7zw0Kz566uGeYo2
ye73+FV1lIhF2iKb4R0Cq9MZuUkn9CiezYeQcnqjyjdVIJigYqb/9nBxnDMEPBlC
/4Np6/b6Dutrf5Lw8sW8R1+xakOw5xtdLHMwJM+gDoUEAhueAXlz24kRfpmk4XNw
dvWHQfkFHM0CyzVYO6WKJ/dko3uW31VwVQAqIcmbD+O27f4UsIaEs8oAtupuMB6o
AZD/tgsy26nzEuQnesQZ7tbNqx2B8Ziu8asekMQI9czIb4Ag0ZQKHPkDEhFS4xMY
JZETbXOfxG4qLvK4ZrZLpLRFAeIArg==
=jUg3
-----END PGP SIGNATURE-----

--Sig_/aBMld8MOi9ZBxBxSih09DoJ--
