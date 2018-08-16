From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 xen-tip tree
Date: Thu, 16 Aug 2018 10:05:11 +1000
Message-ID: <20180816100511.2377dda2@canb.auug.org.au>
References: <20180730190210.48a75b72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hgsa92rdqXObSy_yITGi8Ub"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730190210.48a75b72@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Hocko <mhocko@suse.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/Hgsa92rdqXObSy_yITGi8Ub
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Jul 2018 19:02:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   drivers/xen/gntdev.c
>=20
> between commit:
>=20
>   1d3145675538 ("xen/gntdev: Make private routines/structures accessible")
>=20
> from the xen-tip tree and commit:
>=20
>   aaefcabe9c25 ("mm, oom: distinguish blockable mode for mmu notifiers")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/xen/gntdev.c
> index c866a62f766d,55b4f0e3f4d6..000000000000
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@@ -479,7 -441,20 +479,20 @@@ static const struct vm_operations_struc
>  =20
>   /* ------------------------------------------------------------------ */
>  =20
>  -static bool in_range(struct grant_map *map,
> ++static bool in_range(struct gntdev_grant_map *map,
> + 			      unsigned long start, unsigned long end)
> + {
> + 	if (!map->vma)
> + 		return false;
> + 	if (map->vma->vm_start >=3D end)
> + 		return false;
> + 	if (map->vma->vm_end <=3D start)
> + 		return false;
> +=20
> + 	return true;
> + }
> +=20
>  -static void unmap_if_in_range(struct grant_map *map,
>  +static void unmap_if_in_range(struct gntdev_grant_map *map,
>   			      unsigned long start, unsigned long end)
>   {
>   	unsigned long mstart, mend;
> @@@ -503,15 -472,26 +510,26 @@@
>   	WARN_ON(err);
>   }
>  =20
> - static void mn_invl_range_start(struct mmu_notifier *mn,
> + static int mn_invl_range_start(struct mmu_notifier *mn,
>   				struct mm_struct *mm,
> - 				unsigned long start, unsigned long end)
> + 				unsigned long start, unsigned long end,
> + 				bool blockable)
>   {
>   	struct gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, mn);
>  -	struct grant_map *map;
>  +	struct gntdev_grant_map *map;
> + 	int ret =3D 0;
> +=20
> + 	/* TODO do we really need a mutex here? */
> + 	if (blockable)
> + 		mutex_lock(&priv->lock);
> + 	else if (!mutex_trylock(&priv->lock))
> + 		return -EAGAIN;
>  =20
> - 	mutex_lock(&priv->lock);
>   	list_for_each_entry(map, &priv->maps, next) {
> + 		if (in_range(map, start, end)) {
> + 			ret =3D -EAGAIN;
> + 			goto out_unlock;
> + 		}
>   		unmap_if_in_range(map, start, end);
>   	}
>   	list_for_each_entry(map, &priv->freeable_maps, next) {

This is now a conflict between Linus' tree and the akpm-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hgsa92rdqXObSy_yITGi8Ub
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0v7cACgkQAVBC80lX
0GyT9Af9FHUkWlJA+c6mKp7D4Zcr12z3D0N2E1osk+wFOvnqG5GLz98lOetUCMQc
ObTE3lkBmDYsDFscrrJCPNwin6bgddwsqoDCRTYzmEebk576k2LjFFMqXybWFoFe
He8Mj7LE26U6ydU99CHuvhUUn8UmlaFjc32sEhMp0IqTdSV0RE880NlXhc5raUNs
RuEEOK4S8IXSYr1aLAyTnUKT+aDsbZ0k949fAzQvOQR76jTu6+zjl02g9fWpnS/Y
3tAM8YW7DjFIj5mj5OOkuc2PfSIB+sriR/qANJ9yjT+8yoPI7u6FzORsDnNvAyjb
lZqStevQoY+M5qlDspeS6bfCfV5LDg==
=OJCs
-----END PGP SIGNATURE-----

--Sig_/Hgsa92rdqXObSy_yITGi8Ub--
