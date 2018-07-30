From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 xen-tip tree
Date: Mon, 30 Jul 2018 13:45:22 -0400
Message-ID: <c4dd4773-d2c8-5d1c-6c6e-b8c11b2489ac@oracle.com>
References: <20180730190210.48a75b72@canb.auug.org.au>
 <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1Y1oSzynr4021wIwpLA1bYR7nYNMHF5t3"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Hocko <mhocko@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1Y1oSzynr4021wIwpLA1bYR7nYNMHF5t3
Content-Type: multipart/mixed; boundary="duwpSwbFFWk5XRWFqEPZZdEJ3Wikbywjh";
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
Message-ID: <c4dd4773-d2c8-5d1c-6c6e-b8c11b2489ac@oracle.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 xen-tip tree
References: <20180730190210.48a75b72@canb.auug.org.au>
 <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>
In-Reply-To: <6bf747ac-13d0-f77b-4983-2015a5703a12@oracle.com>

--duwpSwbFFWk5XRWFqEPZZdEJ3Wikbywjh
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 07/30/2018 01:02 PM, Boris Ostrovsky wrote:
> On 07/30/2018 05:02 AM, Stephen Rothwell wrote:
>> Hi all,
>>
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
>> -- Cheers, Stephen Rothwell diff --cc drivers/xen/gntdev.c index
>> c866a62f766d,55b4f0e3f4d6..000000000000 --- a/drivers/xen/gntdev.c +++=

>> b/drivers/xen/gntdev.c @@@ -479,7 -441,20 +479,20 @@@ static const
>> struct vm_operations_struc /*
>> ------------------------------------------------------------------ */
>> -static bool in_range(struct grant_map *map, ++static bool
>> in_range(struct gntdev_grant_map *map, + unsigned long start, unsigned=

>> long end) + { + if (!map->vma) + return false; + if
>> (map->vma->vm_start >=3D end) + return false; + if (map->vma->vm_end <=
=3D
>> start) + return false; + + return true; + } + -static void
>> unmap_if_in_range(struct grant_map *map, +static void
>> unmap_if_in_range(struct gntdev_grant_map *map, unsigned long start,
>> unsigned long end) { unsigned long mstart, mend; @@@ -503,15 -472,26
>> +510,26 @@@ WARN_ON(err); } - static void mn_invl_range_start(struct
>> mmu_notifier *mn, + static int mn_invl_range_start(struct mmu_notifier=

>> *mn, struct mm_struct *mm, - unsigned long start, unsigned long end) +=

>> unsigned long start, unsigned long end, + bool blockable) { struct
>> gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, mn); - stru=
ct
>> grant_map *map; + struct gntdev_grant_map *map; + int ret =3D 0; + + /=
*
>> TODO do we really need a mutex here? */ + if (blockable) +
>> mutex_lock(&priv->lock); + else if (!mutex_trylock(&priv->lock)) +
>> return -EAGAIN; - mutex_lock(&priv->lock); list_for_each_entry(map,
>> &priv->maps, next) { + if (in_range(map, start, end)) { + ret =3D
>> -EAGAIN; + goto out_unlock; + } unmap_if_in_range(map, start, end); }
>> list_for_each_entry(map, &priv->freeable_maps, next) {


Ugh... That's some interesting whitespace optimization on part of
thundebird. Let me paste the relevant patch hunk here.


diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index bd56653b9bbc..55b4f0e3f4d6 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -441,18 +441,25 @@ static const struct vm_operations_struct gntdev_vmo=
ps =3D {
=20
 /* ------------------------------------------------------------------ */=

=20
+static bool in_range(struct grant_map *map,
+			      unsigned long start, unsigned long end)
+{
+	if (!map->vma)
+		return false;
+	if (map->vma->vm_start >=3D end)
+		return false;
+	if (map->vma->vm_end <=3D start)
+		return false;
+
+	return true;
+}
+
 static void unmap_if_in_range(struct grant_map *map,
 			      unsigned long start, unsigned long end)
 {
 	unsigned long mstart, mend;
 	int err;
=20
-	if (!map->vma)
-		return;
-	if (map->vma->vm_start >=3D end)
-		return;
-	if (map->vma->vm_end <=3D start)
-		return;
 	mstart =3D max(start, map->vma->vm_start);
 	mend   =3D min(end,   map->vma->vm_end);
 	pr_debug("map %d+%d (%lx %lx), range %lx %lx, mrange %lx %lx\n",
@@ -465,21 +472,40 @@ static void unmap_if_in_range(struct grant_map *map=
,
 	WARN_ON(err);
 }
=20
-static void mn_invl_range_start(struct mmu_notifier *mn,
+static int mn_invl_range_start(struct mmu_notifier *mn,
 				struct mm_struct *mm,
-				unsigned long start, unsigned long end)
+				unsigned long start, unsigned long end,
+				bool blockable)
 {
 	struct gntdev_priv *priv =3D container_of(mn, struct gntdev_priv, mn);
 	struct grant_map *map;
+	int ret =3D 0;
+
+	/* TODO do we really need a mutex here? */
+	if (blockable)
+		mutex_lock(&priv->lock);
+	else if (!mutex_trylock(&priv->lock))
+		return -EAGAIN;
=20
-	mutex_lock(&priv->lock);
 	list_for_each_entry(map, &priv->maps, next) {
+		if (in_range(map, start, end)) {
+			ret =3D -EAGAIN;
+			goto out_unlock;
+		}
 		unmap_if_in_range(map, start, end);
 	}
 	list_for_each_entry(map, &priv->freeable_maps, next) {
+		if (in_range(map, start, end)) {
+			ret =3D -EAGAIN;
+			goto out_unlock;
+		}
 		unmap_if_in_range(map, start, end);
 	}
+
+out_unlock:
 	mutex_unlock(&priv->lock);
+
+	return ret;
 }


-boris



>
> I clearly missed this (aaefcabe9c25) patch but now that I am looking at=

> it I don't think I understand the logic for changes in
> list_for_each_entry() loops.
>
> Aren't we ending up never unmapping grant pages? Michal, can you explai=
n
> what you are trying to do here?
>
>
> -boris
>
>
>



--duwpSwbFFWk5XRWFqEPZZdEJ3Wikbywjh--

--1Y1oSzynr4021wIwpLA1bYR7nYNMHF5t3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAltfTrIACgkQit52kIbK
wbJpGQ/+KkWIm64yGKlpwAMOF/Xmw7LodK606aZuXqTILJt2kZCcvuWO2yChRVcG
yruqDt/ljY0gu55mNlli1ap71P25uoLXlz0/NkYV9zvOXvQP6pgisSgicREcRpin
O3I2V8WMxfuhaoaMwlifLhBCvYx+SoTFCg/8qS/LZaEpj6WWAuK/oIr49/wNhOD7
W6pseuB3wD0O2uSIprI74HCQ3lCFs7S3sDeoOyCHh1Y2F6+krG9RxVT4RdwrhfPG
Xare9SHEZo2DStUvrqq91NTedLSxnyT6yBu7FLwky3qcx8fJLcSwYbnmVMiQNRzV
d0K5eCLNvyokNY2AiiixL1QFz5VPzBAXZ0n0dN974w9unzxsVjVDrW940H5l2P2k
ngVTEf/+tGQ8yiSbY/hdyQqoVWGuKLhe86xZRFwL/LlcmoY1sUR42YqU68oKh9RN
WAzWGF7hg/A8SOiyxXR1U4QcN8mdb2D0etcHjfSRwLQUgKYKlVw0+r87jhs52twE
0WkQlIsk5f3ZJDXlLK2ae4l30RZjWVO8DECE3kAblFmO8YbbV7jfrBXTcE7yDcQM
ULYjtz1FaWl9TiuD4ZqFIAjEdrnEgZEml7KDMxxxc6pK8PNfgTDaUNoShQSOP4PX
N+nQ4E/gx2EVhy52GVWLmwttHaJ+t34yXW/Vbywf3//3+Dqa32Y=
=7Tsm
-----END PGP SIGNATURE-----

--1Y1oSzynr4021wIwpLA1bYR7nYNMHF5t3--
