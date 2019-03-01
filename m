From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the xen-tip tree
Date: Fri, 1 Mar 2019 17:06:22 +1100
Message-ID: <20190301170622.6547961e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VOyMZKpg9/519naT73GnYsI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/VOyMZKpg9/519naT73GnYsI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Thanks, Dan for the heads up and resolution.]

Today's linux-next merge of the nvdimm tree got a conflict in:

  mm/memory_hotplug.c

between commit:

  357b4da50a62 ("x86: respect memory size limiting via mem=3D parameter")

from the xen-tip tree and commit:

  2794129e902d ("mm/memory-hotplug: Allow memory resources to be children")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memory_hotplug.c
index 1f678568ce5c,d2c44146473f..b96a3121b5e9
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@@ -101,28 -99,21 +101,24 @@@ u64 max_mem_size =3D U64_MAX
  /* add this memory to iomem resource */
  static struct resource *register_memory_resource(u64 start, u64 size)
  {
- 	struct resource *res, *conflict;
+ 	struct resource *res;
+ 	unsigned long flags =3D  IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+ 	char *resource_name =3D "System RAM";
 =20
 +	if (start + size > max_mem_size)
 +		return ERR_PTR(-E2BIG);
 +
- 	res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
- 	if (!res)
- 		return ERR_PTR(-ENOMEM);
-=20
- 	res->name =3D "System RAM";
- 	res->start =3D start;
- 	res->end =3D start + size - 1;
- 	res->flags =3D IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
- 	conflict =3D  request_resource_conflict(&iomem_resource, res);
- 	if (conflict) {
- 		if (conflict->desc =3D=3D IORES_DESC_DEVICE_PRIVATE_MEMORY) {
- 			pr_debug("Device unaddressable memory block "
- 				 "memory hotplug at %#010llx !\n",
- 				 (unsigned long long)start);
- 		}
- 		pr_debug("System RAM resource %pR cannot be added\n", res);
- 		kfree(res);
+ 	/*
+ 	 * Request ownership of the new memory range.  This might be
+ 	 * a child of an existing resource that was present but
+ 	 * not marked as busy.
+ 	 */
+ 	res =3D __request_region(&iomem_resource, start, size,
+ 			       resource_name, flags);
+=20
+ 	if (!res) {
+ 		pr_debug("Unable to reserve System RAM region: %016llx->%016llx\n",
+ 				start, start + size);
  		return ERR_PTR(-EEXIST);
  	}
  	return res;

--Sig_/VOyMZKpg9/519naT73GnYsI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx4y94ACgkQAVBC80lX
0GzieggAmiLoxygKDBJOg/eZMsP5iMc1q6sHmFialsNHFfKQjfEfXWPW5lGTWL7J
8ze2HzK2kUFBQRUysmk8v9AviXw0zxBW9OeS+0ruzczImdYDiNQkrdi97KzuEDsH
heVLTV7tUevV5+z83sYdPCFxQ1mTCcndLcbsXsl7QUlJg6mql6HNt4soSIhe9c/Q
XWvDAq+ADYkGt9NbwslcPGb3agaiganxSh62FjrVSfKuNTlmU5kSmjX5Ee5vIOjt
bbqwWh8peYkxW0jud4W77hwF4n3/cK9RGB4wY7Q6QVoVgB7Sev427bUK5eFSxhs3
sIopJXg+8EgeLY6cBfftJYXBdgAxWA==
=1QDT
-----END PGP SIGNATURE-----

--Sig_/VOyMZKpg9/519naT73GnYsI--
