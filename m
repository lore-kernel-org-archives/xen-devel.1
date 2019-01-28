From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Backport candidate for Arm
Date: Mon, 28 Jan 2019 14:58:30 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901281448510.17936@sstabellini-ThinkPad-X260>
References: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
 <cc1466b5-fbc3-0e1f-6092-4f559866337c@arm.com>
 <alpine.DEB.2.10.1901251719390.17936@sstabellini-ThinkPad-X260>
 <bc7a2f15-87c2-659a-a0ab-1ac40ef35992@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-20665183-1548716311=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1goFrM-0002Pk-Do
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 22:58:32 +0000
In-Reply-To: <bc7a2f15-87c2-659a-a0ab-1ac40ef35992@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-20665183-1548716311=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 28 Jan 2019, Julien Grall wrote:
> Hi,
> 
> On 1/26/19 1:30 AM, Stefano Stabellini wrote:
> > On Mon, 21 Jan 2019, Julien Grall wrote:
> > > Hi,
> > > 
> > > Ping?
> > > 
> > > Cheers,
> > > 
> > > On 30/11/2018 17:25, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > Below a list of backport candidate for Arm.
> > > > 
> > > > 
> > > > For Xen 4.10+ to handle correctly SMC call parameters and result
> > > > 
> > > > 35fc608612    xen/arm: smccc-1.1: Make return values unsigned long
> > > > fa7974f743      xen/arm: smccc-1.1: Handle function result as parameters
> > > > 
> > > > For Xen 4.9+ to avoid Dom0 crash when using less vCPUs than pCPUs on
> > > > GICv3
> > > > 
> > > > 703d9d5ec1      xen/arm: vgic-v3: Delay the initialization of the domain
> > > > information
> > > > 54ec59f6b0       xen/arm: vgic-v3: Don't create empty re-distributor
> > > > regions
> > > > 
> > > > The following patch is required in Xen 4.11 to avoid breaking the new
> > > > vGIC
> > > > after applying the 2 previous patches.
> > > > 
> > > > 62aa9e7f1b    xen/arm: Don't build GICv3 with the new vGIC
> > 
> > For the moment I skipped 54ec59f6b0 and 62aa9e7f1b because 62aa9e7f1b is
> > not a trivial backport. Everything else is done.
> 
> Thank you for backporting the patches. I think it was a bit odd to apply patch
> 703d9d5ec1 without the 2 patches. Anyway, below a replacement patch for
> 62aa9e7f1b.
> 
> diff --cc xen/arch/arm/Kconfig
> index 8174c0c635,581de67b6b..0000000000
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@@ -12,7 -12,6 +12,7 @@@ config ARM_3
>   config ARM_64
>         def_bool y
>         depends on 64BIT
> -       select HAS_GICV3
> ++      select HAS_GICV3 if !NEW_VGIC
> 
>   config ARM
>         def_bool y
> 

Thank you, and that is fine for 4.11. I did that. However for 4.9 and
4.10 we also need to make significant changes to 54ec59f6b0, or backport
a lot more. I went with the former approach -- does the backport commit
below look good to you for 4.10?


commit 316e4426a185efefa078dd087c89a694b2149be8
Author: Julien Grall <julien.grall@arm.com>
Date:   Mon Jan 28 14:54:52 2019 -0800

    xen/arm: vgic-v3: Don't create empty re-distributor regions
    
    At the moment, Xen is assuming the hardware domain will have the same
    number of re-distributor regions as the host. However, as the
    number of CPUs or the stride (e.g on GICv4) may be different we end up
    exposing regions which does not contain any re-distributors.
    
    When booting, Linux will go through all the re-distributor region to
    check whether a property (e.g vPLIs) is available accross all the
    re-distributors. This will result to a data abort on empty regions
    because there are no underlying re-distributor.
    
    So we need to limit the number of regions exposed to the hardware
    domain. The code reworked to only expose the minimun number of regions
    required by the hardware domain. It is assumed the regions will be
    populated starting from the first one.
    
    Lastly, rename vgic_v3_rdist_count to reflect the value return by the
    helper.
    
    Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    (cherry picked from commit 54ec59f6b0b363c34cf1864d5214a05e35ea75ee)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a0d290b..f8e5354 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1178,6 +1178,8 @@ static int gicv3_make_hwdom_dt_node(const struct domain *d,
      * GIC has two memory regions: Distributor + rdist regions
      * CPU interface and virtual cpu interfaces accessesed as System registers
      * So cells are created only for Distributor and rdist regions
+     * The hardware domain may not use all the regions. So only copy
+     * what is necessary.
      */
     len = len * (d->arch.vgic.nr_regions + 1);
     new_cells = xzalloc_bytes(len);
@@ -1416,6 +1418,10 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
 
     /* Add Generic Redistributor */
     size = sizeof(struct acpi_madt_generic_redistributor);
+    /*
+     * The hardware domain may not used all the regions. So only copy
+     * what is necessary.
+     */
     for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
     {
         gicr = (struct acpi_madt_generic_redistributor *)(base_ptr + table_len);
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 6a30b4a..f76b0b2 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1653,7 +1653,11 @@ static int vgic_v3_vcpu_init(struct vcpu *v)
     return 0;
 }
 
-static inline unsigned int vgic_v3_rdist_count(struct domain *d)
+/*
+ * Return the maximum number possible of re-distributor regions for
+ * a given domain.
+ */
+static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
 {
     return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
                GUEST_GICV3_RDIST_REGIONS;
@@ -1665,7 +1669,7 @@ static int vgic_v3_real_domain_init(struct domain *d)
     int rdist_count, i, ret;
 
     /* Allocate memory for Re-distributor regions */
-    rdist_count = vgic_v3_rdist_count(d);
+    rdist_count = vgic_v3_max_rdist_count(d);
 
     rdist_regions = xzalloc_array(struct vgic_rdist_region, rdist_count);
     if ( !rdist_regions )
@@ -1707,8 +1711,19 @@ static int vgic_v3_real_domain_init(struct domain *d)
             d->arch.vgic.rdist_regions[i].first_cpu = first_cpu;
 
             first_cpu += size / d->arch.vgic.rdist_stride;
+
+            if ( first_cpu >= d->max_vcpus )
+                break;
         }
 
+        /*
+         * The hardware domain may not use all the re-distributors
+         * regions (e.g when the number of vCPUs does not match the
+         * number of pCPUs). Update the number of regions to avoid
+         * exposing unused region as they will not get emulated.
+         */
+        d->arch.vgic.nr_regions = i + 1;
+
         d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
     }
     else
@@ -1839,7 +1854,7 @@ int vgic_v3_init(struct domain *d, int *mmio_count)
     }
 
     /* GICD region + number of Redistributors */
-    *mmio_count = vgic_v3_rdist_count(d) + 1;
+    *mmio_count = vgic_v3_max_rdist_count(d) + 1;
 
     /* one region per ITS */
     *mmio_count += vgic_v3_its_count(d);
--8323329-20665183-1548716311=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-20665183-1548716311=:17936--
