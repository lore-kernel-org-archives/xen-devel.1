From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [Xen-devel] linux-next: manual merge of the akpm-current tree
 with the xen-tip tree
Date: Fri, 17 Aug 2018 18:15:46 -0400
Message-ID: <60058ac8-9d9a-f1f5-c6ad-948fbec5583c@oracle.com>
References: <20180730190210.48a75b72@canb.auug.org.au>
 <20180816100511.2377dda2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KWTIYsfcAe45JiJ1gi4zCuPTshKzgiV1S"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816100511.2377dda2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KWTIYsfcAe45JiJ1gi4zCuPTshKzgiV1S
Content-Type: multipart/mixed; boundary="MeJvDGScHKLqEaur4uZlFUPb7yxmMpEcQ";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Hocko <mhocko@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Xen Devel <Xen-devel@lists.xensource.com>
Message-ID: <60058ac8-9d9a-f1f5-c6ad-948fbec5583c@oracle.com>
Subject: Re: [Xen-devel] linux-next: manual merge of the akpm-current tree
 with the xen-tip tree
References: <20180730190210.48a75b72@canb.auug.org.au>
 <20180816100511.2377dda2@canb.auug.org.au>
In-Reply-To: <20180816100511.2377dda2@canb.auug.org.au>

--MeJvDGScHKLqEaur4uZlFUPb7yxmMpEcQ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 08/15/2018 08:05 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 30 Jul 2018 19:02:10 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>   drivers/xen/gntdev.c
>>
>> between commit:
>>
>>   1d3145675538 ("xen/gntdev: Make private routines/structures accessib=
le")
>>
>> from the xen-tip tree and commit:
>>
>>   aaefcabe9c25 ("mm, oom: distinguish blockable mode for mmu notifiers=
")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tr=
ee
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particular=
ly
>> complex conflicts.
>>
>> --=20
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/xen/gntdev.c
>> index c866a62f766d,55b4f0e3f4d6..000000000000
>> --- a/drivers/xen/gntdev.c
>> +++ b/drivers/xen/gntdev.c
>> @@@ -479,7 -441,20 +479,20 @@@ static const struct vm_operations_struc=

>>  =20
>>   /* -----------------------------------------------------------------=
- */
>>  =20
>>  -static bool in_range(struct grant_map *map,
>> ++static bool in_range(struct gntdev_grant_map *map,
>> + 			      unsigned long start, unsigned long end)
>> + {
>> + 	if (!map->vma)
>> + 		return false;
>> + 	if (map->vma->vm_start >=3D end)
>> + 		return false;
>> + 	if (map->vma->vm_end <=3D start)
>> + 		return false;
>> +=20
>> + 	return true;
>> + }
>> +=20
>>  -static void unmap_if_in_range(struct grant_map *map,
>>  +static void unmap_if_in_range(struct gntdev_grant_map *map,
>>   			      unsigned long start, unsigned long end)
>>   {
>>   	unsigned long mstart, mend;
>> @@@ -503,15 -472,26 +510,26 @@@
>>   	WARN_ON(err);
>>   }
>>  =20
>> - static void mn_invl_range_start(struct mmu_notifier *mn,
>> + static int mn_invl_range_start(struct mmu_notifier *mn,
>>   				struct mm_struct *mm,
>> - 				unsigned long start, unsigned long end)
>> + 				unsigned long start, unsigned long end,
>> + 				bool blockable)
>>   {
>>   	struct gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, m=
n);
>>  -	struct grant_map *map;
>>  +	struct gntdev_grant_map *map;
>> + 	int ret =3D 0;
>> +=20
>> + 	/* TODO do we really need a mutex here? */
>> + 	if (blockable)
>> + 		mutex_lock(&priv->lock);
>> + 	else if (!mutex_trylock(&priv->lock))
>> + 		return -EAGAIN;
>>  =20
>> - 	mutex_lock(&priv->lock);
>>   	list_for_each_entry(map, &priv->maps, next) {
>> + 		if (in_range(map, start, end)) {
>> + 			ret =3D -EAGAIN;
>> + 			goto out_unlock;
>> + 		}
>>   		unmap_if_in_range(map, start, end);


I think I mentioned this earlier --- this doesn't look right. Not the
conflict resolution but the original patch.

Should I send a patch against -next? Or -mm?


-boris




--MeJvDGScHKLqEaur4uZlFUPb7yxmMpEcQ--

--KWTIYsfcAe45JiJ1gi4zCuPTshKzgiV1S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAlt3SRIACgkQit52kIbK
wbILOw//YDazJTGDrB5WB/WhYAGdv5YsU2hZegwBCY4dHkqyUqpJs1fK5IQIjNJd
Per5xwVOhqweSS9Glr+tpJnUOVunxFtMw0IwEgtOT8NPuWZEqgb+ePe16wi4+RDe
pMHAag7fTwGjfljxC1RFueFowQ5QhuDzBzUff212of8EIMibOJlVd/EQ3Tcv8LyB
aBWb9IxtNEAwH68Quo0YdJ2nJmNOGMFD6q89nYJY1OGEOOzYV9HnthpnyqXxjUB8
OkWThkBKzfiUmbMwXoi8xeR2lrNifU52titWocGQ1ZpfB5OCgeJ2MAX5VnUyfzJ3
5o13qyzhaCGSCWfvp4urVDS7YecqXkC00JiIhGbbGNuIESxV28d9IseUJC/n7I/3
2xT/lTNGiCr4pBBL3C7/jZe3TbEC+3IF+X3n5LS3wI8gi2OOrRWQuRFW85Hfag0x
i3+Unoc5JzmaKT0gxRS2a4Emg31BtrbpjNYtJH5y+nxTWrMgStmH3V0AJdOoeoaN
NQXD4fx2ghc+LomRoVizjXv5EtTrikeo+4J2pxNywVk45TZFDcEpRBbui6iIyeHc
DBNPKZ1M8Z+yJjRAGvWjC46+KTEu5gcYmhwZj5S+kx651ZBuT1TtBlgDK0ldShjB
UoPdy1PftbHwe7lVylZ9ilsnwkNRhPh7zkTse362pKOIoM8a7Rs=
=o+v2
-----END PGP SIGNATURE-----

--KWTIYsfcAe45JiJ1gi4zCuPTshKzgiV1S--
