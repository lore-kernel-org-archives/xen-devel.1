From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 xen-tip tree
Date: Mon, 30 Jul 2018 13:02:45 -0400
Message-ID: <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>
References: <20180730190210.48a75b72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wMuxWcyZQF33UfI3MCNgXDjXbmejdZI10"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730190210.48a75b72@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Hocko <mhocko@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wMuxWcyZQF33UfI3MCNgXDjXbmejdZI10
Content-Type: multipart/mixed; boundary="t1s42VOlINq6E8TMwtHOkTxQcGDMxjjlC";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Hocko <mhocko@suse.com>
Message-ID: <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 xen-tip tree
References: <20180730190210.48a75b72@canb.auug.org.au>
In-Reply-To: <20180730190210.48a75b72@canb.auug.org.au>

--t1s42VOlINq6E8TMwtHOkTxQcGDMxjjlC
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 07/30/2018 05:02 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   drivers/xen/gntdev.c
>
> between commit:
>
>   1d3145675538 ("xen/gntdev: Make private routines/structures accessibl=
e")
>
> from the xen-tip tree and commit:
>
>   aaefcabe9c25 ("mm, oom: distinguish blockable mode for mmu notifiers"=
)
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tre=
e
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularl=
y
> complex conflicts.
>
> -- Cheers, Stephen Rothwell diff --cc drivers/xen/gntdev.c index
> c866a62f766d,55b4f0e3f4d6..000000000000 --- a/drivers/xen/gntdev.c +++
> b/drivers/xen/gntdev.c @@@ -479,7 -441,20 +479,20 @@@ static const
> struct vm_operations_struc /*
> ------------------------------------------------------------------ */
> -static bool in_range(struct grant_map *map, ++static bool
> in_range(struct gntdev_grant_map *map, + unsigned long start, unsigned
> long end) + { + if (!map->vma) + return false; + if
> (map->vma->vm_start >=3D end) + return false; + if (map->vma->vm_end <=3D=

> start) + return false; + + return true; + } + -static void
> unmap_if_in_range(struct grant_map *map, +static void
> unmap_if_in_range(struct gntdev_grant_map *map, unsigned long start,
> unsigned long end) { unsigned long mstart, mend; @@@ -503,15 -472,26
> +510,26 @@@ WARN_ON(err); } - static void mn_invl_range_start(struct
> mmu_notifier *mn, + static int mn_invl_range_start(struct mmu_notifier
> *mn, struct mm_struct *mm, - unsigned long start, unsigned long end) +
> unsigned long start, unsigned long end, + bool blockable) { struct
> gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, mn); - struc=
t
> grant_map *map; + struct gntdev_grant_map *map; + int ret =3D 0; + + /*=

> TODO do we really need a mutex here? */ + if (blockable) +
> mutex_lock(&priv->lock); + else if (!mutex_trylock(&priv->lock)) +
> return -EAGAIN; - mutex_lock(&priv->lock); list_for_each_entry(map,
> &priv->maps, next) { + if (in_range(map, start, end)) { + ret =3D
> -EAGAIN; + goto out_unlock; + } unmap_if_in_range(map, start, end); }
> list_for_each_entry(map, &priv->freeable_maps, next) {


I clearly missed this (aaefcabe9c25) patch but now that I am looking at
it I don't think I understand the logic for changes in
list_for_each_entry() loops.

Aren't we ending up never unmapping grant pages? Michal, can you explain
what you are trying to do here?


-boris




--t1s42VOlINq6E8TMwtHOkTxQcGDMxjjlC--

--wMuxWcyZQF33UfI3MCNgXDjXbmejdZI10
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAltfRLUACgkQit52kIbK
wbIeVg/8CLPEQPoU6oMttBxgdLPR4zD6rNjSevB81pYlvNAzZyfWQiQuGjOaaZNz
h9jrBuza9IIx0PoFnu9nly/nPlzS4d0A1/npaxEDrpKH+BG7q4Wk2wkO72vqtCzz
fC2UQ6TV0mGMiUXoQ7PChRe8fbgWp3edDnURDJDyY7xtERLNc9QDn4UVq4tGj0OE
F1+aDpFNpoRFTR/mcKFL1Ypcj4Qu/z7QLpuLlmsNLqfpOjEnNmXGINwWMcMUiL/s
aeZ3hrHdTLI282tviMoD9qNYFX/8Kcu/UFlUluXQEWsFyKZpReqwvRMALdENZt5o
2857Jzi/D1VQcIu9Tm5HycJ5vSZd6zdg1zRYRcNwYnjciAtqhnjAEO5x/XlxMwpv
6j6sJ+xrtX53U9fIu2X/TxP/3OB068KT3o42qTHMsnOTpLmSNAy0EY5nt2jq3Hft
UVJzByrhMQXn5Mj1aiVEHzd2zVFz68jpyGbfiQERnmROi699uZA2xmICRa4wOEQG
BYjvBNx5BFxXmQ4KW0B7JRRMkEQmkMPjMM7JZZmB6ibIhzvh4x3cpDSyjLLVT5mQ
4nD5b3TKOxLEu34xYiaeVUmGBvtC3tA94aITQK81itBh4eZbW/XeI4SUwyEyob1+
gd0OKqHRVXlXvYDQ02sEBz7kMkBpOmdHNfyhGPZNa6GObSJfxjM=
=S2lv
-----END PGP SIGNATURE-----

--wMuxWcyZQF33UfI3MCNgXDjXbmejdZI10--
