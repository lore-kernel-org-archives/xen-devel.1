From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the xen-tip
 tree
Date: Mon, 30 Jul 2018 19:02:10 +1000
Message-ID: <20180730190210.48a75b72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RQ/f9UhlBN2KABzauLfOSxw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Hocko <mhocko@suse.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/RQ/f9UhlBN2KABzauLfOSxw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/xen/gntdev.c

between commit:

  1d3145675538 ("xen/gntdev: Make private routines/structures accessible")

from the xen-tip tree and commit:

  aaefcabe9c25 ("mm, oom: distinguish blockable mode for mmu notifiers")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/xen/gntdev.c
index c866a62f766d,55b4f0e3f4d6..000000000000
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@@ -479,7 -441,20 +479,20 @@@ static const struct vm_operations_struc
 =20
  /* ------------------------------------------------------------------ */
 =20
 -static bool in_range(struct grant_map *map,
++static bool in_range(struct gntdev_grant_map *map,
+ 			      unsigned long start, unsigned long end)
+ {
+ 	if (!map->vma)
+ 		return false;
+ 	if (map->vma->vm_start >=3D end)
+ 		return false;
+ 	if (map->vma->vm_end <=3D start)
+ 		return false;
+=20
+ 	return true;
+ }
+=20
 -static void unmap_if_in_range(struct grant_map *map,
 +static void unmap_if_in_range(struct gntdev_grant_map *map,
  			      unsigned long start, unsigned long end)
  {
  	unsigned long mstart, mend;
@@@ -503,15 -472,26 +510,26 @@@
  	WARN_ON(err);
  }
 =20
- static void mn_invl_range_start(struct mmu_notifier *mn,
+ static int mn_invl_range_start(struct mmu_notifier *mn,
  				struct mm_struct *mm,
- 				unsigned long start, unsigned long end)
+ 				unsigned long start, unsigned long end,
+ 				bool blockable)
  {
  	struct gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, mn);
 -	struct grant_map *map;
 +	struct gntdev_grant_map *map;
+ 	int ret =3D 0;
+=20
+ 	/* TODO do we really need a mutex here? */
+ 	if (blockable)
+ 		mutex_lock(&priv->lock);
+ 	else if (!mutex_trylock(&priv->lock))
+ 		return -EAGAIN;
 =20
- 	mutex_lock(&priv->lock);
  	list_for_each_entry(map, &priv->maps, next) {
+ 		if (in_range(map, start, end)) {
+ 			ret =3D -EAGAIN;
+ 			goto out_unlock;
+ 		}
  		unmap_if_in_range(map, start, end);
  	}
  	list_for_each_entry(map, &priv->freeable_maps, next) {

--Sig_/RQ/f9UhlBN2KABzauLfOSxw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlte1BIACgkQAVBC80lX
0GyG1wf+KGs6g2d6zFRQetpC8V37YhGvenZX4vHrVb7nXp9wmUVt3fRrOGvAJFGx
r9aZVBdZeBDIt1Hj5XClOm4xB3MkDUAzEAC0qp8zQxh+OopZwALw/rT+laHdTlLY
9UhtdxjieNyHVr56160LUtInU6dh13GS8nvowWMz0QRahdHnObEu/rffWgbOluKv
wPmS8tGiY/blbx5oNqMYZPUQ7I80iTrml7OrDLRQq9bWRlAaDWOe7fH6e6gbfuVF
DP89e2ojb8N9kl2UR77cJiy6XjzNvGqrbyOYiolmhqy4D2FZMiAoLSPBDwEC9OiQ
JFolvw3vycLsazHFkuuTJmlD2CdGug==
=BIWe
-----END PGP SIGNATURE-----

--Sig_/RQ/f9UhlBN2KABzauLfOSxw--
