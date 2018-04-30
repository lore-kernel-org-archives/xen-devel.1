From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/cpu: Add supports for zhaoxin x86
 platform
Date: Mon, 30 Apr 2018 08:15:56 -0600
Message-ID: <5AE7251C02000078001BF9F1@prv1-mh.provo.novell.com>
References: <1524649895-5781-1-git-send-email-Davidwang@zhaoxin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__PartFCC74C0C.0__="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fD9b1-0007n7-Qj
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 14:16:03 +0000
In-Reply-To: <1524649895-5781-1-git-send-email-Davidwang@zhaoxin.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Davidwang <Davidwang@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

--=__PartFCC74C0C.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>>> On 25.04.18 at 11:51, <Davidwang@zhaoxin.com> wrote:
> --- a/xen/arch/x86/cpu/intel_cacheinfo.c
> +++ b/xen/arch/x86/cpu/intel_cacheinfo.c
> @@ -103,7 +103,7 @@ int cpuid4_cache_lookup(int index, struct cpuid4_info=
 *this_leaf)
>  	return 0;
>  }
> =20
> -static int find_num_cache_leaves(void)
> +int find_num_cache_leaves(void)

Instead of making this function non-static, please consider re-using
init_intel_cacheinfo(): All you want is skip the CPUID leaf 2 handling,
and you'd better to this by altering the single if() controlling it in =
that
function than by effectively introducing a clone. If you're concerned
of some other dead code in that function, attached you'll find a patch
deleting at least some of that.

> --- /dev/null
> +++ b/xen/arch/x86/cpu/shanghai.c
> @@ -0,0 +1,90 @@
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <asm/processor.h>
> +#include "cpu.h"
> +
> +void init_shanghai_cache(struct cpuinfo_x86 *c)
> +{
> +	unsigned int i =3D 0, l1d =3D 0, l1i =3D 0, l2 =3D 0, l3 =3D 0;
> +    struct cpuid4_info leaf;
> +	static bool is_initialized =3D false;
> +	static unsigned int cache_leaves =3D 0;
> +
> +	if ( (!is_initialized) && (c->cpuid_level > 0x00000003) )
> +    {

If there was a convincing argument that this clone of the original
function was really needed, then you'd need to go through here
and clean up style (various aspects of it are broken, most notably
the mix of space and tab indentation).

> --- a/xen/include/asm-x86/iommu.h
> +++ b/xen/include/asm-x86/iommu.h
> @@ -54,6 +54,7 @@ static inline const struct iommu_ops *iommu_get_ops(voi=
d)
>      switch ( boot_cpu_data.x86_vendor )
>      {
>      case X86_VENDOR_INTEL:
> +    case X86_VENDOR_SHANGHAI:
>          return &intel_iommu_ops;
>      case X86_VENDOR_AMD:
>          return &amd_iommu_ops;
> @@ -69,6 +70,7 @@ static inline int iommu_hardware_setup(void)
>      switch ( boot_cpu_data.x86_vendor )
>      {
>      case X86_VENDOR_INTEL:
> +    case X86_VENDOR_SHANGHAI:
>          return intel_vtd_setup();
>      case X86_VENDOR_AMD:
>          return amd_iov_detect();

There are numerous further occurrences of X86_VENDOR_INTEL throughout
the code base - is it really the case that no single one of them needs =
similar
amendment?

Jan



--=__PartFCC74C0C.0__=
Content-Type: text/plain; name="x86-init-Intel-cacheinfo.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="x86-init-Intel-cacheinfo.patch"

x86: remove read code from cpuid4_cache_lookup()=0A=0A... and make =
num_cache_leaves local to the only function using it.=0A=0ASigned-off-by: =
Jan Beulich <jbeulich@suse.com>=0A=0A--- unstable.orig/xen/arch/x86/cpu/int=
el_cacheinfo.c	2017-03-03 14:08:33.000000000 +0100=0A+++ unstable/xen/arch=
/x86/cpu/intel_cacheinfo.c	2018-04-30 15:59:54.637217413 +0200=0A@@ =
-80,8 +80,6 @@ static const struct _cache_table cache_t=0A 	{ 0x00, 0, =
0}=0A };=0A =0A-unsigned short			num_cache_leaves;=0A-=0A =
int cpuid4_cache_lookup(int index, struct cpuid4_info *this_leaf)=0A {=0A 	=
union _cpuid4_leaf_eax 	eax;=0A@@ -123,7 +121,7 @@ unsigned int init_intel_=
cacheinfo(struct=0A 	unsigned int trace =3D 0, l1i =3D 0, l1d =3D 0, l2 =
=3D 0, l3 =3D 0; /* Cache sizes */=0A 	unsigned int new_l1d =3D 0, =
new_l1i =3D 0; /* Cache sizes from cpuid(4) */=0A 	unsigned int =
new_l2 =3D 0, new_l3 =3D 0, i; /* Cache sizes from cpuid(4) */=0A-	=
unsigned int l2_id =3D 0, l3_id =3D 0, num_threads_sharing, index_msb;=0A+	=
static unsigned int num_cache_leaves;=0A =0A 	if (c->cpuid_level > 3) =
{=0A 		static int is_initialized;=0A@@ -156,15 +154,9 @@ unsigned =
int init_intel_cacheinfo(struct=0A 					=
break;=0A 				    case 2:=0A 				=
	new_l2 =3D this_leaf.size/1024;=0A-					=
num_threads_sharing =3D 1 + this_leaf.eax.split.num_threads_sharing;=0A-	=
				index_msb =3D get_count_order(num_threads_s=
haring);=0A-					l2_id =3D c->apicid >> =
index_msb;=0A 					break;=0A 			=
	    case 3:=0A 					new_l3 =3D =
this_leaf.size/1024;=0A-					num_threads=
_sharing =3D 1 + this_leaf.eax.split.num_threads_sharing;=0A-			=
		index_msb =3D get_count_order(num_threads_sharing);=0A-		=
			l3_id =3D c->apicid >> index_msb;=0A 			=
		break;=0A 				    default:=0A 	=
				break;=0A
--=__PartFCC74C0C.0__=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=__PartFCC74C0C.0__=--
