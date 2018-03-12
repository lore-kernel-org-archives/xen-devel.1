From: Manish Jaggi <manish.jaggi@linaro.org>
Subject: Re: [PATCH 5/7] xen/iommu: smmu-v3: Add Xen specific
 code to enable the ported driver
Date: Mon, 12 Mar 2018 09:06:44 +0530
Message-ID: <CAM8n_3t1+-2r5Ku9Srp65F=929Hw9Aonb61y79ajXxLwiC4ORA@mail.gmail.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-6-sameer.goel@linaro.org>
 <266a9e65-fbe0-94b6-b52c-3170079d64f3@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3227785545391631416=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+k8r=gc=linaro.org=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1evEGa-0000sM-RP
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 03:36:53 +0000
Received: by mail-ua0-x232.google.com with SMTP id b13so5871072uam.10
 for <xen-devel@lists.xenproject.org>; Sun, 11 Mar 2018 20:36:46 -0700 (PDT)
In-Reply-To: <266a9e65-fbe0-94b6-b52c-3170079d64f3@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, shankerd@codeaurora.org, Sameer Goel <sameer.goel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

--===============3227785545391631416==
Content-Type: multipart/alternative; boundary="001a11452256e3807405672ed983"

--001a11452256e3807405672ed983
Content-Type: text/plain; charset="UTF-8"

On 10 March 2018 at 23:23, Manish Jaggi <mjaggi@caviumnetworks.com> wrote:
> Hi Sameer,
>
>
>
> On 02/09/2018 08:40 AM, Sameer Goel wrote:
>>
>> This driver follows an approach similar to smmu driver. The intent here
>> is to reuse as much Linux code as possible.
>> - Glue code has been introduced to bridge the API calls.
>> - Called Linux functions from the Xen IOMMU function calls.
>> - Xen modifications are preceded by /*Xen: comment */
>> - xen/linux_compat: Add a Linux compat header
>>    For porting files directly from Linux it is useful to have a function
>> mapping
>>    definitions from Linux to Xen. This file adds common API functions and
>>    other defines that are needed for porting arm SMMU drivers.
>>
>> Signed-off-by: Sameer Goel <sameer.goel@linaro.org>
>> ---
>>   xen/arch/arm/p2m.c                    |   1 +
>>   xen/drivers/Kconfig                   |   2 +
>>   xen/drivers/passthrough/arm/Kconfig   |   8 +
>>   xen/drivers/passthrough/arm/Makefile  |   1 +
>>   xen/drivers/passthrough/arm/smmu-v3.c | 892
>> ++++++++++++++++++++++++++++++++--
>>   xen/include/xen/linux_compat.h        |  84 ++++
>>   6 files changed, 959 insertions(+), 29 deletions(-)
>>   create mode 100644 xen/drivers/passthrough/arm/Kconfig
>>   create mode 100644 xen/include/xen/linux_compat.h
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 65e8b9c6ea..fef7605fd6 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1460,6 +1460,7 @@ err:
>>   static void __init setup_virt_paging_one(void *data)
>>   {
>>       unsigned long val = (unsigned long)data;
>> +    /* SMMUv3 S2 cfg vtcr reuses the following value */
>>       WRITE_SYSREG32(val, VTCR_EL2);
>>       isb();
>>   }
>> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
>> index bc3a54f0ea..612655386d 100644
>> --- a/xen/drivers/Kconfig
>> +++ b/xen/drivers/Kconfig
>> @@ -12,4 +12,6 @@ source "drivers/pci/Kconfig"
>>     source "drivers/video/Kconfig"
>>   +source "drivers/passthrough/arm/Kconfig"
>> +
>>   endmenu
>> diff --git a/xen/drivers/passthrough/arm/Kconfig
>> b/xen/drivers/passthrough/arm/Kconfig
>> new file mode 100644
>> index 0000000000..cda899f608
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/Kconfig
>> @@ -0,0 +1,8 @@
>> +
>> +config ARM_SMMU_v3
>> +       bool "ARM SMMUv3 Support"
>> +       depends on ARM_64
>> +       help
>> +        Support for implementations of the ARM System MMU architecture
>> +        version 3.
>> +
>> diff --git a/xen/drivers/passthrough/arm/Makefile
>> b/xen/drivers/passthrough/arm/Makefile
>> index f4cd26e15d..e14732b55c 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -1,2 +1,3 @@
>>   obj-y += iommu.o
>>   obj-y += smmu.o
>> +obj-$(CONFIG_ARM_SMMU_v3) += smmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c
>> b/xen/drivers/passthrough/arm/smmu-v3.c
>> index e67ba6c40f..f43485fe6e 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -18,28 +18,414 @@
>>    * Author: Will Deacon <will.deacon@arm.com>
>>    *
>>    * This driver is powered by bad coffee and bombay mix.
>> + *
>> + *
>> + * Based on Linux drivers/iommu/arm-smmu-v3.c
>> + * => commit 7aa8619a66aea52b145e04cbab4f8d6a4e5f3f3b
>> + *
>> + * Xen modifications:
>> + * Sameer Goel <sameer.goel@linaro.org>
>> + * Copyright (C) 2017, The Linux Foundation, All rights reserved.
>> + *
>> + */
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/config.h>
>> +#include <xen/delay.h>
>> +#include <xen/errno.h>
>> +#include <xen/err.h>
>> +#include <xen/irq.h>
>> +#include <xen/lib.h>
>> +#include <xen/linux_compat.h>
>> +#include <xen/list.h>
>> +#include <xen/mm.h>
>> +#include <xen/rbtree.h>
>> +#include <xen/sched.h>
>> +#include <xen/sizes.h>
>> +#include <xen/vmap.h>
>> +#include <acpi/acpi_iort.h>
>> +#include <asm/atomic.h>
>> +#include <asm/device.h>
>> +#include <asm/io.h>
>> +#include <asm/platform.h>
>> +
>> +/* Alias to Xen device tree helpers */
>> +#define device_node dt_device_node
>> +#define of_phandle_args dt_phandle_args
>> +#define of_device_id dt_device_match
>> +#define of_match_node dt_match_node
>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np,
>> pname, out))
>> +#define of_property_read_bool dt_property_read_bool
>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
>> +
>> +/* Xen: Helpers to get device MMIO and IRQs */
>> +struct resource {
>> +       u64 addr;
>> +       u64 size;
>> +       unsigned int type;
>> +};
>> +
>> +#define resource_size(res) ((res)->size)
>> +
>> +#define platform_device device
>> +
>> +#define IORESOURCE_MEM 0
>> +#define IORESOURCE_IRQ 1
>> +
>> +static struct resource *platform_get_resource(struct platform_device
>> *pdev,
>> +                                             unsigned int type,
>> +                                             unsigned int num)
>> +{
>> +       /*
>> +        * The resource is only used between 2 calls of
>> platform_get_resource.
>> +        * It's quite ugly but it's avoid to add too much code in the
part
>> +        * imported from Linux
>> +        */
>> +       static struct resource res;
>> +       struct acpi_iort_node *iort_node;
>> +       struct acpi_iort_smmu_v3 *node_smmu_data;
>> +       int ret = 0;
>> +
>> +       res.type = type;
>> +
>> +       switch (type) {
>> +       case IORESOURCE_MEM:
>> +               if (pdev->type == DEV_ACPI) {
>> +                       ret = 1;
>> +                       iort_node = pdev->acpi_node;
>> +                       node_smmu_data =
>> +                               (struct acpi_iort_smmu_v3
>> *)iort_node->node_data;
>> +
>> +                       if (node_smmu_data != NULL) {
>> +                               res.addr = node_smmu_data->base_address;
>> +                               res.size = SZ_128K;
>> +                               ret = 0;
>> +                       }
>> +               } else {
>> +                       ret = dt_device_get_address(dev_to_dt(pdev), num,
>> +                                                   &res.addr,
&res.size);
>> +               }
>> +
>> +               return ((ret) ? NULL : &res);
>> +
>> +       case IORESOURCE_IRQ:
>> +               /* ACPI case not implemented as there is no use case for
>> it */
>> +               ret = platform_get_irq(dev_to_dt(pdev), num);
>> +
>> +               if (ret < 0)
>> +                       return NULL;
>> +
>> +               res.addr = ret;
>> +               res.size = 1;
>> +
>> +               return &res;
>> +
>> +       default:
>> +               return NULL;
>> +       }
>> +}
>> +
>> +static int platform_get_irq_byname(struct platform_device *pdev, const
>> char *name)
>> +{
>> +       const struct dt_property *dtprop;
>> +       struct acpi_iort_node *iort_node;
>> +       struct acpi_iort_smmu_v3 *node_smmu_data;
>> +       int ret = 0;
>> +
>> +       if (pdev->type == DEV_ACPI) {
>> +               iort_node = pdev->acpi_node;
>> +               node_smmu_data = (struct acpi_iort_smmu_v3
>> *)iort_node->node_data;
>> +
>> +               if (node_smmu_data != NULL) {
>> +                       if (!strcmp(name, "eventq"))
>> +                               ret = node_smmu_data->event_gsiv;
>> +                       else if (!strcmp(name, "priq"))
>> +                               ret = node_smmu_data->pri_gsiv;
>> +                       else if (!strcmp(name, "cmdq-sync"))
>> +                               ret = node_smmu_data->sync_gsiv;
>> +                       else if (!strcmp(name, "gerror"))
>> +                               ret = node_smmu_data->gerr_gsiv;
>> +                       else
>> +                               ret = -EINVAL;
>> +               }
>> +       } else {
>> +               dtprop = dt_find_property(dev_to_dt(pdev),
>> "interrupt-names", NULL);
>> +               if (!dtprop)
>> +                       return -EINVAL;
>> +
>> +               if (!dtprop->value)
>> +                       return -ENODATA;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +/*
>> + * Xen: Helpers for DMA allocation. Just the function name is reused for
>> + * porting code these allocation are not managed allocations
>>    */
>>   -#include <linux/acpi.h>
>> -#include <linux/acpi_iort.h>
>> -#include <linux/delay.h>
>> -#include <linux/dma-iommu.h>
>> -#include <linux/err.h>
>> -#include <linux/interrupt.h>
>> -#include <linux/iommu.h>
>> -#include <linux/iopoll.h>
>> -#include <linux/module.h>
>> -#include <linux/msi.h>
>> -#include <linux/of.h>
>> -#include <linux/of_address.h>
>> -#include <linux/of_iommu.h>
>> -#include <linux/of_platform.h>
>> -#include <linux/pci.h>
>> -#include <linux/platform_device.h>
>> -
>> -#include <linux/amba/bus.h>
>> -
>> -#include "io-pgtable.h"
>> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
>> +                          dma_addr_t *dma_handle, gfp_t gfp)
>> +{
>> +       void *vaddr;
>> +       unsigned long alignment = size;
>> +
>> +       /*
>> +        * _xzalloc requires that the (align & (align -1)) = 0. Most of
>> the
>> +        * allocations in SMMU code should send the right value for size.
>> In
>> +        * case this is not true print a warning and align to the size of
>> a
>> +        * (void *)
>> +        */
>> +       if (size & (size - 1)) {
>> +               dev_warn(dev, "Fixing alignment for the DMA buffer\n");
>> +               alignment = sizeof(void *);
>> +       }
>> +
>> +       vaddr = _xzalloc(size, alignment);
>> +       if (!vaddr) {
>> +               dev_err(dev, "DMA allocation failed\n");
>> +               return NULL;
>> +       }
>> +
>> +       *dma_handle = virt_to_maddr(vaddr);
>> +
>> +       return vaddr;
>> +}
>> +
>> +
>> +static void dmam_free_coherent(struct device *dev, size_t size, void
>> *vaddr,
>> +                       dma_addr_t dma_handle)
>> +{
>> +       xfree(vaddr);
>> +}
>> +
>> +/* Xen: Stub out DMA domain related functions */
>> +#define iommu_get_dma_cookie(dom) 0
>> +#define iommu_put_dma_cookie(dom)
>> +
>> +/* Xen: Stub out module param related function */
>> +#define module_param_named(a, b, c, d)
>> +#define MODULE_PARM_DESC(a, b)
>> +
>> +#define dma_set_mask_and_coherent(d, b) 0
>> +
>> +#define of_dma_is_coherent(n) 0
>> +
>> +#define MODULE_DEVICE_TABLE(type, name)
>> +
>> +static void __iomem *devm_ioremap_resource(struct device *dev,
>> +                                          struct resource *res)
>> +{
>> +       void __iomem *ptr;
>> +
>> +       if (!res || res->type != IORESOURCE_MEM) {
>> +               dev_err(dev, "Invalid resource\n");
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       ptr = ioremap_nocache(res->addr, res->size);
>> +       if (!ptr) {
>> +               dev_err(dev,
>> +                       "ioremap failed (addr 0x%"PRIx64" size
>> 0x%"PRIx64")\n",
>> +                       res->addr, res->size);
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +
>> +       return ptr;
>> +}
>> +
>> +/* Xen: Compatibility define for iommu_domain_geometry.*/
>> +struct iommu_domain_geometry {
>> +       dma_addr_t aperture_start; /* First address that can be mapped
>> */
>> +       dma_addr_t aperture_end;   /* Last address that can be mapped
>> */
>> +       bool force_aperture;       /* DMA only allowed in mappable range?
>> */
>> +};
>> +
>> +
>> +/* Xen: Type definitions for iommu_domain */
>> +#define IOMMU_DOMAIN_UNMANAGED 0
>> +#define IOMMU_DOMAIN_DMA 1
>> +#define IOMMU_DOMAIN_IDENTITY 2
>> +
>> +/* Xen: Dummy iommu_domain */
>> +struct iommu_domain {
>> +       /* Runtime SMMU configuration for this iommu_domain */
>> +       struct arm_smmu_domain          *priv;
>> +       unsigned int type;
>> +
>> +       /* Dummy compatibility defines */
>> +       unsigned long pgsize_bitmap;
>> +       struct iommu_domain_geometry geometry;
>> +
>> +       atomic_t ref;
>> +       /*
>> +        * Used to link iommu_domain contexts for a same domain.
>> +        * There is at least one per-SMMU to used by the domain.
>> +        */
>> +       struct list_head                list;
>> +};
>> +
>> +/* Xen: Describes information required for a Xen domain */
>> +struct arm_smmu_xen_domain {
>> +       spinlock_t                      lock;
>> +       /* List of iommu domains associated to this domain */
>> +       struct list_head                contexts;
>> +};
>> +
>> +/*
>> + * Xen: Information about each device stored in dev->archdata.iommu
>> + *
>> + * The dev->archdata.iommu stores the iommu_domain (runtime
configuration
>> of
>> + * the SMMU).
>> + */
>> +struct arm_smmu_xen_device {
>> +       struct iommu_domain *domain;
>> +};
>> +
>> +/*
>> + * Xen: io_pgtable compatibility defines.
>> + * Most of these are to port in the S1 translation code as is.
>> + */
>> +struct io_pgtable_ops {
>> +};
>> +
>> +struct iommu_gather_ops {
>> +       void (*tlb_flush_all)(void *cookie);
>> +       void (*tlb_add_flush)(unsigned long iova, size_t size, size_t
>> granule,
>> +                             bool leaf, void *cookie);
>> +       void (*tlb_sync)(void *cookie);
>> +};
>> +
>> +struct io_pgtable_cfg {
>> +       /*
>> +        * IO_PGTABLE_QUIRK_ARM_NS: (ARM formats) Set NS and NSTABLE bits
>> in
>> +        *      stage 1 PTEs, for hardware which insists on validating
>> them
>> +        *      even in non-secure state where they should normally be
>> ignored.
>> +        *
>> +        * IO_PGTABLE_QUIRK_NO_PERMS: Ignore the IOMMU_READ, IOMMU_WRITE
>> and
>> +        *      IOMMU_NOEXEC flags and map everything with full access,
>> for
>> +        *      hardware which does not implement the permissions of a
>> given
>> +        *      format, and/or requires some format-specific default
>> value.
>> +        *
>> +        * IO_PGTABLE_QUIRK_TLBI_ON_MAP: If the format forbids caching
>> invalid
>> +        *      (unmapped) entries but the hardware might do so anyway,
>> perform
>> +        *      TLB maintenance when mapping as well as when unmapping.
>> +        *
>> +        * IO_PGTABLE_QUIRK_ARM_MTK_4GB: (ARM v7s format) Set bit 9 in
all
>> +        *      PTEs, for Mediatek IOMMUs which treat it as a 33rd
address
>> bit
>> +        *      when the SoC is in "4GB mode" and they can only access
the
>> high
>> +        *      remap of DRAM (0x1_00000000 to 0x1_ffffffff).
>> +        *
>> +        * IO_PGTABLE_QUIRK_NO_DMA: Guarantees that the tables will only
>> ever
>> +        *      be accessed by a fully cache-coherent IOMMU or CPU (e.g.
>> for a
>> +        *      software-emulated IOMMU), such that pagetable updates
need
>> not
>> +        *      be treated as explicit DMA data.
>> +        */
>> +       #define IO_PGTABLE_QUIRK_ARM_NS         BIT(0)
>> +       #define IO_PGTABLE_QUIRK_NO_PERMS       BIT(1)
>> +       #define IO_PGTABLE_QUIRK_TLBI_ON_MAP    BIT(2)
>> +       #define IO_PGTABLE_QUIRK_ARM_MTK_4GB    BIT(3)
>> +       #define IO_PGTABLE_QUIRK_NO_DMA         BIT(4)
>> +       unsigned long                   quirks;
>> +       unsigned long                   pgsize_bitmap;
>> +       unsigned int                    ias;
>> +       unsigned int                    oas;
>> +       const struct iommu_gather_ops   *tlb;
>> +       struct device                   *iommu_dev;
>> +
>> +       /* Low-level data specific to the table format */
>> +       union {
>> +               struct {
>> +                       u64     ttbr[2];
>> +                       u64     tcr;
>> +                       u64     mair[2];
>> +               } arm_lpae_s1_cfg;
>> +
>> +               struct {
>> +                       u64     vttbr;
>> +                       u64     vtcr;
>> +               } arm_lpae_s2_cfg;
>> +
>> +               struct {
>> +                       u32     ttbr[2];
>> +                       u32     tcr;
>> +                       u32     nmrr;
>> +                       u32     prrr;
>> +               } arm_v7s_cfg;
>> +       };
>> +};
>> +
>> +enum io_pgtable_fmt {
>> +       ARM_32_LPAE_S1,
>> +       ARM_32_LPAE_S2,
>> +       ARM_64_LPAE_S1,
>> +       ARM_64_LPAE_S2,
>> +       ARM_V7S,
>> +       IO_PGTABLE_NUM_FMTS,
>> +};
>> +
>> +/*
>> + * Xen: The pgtable_ops are used by the S1 translations, so return the
>> dummy
>> + * address.
>> + */
>> +#define alloc_io_pgtable_ops(f, c, o) ((struct io_pgtable_ops *)0x0)
>
> Is this correct? it will make the caller null check fail
In your earlier patch it was

#define alloc_io_pgtable_ops(f, c, o) ((struct io_pgtable_ops *)0xDEADBEEF)

>
>> +#define free_io_pgtable_ops(o)
>> +
>> +/* Xen: Define wrapper for requesting IRQs */
>> +#define IRQF_ONESHOT 0
>> +
>> +typedef void (*irq_handler_t)(int, void *, struct cpu_user_regs *);
>> +
>> +static inline int devm_request_irq(struct device *dev, unsigned int irq,
>> +                                  irq_handler_t handler, unsigned long
>> irqflags,
>> +                                  const char *devname, void *dev_id)
>> +{
>> +       /*
>> +        * SMMUv3 implementation can support wired interrupt outputs that
>> are
>> +        * edge-triggered. Set the irq type as per the spec.
>> +        */
>> +       irq_set_type(irq, IRQ_TYPE_EDGE_BOTH);
>> +       return request_irq(irq, irqflags, handler, devname, dev_id);
>> +}
>> +
>> +/*
>> + * Xen does not have a concept of threaded irq, but eventually we can
use
>> + * tasklets to optimize the following function.
>> + */
>> +int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>> irq_handler_t handler,
>> +                             irq_handler_t thread_fn, unsigned long
>> irqflags,
>> +                             const char *devname, void *dev_id)
>> +{
>> +       return devm_request_irq(dev, irq, thread_fn, irqflags, devname,
>> dev_id);
>> +}
>> +
>> +/* Xen: The mutex is used only during initialization so the typecast is
>> safe */
>> +#define mutex spinlock
>> +#define mutex_init spin_lock_init
>> +#define mutex_lock spin_lock
>> +#define mutex_unlock spin_unlock
>> +
>> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us) \
>> +({ \
>> +       s_time_t deadline = NOW() + MICROSECS(timeout_us); \
>> +       for (;;) { \
>> +               (val) = op(addr); \
>> +               if (cond) \
>> +                       break; \
>> +               if (NOW() > deadline) { \
>> +                       (val) = op(addr); \
>> +                       break; \
>> +               } \
>> +       udelay(sleep_us); \
>> +       } \
>> +       (cond) ? 0 : -ETIMEDOUT; \
>> +})
>> +
>> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us,
timeout_us)
>> \
>> +       readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us,
>> timeout_us)
>> +
>> +#define VA_BITS 0 /* Only needed for S1 translations */
>>     /* MMIO registers */
>>   #define ARM_SMMU_IDR0                 0x0
>> @@ -433,6 +819,7 @@ enum pri_resp {
>>         PRI_RESP_SUCC,
>>   };
>>   +#if 0 /* Xen: No MSI support in this iteration */
>>   enum arm_smmu_msi_index {
>>         EVTQ_MSI_INDEX,
>>         GERROR_MSI_INDEX,
>> @@ -457,6 +844,7 @@ static phys_addr_t
>> arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
>>                 ARM_SMMU_PRIQ_IRQ_CFG2,
>>         },
>>   };
>> +#endif
>>     struct arm_smmu_cmdq_ent {
>>         /* Common fields */
>> @@ -561,6 +949,8 @@ struct arm_smmu_s2_cfg {
>>         u16                             vmid;
>>         u64                             vttbr;
>>         u64                             vtcr;
>> +       /* Xen: Domain associated to this configuration */
>> +       struct domain                   *domain;
>>   };
>>     struct arm_smmu_strtab_ent {
>> @@ -635,9 +1025,21 @@ struct arm_smmu_device {
>>         struct arm_smmu_strtab_cfg      strtab_cfg;
>>         /* IOMMU core code handle */
>> +#if 0 /*Xen: Generic iommu_device ref not needed here */
>>         struct iommu_device             iommu;
>> +#endif
>> +       /* Xen: Need to keep a list of SMMU devices */
>> +       struct list_head                devices;
>>   };
>>   +/* Xen: Keep a list of devices associated with this driver */
>> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
>> +static LIST_HEAD(arm_smmu_devices);
>> +/* Xen: Helper for finding a device using fwnode */
>> +static
>> +struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle
>> *fwnode);
>> +
>> +
>>   /* SMMU private data for each master */
>>   struct arm_smmu_master_data {
>>         struct arm_smmu_device          *smmu;
>> @@ -1232,7 +1634,7 @@ static void arm_smmu_handle_ppr(struct
>> arm_smmu_device *smmu, u64 *evt)
>>         dev_info(smmu->dev, "unexpected PRI request received:\n");
>>         dev_info(smmu->dev,
>> -                "\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access
>> at iova 0x%016llx\n",
>> +                "\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access
>> at iova %#" PRIx64 "\n",
>>                  sid, ssid, grpid, last ? "L" : "",
>>                  evt[0] & PRIQ_0_PERM_PRIV ? "" : "un",
>>                  evt[0] & PRIQ_0_PERM_READ ? "R" : "",
>> @@ -1346,6 +1748,8 @@ static irqreturn_t
arm_smmu_combined_irq_handler(int
>> irq, void *dev)
>>   {
>>         arm_smmu_gerror_handler(irq, dev);
>>         arm_smmu_cmdq_sync_handler(irq, dev);
>> +       /*Xen: No threaded irq. So call the required function from here
*/
>> +       arm_smmu_combined_irq_thread(irq, dev);
>>         return IRQ_WAKE_THREAD;
>>   }
>>   @@ -1358,6 +1762,46 @@ static void __arm_smmu_tlb_sync(struct
>> arm_smmu_device *smmu)
>>         arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>>   }
>>   +/*
>> + * Xen: Define the IRQ handlers for xen. The linux functions would be
>> + * modified to use the functions defined in the following code.
>> + */
>> +static void arm_smmu_evtq_thread_xen(int irq, void *dev,
>> +                                      struct cpu_user_regs *regs)
>> +{
>> +       arm_smmu_evtq_thread(irq, dev);
>> +}
>> +
>> +static void arm_smmu_priq_thread_xen(int irq, void *dev,
>> +                                      struct cpu_user_regs *regs)
>> +{
>> +       arm_smmu_priq_thread(irq, dev);
>> +}
>> +
>> +static void arm_smmu_cmdq_sync_handler_xen(int irq, void *dev,
>> +                                      struct cpu_user_regs *regs)
>> +{
>> +       arm_smmu_cmdq_sync_handler(irq, dev);
>> +}
>> +
>> +static void arm_smmu_gerror_handler_xen(int irq, void *dev,
>> +                                      struct cpu_user_regs *regs)
>> +{
>> +       arm_smmu_gerror_handler(irq, dev);
>> +}
>> +
>> +static void arm_smmu_combined_irq_handler_xen(int irq, void *dev,
>> +                                      struct cpu_user_regs *regs)
>> +{
>> +       arm_smmu_combined_irq_handler(irq, dev);
>> +}
>> +
>> +#define arm_smmu_evtq_thread arm_smmu_evtq_thread_xen
>> +#define arm_smmu_priq_thread arm_smmu_priq_thread_xen
>> +#define arm_smmu_cmdq_sync_handler arm_smmu_cmdq_sync_handler_xen
>> +#define arm_smmu_gerror_handler arm_smmu_gerror_handler_xen
>> +#define arm_smmu_combined_irq_handler arm_smmu_combined_irq_handler_xen
>> +
>>   static void arm_smmu_tlb_sync(void *cookie)
>>   {
>>         struct arm_smmu_domain *smmu_domain = cookie;
>> @@ -1415,6 +1859,7 @@ static const struct iommu_gather_ops
>> arm_smmu_gather_ops = {
>>         .tlb_sync       = arm_smmu_tlb_sync,
>>   };
>>   +#if 0 /*Xen: Unused functionality */
>>   /* IOMMU API */
>>   static bool arm_smmu_capable(enum iommu_cap cap)
>>   {
>> @@ -1427,6 +1872,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
>>                 return false;
>>         }
>>   }
>> +#endif
>>     static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>>   {
>> @@ -1546,9 +1992,16 @@ static int arm_smmu_domain_finalise_s2(struct
>> arm_smmu_domain *smmu_domain,
>>         if (vmid < 0)
>>                 return vmid;
>>   -     cfg->vmid       = (u16)vmid;
>> -       cfg->vttbr      = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
>> -       cfg->vtcr       = pgtbl_cfg->arm_lpae_s2_cfg.vtcr;
>> +       /*
>> +        * Xen: Get the ttbr and vtcr values
>> +        * vttbr: This is a shared value with the domain page table
>> +        * vtcr: The TCR settings are the same as CPU since the page
>> +        * tables are shared
>> +        */
>> +
>> +       cfg->vmid       = vmid;
>> +       cfg->vttbr      = page_to_maddr(cfg->domain->arch.p2m.root);
>> +       cfg->vtcr       = READ_SYSREG32(VTCR_EL2) &
>> STRTAB_STE_2_VTCR_MASK;
>>         return 0;
>>   }
>>   @@ -1604,6 +2057,7 @@ static int arm_smmu_domain_finalise(struct
>> iommu_domain *domain)
>>         if (smmu->features & ARM_SMMU_FEAT_COHERENCY)
>>                 pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_NO_DMA;
>>   +     /* Xen: pgtbl_ops gets an invalid address */
>>         pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
>>         if (!pgtbl_ops)
>>                 return -ENOMEM;
>
> Will this not fail ?
>
>> @@ -1721,6 +2175,7 @@ out_unlock:
>>         return ret;
>>   }
>>   +#if 0 /* Xen: Unused functionality */
>>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long
iova,
>>                         phys_addr_t paddr, size_t size, int prot)
>>   {
>> @@ -1772,6 +2227,7 @@ struct arm_smmu_device
>> *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
>>         put_device(dev);
>>         return dev ? dev_get_drvdata(dev) : NULL;
>>   }
>> +#endif
>>     static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32
>> sid)
>>   {
>> @@ -1783,7 +2239,14 @@ static bool arm_smmu_sid_in_range(struct
>> arm_smmu_device *smmu, u32 sid)
>>         return sid < limit;
>>   }
>>   +/* Xen: Unused */
>> +#if 0
>>   static struct iommu_ops arm_smmu_ops;
>> +#endif
>> +
>> +/* Xen: Redefine arm_smmu_ops to what fwspec should evaluate */
>> +static const struct iommu_ops arm_smmu_iommu_ops;
>> +#define arm_smmu_ops arm_smmu_iommu_ops
>>     static int arm_smmu_add_device(struct device *dev)
>>   {
>> @@ -1791,8 +2254,11 @@ static int arm_smmu_add_device(struct device *dev)
>>         struct arm_smmu_device *smmu;
>>         struct arm_smmu_master_data *master;
>>         struct iommu_fwspec *fwspec = dev->iommu_fwspec;
>> +#if 0 /*Xen: iommu_group is not needed */
>>         struct iommu_group *group;
>> +#endif
>>   +     /* Xen: fwspec->ops are not needed */
>>         if (!fwspec || fwspec->ops != &arm_smmu_ops)
>>                 return -ENODEV;
>>         /*
>> @@ -1830,6 +2296,11 @@ static int arm_smmu_add_device(struct device *dev)
>>                 }
>>         }
>>   +/*
>> + * Xen: Do not need an iommu group as the stream data is carried by the
>> SMMU
>> + * master device object
>> + */
>> +#if 0
>>         group = iommu_group_get_for_dev(dev);
>>         if (!IS_ERR(group)) {
>>                 iommu_group_put(group);
>> @@ -1837,8 +2308,16 @@ static int arm_smmu_add_device(struct device *dev)
>>         }
>>         return PTR_ERR_OR_ZERO(group);
>> +#endif
>> +       return 0;
>>   }
>>   +/*
>> + * Xen: We can potentially support this function and destroy a device.
>> This
>> + * will be relevant for PCI hotplug. So, will be implemented as needed
>> after
>> + * passthrough support is available.
>> + */
>> +#if 0
>>   static void arm_smmu_remove_device(struct device *dev)
>>   {
>>         struct iommu_fwspec *fwspec = dev->iommu_fwspec;
>> @@ -1974,6 +2453,7 @@ static struct iommu_ops arm_smmu_ops = {
>>         .put_resv_regions       = arm_smmu_put_resv_regions,
>>         .pgsize_bitmap          = -1UL, /* Restricted during device
attach
>> */
>>   };
>> +#endif
>>     /* Probing and initialisation functions */
>>   static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>> @@ -2182,6 +2662,7 @@ static int arm_smmu_update_gbpa(struct
>> arm_smmu_device *smmu, u32 set, u32 clr)
>>                                           1, ARM_SMMU_POLL_TIMEOUT_US);
>>   }
>>   +#if 0 /* Xen: There is no MSI support as yet */
>>   static void arm_smmu_free_msis(void *data)
>>   {
>>         struct device *dev = data;
>> @@ -2247,12 +2728,15 @@ static void arm_smmu_setup_msis(struct
>> arm_smmu_device *smmu)
>>         /* Add callback to free MSIs on teardown */
>>         devm_add_action(dev, arm_smmu_free_msis, dev);
>>   }
>> +#endif
>>     static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>>   {
>>         int irq, ret;
>>   +#if 0 /*Xen: Cannot setup msis for now */
>>         arm_smmu_setup_msis(smmu);
>> +#endif
>>         /* Request interrupt lines */
>>         irq = smmu->evtq.q.irq;
>> @@ -2316,9 +2800,13 @@ static int arm_smmu_setup_irqs(struct
>> arm_smmu_device *smmu)
>>                  * Cavium ThunderX2 implementation doesn't not support
>> unique
>>                  * irq lines. Use single irq line for all the SMMUv3
>> interrupts.
>>                  */
>> -               ret = devm_request_threaded_irq(smmu->dev, irq,
>> +               /*
>> +                * Xen: Does not support threaded irqs, so serialise the
>> setup.
>> +                * This is the same for pris and event interrupt lines on
>> other
>> +                * systems
>> +                */
>> +               ret = devm_request_irq(smmu->dev, irq,
>>                                         arm_smmu_combined_irq_handler,
>> -                                       arm_smmu_combined_irq_thread,
>>                                         IRQF_ONESHOT,
>>                                         "arm-smmu-v3-combined-irq",
smmu);
>>                 if (ret < 0)
>> @@ -2542,8 +3030,14 @@ static int arm_smmu_device_hw_probe(struct
>> arm_smmu_device *smmu)
>>                 smmu->features |= ARM_SMMU_FEAT_STALLS;
>>         }
>>   +/*
>> + * Xen: Block stage 1 translations. By doing this here we do not need to
>> set the
>> + * domain->stage explicitly.
>> + */
>> +#if 0
>>         if (reg & IDR0_S1P)
>>                 smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
>> +#endif
>>         if (reg & IDR0_S2P)
>>                 smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>> @@ -2616,10 +3110,12 @@ static int arm_smmu_device_hw_probe(struct
>> arm_smmu_device *smmu)
>>         if (reg & IDR5_GRAN4K)
>>                 smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
>>   +#if 0 /* Xen: SMMU ops do not have a pgsize_bitmap member for Xen */
>>         if (arm_smmu_ops.pgsize_bitmap == -1UL)
>>                 arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
>>         else
>>                 arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
>> +#endif
>>         /* Output address size */
>>         switch (reg & IDR5_OAS_MASK << IDR5_OAS_SHIFT) {
>> @@ -2680,7 +3176,8 @@ static int arm_smmu_device_acpi_probe(struct
>> platform_device *pdev,
>>         struct device *dev = smmu->dev;
>>         struct acpi_iort_node *node;
>>   -     node = *(struct acpi_iort_node **)dev_get_platdata(dev);
>> +       /* Xen: Modification to get iort_node */
>> +       node = (struct acpi_iort_node *)dev->acpi_node;
>>         /* Retrieve SMMUv3 specific data */
>>         iort_smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
>> @@ -2703,7 +3200,7 @@ static inline int arm_smmu_device_acpi_probe(struct
>> platform_device *pdev,
>>   static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>>                                     struct arm_smmu_device *smmu)
>>   {
>> -       struct device *dev = &pdev->dev;
>> +       struct device *dev = pdev;
>>         u32 cells;
>>         int ret = -EINVAL;
>>   @@ -2716,6 +3213,7 @@ static int arm_smmu_device_dt_probe(struct
>> platform_device *pdev,
>>         parse_driver_options(smmu);
>>   +     /* Xen: of_dma_is_coherent is a stub till dt support is
introduced
>> */
>>         if (of_dma_is_coherent(dev->of_node))
>>                 smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>>   @@ -2734,9 +3232,11 @@ static int arm_smmu_device_probe(struct
>> platform_device *pdev)
>>   {
>>         int irq, ret;
>>         struct resource *res;
>> +#if 0 /*Xen: Do not need to setup sysfs */
>>         resource_size_t ioaddr;
>> +#endif
>>         struct arm_smmu_device *smmu;
>> -       struct device *dev = &pdev->dev;
>> +       struct device *dev = pdev;/* Xen: dev is ignored */
>>         bool bypass;
>>         smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>> @@ -2763,7 +3263,9 @@ static int arm_smmu_device_probe(struct
>> platform_device *pdev)
>>                 dev_err(dev, "MMIO region too small (%pr)\n", res);
>>                 return -EINVAL;
>>         }
>> +#if 0 /*Xen: Do not need to setup sysfs */
>>         ioaddr = res->start;
>> +#endif
>>         smmu->base = devm_ioremap_resource(dev, res);
>>         if (IS_ERR(smmu->base))
>> @@ -2802,13 +3304,18 @@ static int arm_smmu_device_probe(struct
>> platform_device *pdev)
>>                 return ret;
>>         /* Record our private device structure */
>> +       /* Xen: SMMU is not treated a a platform device*/
>> +#if 0
>>         platform_set_drvdata(pdev, smmu);
>> +#endif
>>         /* Reset the device */
>>         ret = arm_smmu_device_reset(smmu, bypass);
>>         if (ret)
>>                 return ret;
>>   +/* Xen: Not creating an IOMMU device list for Xen */
>> +#if 0
>>         /* And we're up. Go go go! */
>>         ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>>                                      "smmu3.%pa", &ioaddr);
>> @@ -2844,9 +3351,20 @@ static int arm_smmu_device_probe(struct
>> platform_device *pdev)
>>                 if (ret)
>>                         return ret;
>>         }
>> +#endif
>> +       /*
>> +        * Xen: Keep a list of all probed devices. This will be used to
>> query
>> +        * the smmu devices based on the fwnode.
>> +        */
>> +       INIT_LIST_HEAD(&smmu->devices);
>> +       spin_lock(&arm_smmu_devices_lock);
>> +       list_add(&smmu->devices, &arm_smmu_devices);
>> +       spin_unlock(&arm_smmu_devices_lock);
>>         return 0;
>>   }
>>   +/* Xen: Unused function */
>> +#if 0
>>   static int arm_smmu_device_remove(struct platform_device *pdev)
>>   {
>>         struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
>> @@ -2860,6 +3378,8 @@ static void arm_smmu_device_shutdown(struct
>> platform_device *pdev)
>>   {
>>         arm_smmu_device_remove(pdev);
>>   }
>> +#endif
>> +
>>     static const struct of_device_id arm_smmu_of_match[] = {
>>         { .compatible = "arm,smmu-v3", },
>> @@ -2867,6 +3387,7 @@ static const struct of_device_id
arm_smmu_of_match[]
>> = {
>>   };
>>   MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
>>   +#if 0
>>   static struct platform_driver arm_smmu_driver = {
>>         .driver = {
>>                 .name           = "arm-smmu-v3",
>> @@ -2883,3 +3404,316 @@ IOMMU_OF_DECLARE(arm_smmuv3, "arm,smmu-v3",
NULL);
>>   MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3
>> implementations");
>>   MODULE_AUTHOR("Will Deacon <will.deacon@arm.com>");
>>   MODULE_LICENSE("GPL v2");
>> +#endif
>> +
>> +/***** Start of Xen specific code *****/
>> +
>> +static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>> +{
>> +       struct arm_smmu_xen_domain *smmu_domain =
dom_iommu(d)->arch.priv;
>> +       struct iommu_domain *cfg;
>> +
>> +       spin_lock(&smmu_domain->lock);
>> +       list_for_each_entry(cfg, &smmu_domain->contexts, list) {
>> +               /*
>> +                * Only invalidate the context when SMMU is present.
>> +                * This is because the context initialization is delayed
>> +                * until a master has been added.
>> +                */
>> +               if (unlikely(!ACCESS_ONCE(cfg->priv->smmu)))
>> +                       continue;
>> +               arm_smmu_tlb_inv_context(cfg->priv);
>> +       }
>> +       spin_unlock(&smmu_domain->lock);
>> +       return 0;
>> +}
>> +
>> +static int __must_check arm_smmu_iotlb_flush(struct domain *d,
>> +                                            unsigned long gfn,
>> +                                            unsigned int page_count)
>> +{
>> +       return arm_smmu_iotlb_flush_all(d);
>> +}
>> +
>> +static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>> +                                               struct device *dev)
>> +{
>> +       struct iommu_domain *domain;
>> +       struct arm_smmu_xen_domain *xen_domain;
>> +       struct arm_smmu_device *smmu;
>> +       struct arm_smmu_domain *smmu_domain;
>> +
>> +       xen_domain = dom_iommu(d)->arch.priv;
>> +
>> +       smmu = arm_smmu_get_by_fwnode(dev->iommu_fwspec->iommu_fwnode);
>> +       if (!smmu)
>> +               return NULL;
>> +
>> +       /*
>> +        * Loop through the &xen_domain->contexts to locate a context
>> +        * assigned to this SMMU
>> +        */
>> +       list_for_each_entry(domain, &xen_domain->contexts, list) {
>> +               smmu_domain = to_smmu_domain(domain);
>> +               if (smmu_domain->smmu == smmu)
>> +                       return domain;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *domain)
>> +{
>> +       list_del(&domain->list);
>> +       arm_smmu_domain_free(domain);
>> +}
>> +
>> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>> +                              struct device *dev, u32 flag)
>> +{
>> +       int ret = 0;
>> +       struct iommu_domain *domain;
>> +       struct arm_smmu_xen_domain *xen_domain;
>> +       struct arm_smmu_domain *arm_smmu;
>> +
>> +       xen_domain = dom_iommu(d)->arch.priv;
>> +
>> +       if (!dev->archdata.iommu) {
>> +               dev->archdata.iommu = xzalloc(struct
arm_smmu_xen_device);
>> +               if (!dev->archdata.iommu)
>> +                       return -ENOMEM;
>> +       }
>> +
>> +       ret = arm_smmu_add_device(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       spin_lock(&xen_domain->lock);
>> +
>> +       /*
>> +        * Check to see if an iommu_domain already exists for this xen
>> domain
>> +        * under the same SMMU
>> +        */
>> +       domain = arm_smmu_get_domain(d, dev);
>> +       if (!domain) {
>> +
>> +               domain = arm_smmu_domain_alloc(IOMMU_DOMAIN_DMA);
>> +               if (!domain) {
>> +                       ret = -ENOMEM;
>> +                       goto out;
>> +               }
>> +
>> +               arm_smmu = to_smmu_domain(domain);
>> +               arm_smmu->s2_cfg.domain = d;
>> +
>> +               /* Chain the new context to the domain */
>> +               list_add(&domain->list, &xen_domain->contexts);
>> +
>> +       }
>> +
>> +       ret = arm_smmu_attach_dev(domain, dev);
>> +       if (ret) {
>> +               if (domain->ref.counter == 0)
>> +                       arm_smmu_destroy_iommu_domain(domain);
>> +       } else {
>> +               atomic_inc(&domain->ref);
>> +       }
>> +
>> +out:
>> +       spin_unlock(&xen_domain->lock);
>> +       return ret;
>> +}
>> +
>> +static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>> +{
>> +       struct iommu_domain *domain = arm_smmu_get_domain(d, dev);
>> +       struct arm_smmu_xen_domain *xen_domain;
>> +       struct arm_smmu_domain *arm_smmu = to_smmu_domain(domain);
>> +
>> +       xen_domain = dom_iommu(d)->arch.priv;
>> +
>> +       if (!arm_smmu || arm_smmu->s2_cfg.domain != d) {
>> +               dev_err(dev, " not attached to domain %d\n",
>> d->domain_id);
>> +               return -ESRCH;
>> +       }
>> +
>> +       spin_lock(&xen_domain->lock);
>> +
>> +       arm_smmu_detach_dev(dev);
>> +       atomic_dec(&domain->ref);
>> +
>> +       if (domain->ref.counter == 0)
>> +               arm_smmu_destroy_iommu_domain(domain);
>> +
>> +       spin_unlock(&xen_domain->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>> +                                u8 devfn,  struct device *dev)
>> +{
>> +       int ret = 0;
>> +
>> +       /* Don't allow remapping on other domain than hwdom */
>> +       if (t && t != hardware_domain)
>> +               return -EPERM;
>> +
>> +       if (t == s)
>> +               return 0;
>> +
>> +       ret = arm_smmu_deassign_dev(s, dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (t) {
>> +               /* No flags are defined for ARM. */
>> +               ret = arm_smmu_assign_dev(t, devfn, dev, 0);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int arm_smmu_iommu_domain_init(struct domain *d)
>> +{
>> +       struct arm_smmu_xen_domain *xen_domain;
>> +
>> +       xen_domain = xzalloc(struct arm_smmu_xen_domain);
>> +       if (!xen_domain)
>> +               return -ENOMEM;
>> +
>> +       spin_lock_init(&xen_domain->lock);
>> +       INIT_LIST_HEAD(&xen_domain->contexts);
>> +
>> +       dom_iommu(d)->arch.priv = xen_domain;
>> +
>> +       return 0;
>> +}
>> +
>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>> +{
>> +}
>> +
>> +static void arm_smmu_iommu_domain_teardown(struct domain *d)
>> +{
>> +       struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>> +
>> +       ASSERT(list_empty(&xen_domain->contexts));
>> +       xfree(xen_domain);
>> +}
>> +
>> +static int __must_check arm_smmu_map_page(struct domain *d, unsigned
long
>> gfn,
>> +                       unsigned long mfn, unsigned int flags)
>> +{
>> +       p2m_type_t t;
>> +
>> +       /*
>> +        * Grant mappings can be used for DMA requests. The dev_bus_addr
>> +        * returned by the hypercall is the MFN (not the IPA). For device
>> +        * protected by an IOMMU, Xen needs to add a 1:1 mapping in the
>> domain
>> +        * p2m to allow DMA request to work.
>> +        * This is only valid when the domain is directed mapped. Hence
>> this
>> +        * function should only be used by gnttab code with gfn == mfn.
>> +        */
>> +       BUG_ON(!is_domain_direct_mapped(d));
>> +       BUG_ON(mfn != gfn);
>> +
>> +       /* We only support readable and writable flags */
>> +       if (!(flags & (IOMMUF_readable | IOMMUF_writable)))
>> +               return -EINVAL;
>> +
>> +       t = (flags & IOMMUF_writable) ? p2m_iommu_map_rw :
>> p2m_iommu_map_ro;
>> +
>> +       /*
>> +        * The function guest_physmap_add_entry replaces the current
>> mapping
>> +        * if there is already one...
>> +        */
>> +       return guest_physmap_add_entry(d, _gfn(gfn), _mfn(mfn), 0, t);
>> +}
>> +
>> +static int __must_check arm_smmu_unmap_page(struct domain *d, unsigned
>> long gfn)
>> +{
>> +       /*
>> +        * This function should only be used by gnttab code when the
>> domain
>> +        * is direct mapped
>> +        */
>> +       if (!is_domain_direct_mapped(d))
>> +               return -EINVAL;
>> +
>> +       return guest_physmap_remove_page(d, _gfn(gfn), _mfn(gfn), 0);
>> +}
>> +
>> +static const struct iommu_ops arm_smmu_iommu_ops = {
>> +       .init = arm_smmu_iommu_domain_init,
>> +       .hwdom_init = arm_smmu_iommu_hwdom_init,
>> +       .teardown = arm_smmu_iommu_domain_teardown,
>> +       .iotlb_flush = arm_smmu_iotlb_flush,
>> +       .iotlb_flush_all = arm_smmu_iotlb_flush_all,
>> +       .assign_device = arm_smmu_assign_dev,
>> +       .reassign_device = arm_smmu_reassign_dev,
>> +       .map_page = arm_smmu_map_page,
>> +       .unmap_page = arm_smmu_unmap_page,
>> +};
>> +
>> +static
>> +struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle
>> *fwnode)
>> +{
>> +       struct arm_smmu_device *smmu = NULL;
>> +
>> +       spin_lock(&arm_smmu_devices_lock);
>> +       list_for_each_entry(smmu, &arm_smmu_devices, devices) {
>> +               if (smmu->dev->fwnode == fwnode)
>> +                       break;
>> +       }
>> +       spin_unlock(&arm_smmu_devices_lock);
>> +
>> +       return smmu;
>> +}
>> +
>> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>> +                                  const void *data)
>> +{
>> +       int rc;
>> +
>> +       /*
>> +        * Even if the device can't be initialized, we don't want to
>> +        * give the SMMU device to dom0.
>> +        */
>> +       dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +       rc = arm_smmu_device_probe(dt_to_dev(dev));
>> +       if (rc)
>> +               return rc;
>> +
>> +       iommu_set_ops(&arm_smmu_iommu_ops);
>> +
>> +       return 0;
>> +}
>> +
>> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
>> +       .dt_match = arm_smmu_of_match,
>> +       .init = arm_smmu_dt_init,
>> +DT_DEVICE_END
>> +
>> +#ifdef CONFIG_ACPI
>> +/* Set up the IOMMU */
>> +static int __init arm_smmu_acpi_init(const void *data)
>> +{
>> +       int rc;
>> +
>> +       rc = arm_smmu_device_probe((struct device *)data);
>> +       if (rc)
>> +               return rc;
>> +
>> +       iommu_set_ops(&arm_smmu_iommu_ops);
>> +       return 0;
>> +}
>> +
>> +ACPI_DEVICE_START(asmmuv3, "ARM SMMU V3", DEVICE_IOMMU)
>> +       .class_type = ACPI_IORT_NODE_SMMU_V3,
>> +       .init = arm_smmu_acpi_init,
>> +ACPI_DEVICE_END
>> +
>> +#endif
>> diff --git a/xen/include/xen/linux_compat.h
>> b/xen/include/xen/linux_compat.h
>> new file mode 100644
>> index 0000000000..8037be0a3e
>> --- /dev/null
>> +++ b/xen/include/xen/linux_compat.h
>> @@ -0,0 +1,84 @@
>>
>>
+/******************************************************************************
>> + * include/xen/linux_compat.h
>> + *
>> + * Compatibility defines for porting code from Linux to Xen
>> + *
>> + * Copyright (c) 2017 Linaro Limited
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __XEN_LINUX_COMPAT_H__
>> +#define __XEN_LINUX_COMPAT_H__
>> +
>> +#include <asm/types.h>
>> +
>> +typedef paddr_t phys_addr_t;
>> +typedef paddr_t dma_addr_t;
>> +
>> +typedef unsigned int gfp_t;
>> +#define GFP_KERNEL 0
>> +#define __GFP_ZERO 0x01U
>> +
>> +/* Helpers for IRQ functions */
>> +#define free_irq release_irq
>> +
>> +enum irqreturn {
>> +    IRQ_NONE,
>> +    IRQ_HANDLED,
>> +    IRQ_WAKE_THREAD,
>> +};
>> +
>> +typedef enum irqreturn irqreturn_t;
>> +
>> +/* Device logger functions */
>> +#define dev_dbg(dev, fmt, ...) printk(XENLOG_DEBUG fmt, ## __VA_ARGS__)
>> +#define dev_notice(dev, fmt, ...) printk(XENLOG_INFO fmt, ##
__VA_ARGS__)
>> +#define dev_warn(dev, fmt, ...) printk(XENLOG_WARNING fmt, ##
>> __VA_ARGS__)
>> +#define dev_err(dev, fmt, ...) printk(XENLOG_ERR fmt, ## __VA_ARGS__)
>> +#define dev_info(dev, fmt, ...) printk(XENLOG_INFO fmt, ## __VA_ARGS__)
>> +
>> +#define dev_err_ratelimited(dev, fmt, ...)                  \
>> +     printk(XENLOG_ERR fmt, ## __VA_ARGS__)
>> +
>> +#define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
>> +
>> +/* Alias to Xen allocation helpers */
>> +#define kfree xfree
>> +#define kmalloc(size, flags) ({\
>> +       void *__ret_alloc = NULL; \
>> +       if (flags & __GFP_ZERO) \
>> +               __ret_alloc = _xzalloc(size, sizeof(void *)); \
>> +       else \
>> +               __ret_alloc = _xmalloc(size, sizeof(void *)); \
>> +       __ret_alloc; \
>> +})
>> +#define kzalloc(size, flags)        _xzalloc(size, sizeof(void *))
>> +#define devm_kzalloc(dev, size, flags)  _xzalloc(size, sizeof(void *))
>> +#define kmalloc_array(size, n, flags) ({\
>> +       void *__ret_alloc = NULL; \
>> +       if (flags & __GFP_ZERO) \
>> +               __ret_alloc = _xzalloc_array(size, sizeof(void *), n); \
>> +       else \
>> +               __ret_alloc = _xmalloc_array(size, sizeof(void *), n); \
>> +       __ret_alloc; \
>> +})
>> +
>> +/* Alias to Xen time functions */
>> +#define ktime_t s_time_t
>> +#define ktime_get()             (NOW())
>> +#define ktime_add_us(t,i)       (t + MICROSECS(i))
>> +#define ktime_compare(t,i)      (t > (i))
>> +
>> +#endif /* __XEN_LINUX_COMPAT_H__ */
>
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a11452256e3807405672ed983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 10 March 2018 at 23:23, Manish Jaggi &lt;<a hre=
f=3D"mailto:mjaggi@caviumnetworks.com">mjaggi@caviumnetworks.com</a>&gt; wr=
ote:<br>&gt; Hi Sameer,<br>&gt;<br>&gt;<br>&gt;<br>&gt; On 02/09/2018 08:40=
 AM, Sameer Goel wrote:<br>&gt;&gt;<br>&gt;&gt; This driver follows an appr=
oach similar to smmu driver. The intent here<br>&gt;&gt; is to reuse as muc=
h Linux code as possible.<br>&gt;&gt; - Glue code has been introduced to br=
idge the API calls.<br>&gt;&gt; - Called Linux functions from the Xen IOMMU=
 function calls.<br>&gt;&gt; - Xen modifications are preceded by /*Xen: com=
ment */<br>&gt;&gt; - xen/linux_compat: Add a Linux compat header<br>&gt;&g=
t; =C2=A0 =C2=A0For porting files directly from Linux it is useful to have =
a function<br>&gt;&gt; mapping<br>&gt;&gt; =C2=A0 =C2=A0definitions from Li=
nux to Xen. This file adds common API functions and<br>&gt;&gt; =C2=A0 =C2=
=A0other defines that are needed for porting arm SMMU drivers.<br>&gt;&gt;<=
br>&gt;&gt; Signed-off-by: Sameer Goel &lt;<a href=3D"mailto:sameer.goel@li=
naro.org">sameer.goel@linaro.org</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0=
 xen/arch/arm/p2m.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;&gt; =C2=A0 xen/drivers/Kconfig =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +<br>&gt=
;&gt; =C2=A0 xen/drivers/passthrough/arm/Kconfig =C2=A0 | =C2=A0 8 +<br>&gt=
;&gt; =C2=A0 xen/drivers/passthrough/arm/Makefile =C2=A0| =C2=A0 1 +<br>&gt=
;&gt; =C2=A0 xen/drivers/passthrough/arm/smmu-v3.c | 892<br>&gt;&gt; ++++++=
++++++++++++++++++++++++++--<br>&gt;&gt; =C2=A0 xen/include/xen/linux_compa=
t.h =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A084 ++++<br>&gt;&gt; =C2=A0 6 files c=
hanged, 959 insertions(+), 29 deletions(-)<br>&gt;&gt; =C2=A0 create mode 1=
00644 xen/drivers/passthrough/arm/Kconfig<br>&gt;&gt; =C2=A0 create mode 10=
0644 xen/include/xen/linux_compat.h<br>&gt;&gt;<br>&gt;&gt; diff --git a/xe=
n/arch/arm/p2m.c b/xen/arch/arm/p2m.c<br>&gt;&gt; index 65e8b9c6ea..fef7605=
fd6 100644<br>&gt;&gt; --- a/xen/arch/arm/p2m.c<br>&gt;&gt; +++ b/xen/arch/=
arm/p2m.c<br>&gt;&gt; @@ -1460,6 +1460,7 @@ err:<br>&gt;&gt; =C2=A0 static =
void __init setup_virt_paging_one(void *data)<br>&gt;&gt; =C2=A0 {<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 unsigned long val =3D (unsigned long)data;<br>&gt;=
&gt; + =C2=A0 =C2=A0/* SMMUv3 S2 cfg vtcr reuses the following value */<br>=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 WRITE_SYSREG32(val, VTCR_EL2);<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 isb();<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; diff --git a/x=
en/drivers/Kconfig b/xen/drivers/Kconfig<br>&gt;&gt; index bc3a54f0ea..6126=
55386d 100644<br>&gt;&gt; --- a/xen/drivers/Kconfig<br>&gt;&gt; +++ b/xen/d=
rivers/Kconfig<br>&gt;&gt; @@ -12,4 +12,6 @@ source &quot;drivers/pci/Kconf=
ig&quot;<br>&gt;&gt; =C2=A0 =C2=A0 source &quot;drivers/video/Kconfig&quot;=
<br>&gt;&gt; =C2=A0 +source &quot;drivers/passthrough/arm/Kconfig&quot;<br>=
&gt;&gt; +<br>&gt;&gt; =C2=A0 endmenu<br>&gt;&gt; diff --git a/xen/drivers/=
passthrough/arm/Kconfig<br>&gt;&gt; b/xen/drivers/passthrough/arm/Kconfig<b=
r>&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000000..cda899f608<br=
>&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b/xen/drivers/passthrough/arm/Kconf=
ig<br>&gt;&gt; @@ -0,0 +1,8 @@<br>&gt;&gt; +<br>&gt;&gt; +config ARM_SMMU_v=
3<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;ARM SMMUv3 Support&quot;<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 depends on ARM_64<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 help<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for implem=
entations of the ARM System MMU architecture<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0version 3.<br>&gt;&gt; +<br>&gt;&gt; diff --git a/xen/drivers/=
passthrough/arm/Makefile<br>&gt;&gt; b/xen/drivers/passthrough/arm/Makefile=
<br>&gt;&gt; index f4cd26e15d..e14732b55c 100644<br>&gt;&gt; --- a/xen/driv=
ers/passthrough/arm/Makefile<br>&gt;&gt; +++ b/xen/drivers/passthrough/arm/=
Makefile<br>&gt;&gt; @@ -1,2 +1,3 @@<br>&gt;&gt; =C2=A0 obj-y +=3D iommu.o<=
br>&gt;&gt; =C2=A0 obj-y +=3D smmu.o<br>&gt;&gt; +obj-$(CONFIG_ARM_SMMU_v3)=
 +=3D smmu-v3.o<br>&gt;&gt; diff --git a/xen/drivers/passthrough/arm/smmu-v=
3.c<br>&gt;&gt; b/xen/drivers/passthrough/arm/smmu-v3.c<br>&gt;&gt; index e=
67ba6c40f..f43485fe6e 100644<br>&gt;&gt; --- a/xen/drivers/passthrough/arm/=
smmu-v3.c<br>&gt;&gt; +++ b/xen/drivers/passthrough/arm/smmu-v3.c<br>&gt;&g=
t; @@ -18,28 +18,414 @@<br>&gt;&gt; =C2=A0 =C2=A0* Author: Will Deacon &lt;=
<a href=3D"mailto:will.deacon@arm.com">will.deacon@arm.com</a>&gt;<br>&gt;&=
gt; =C2=A0 =C2=A0*<br>&gt;&gt; =C2=A0 =C2=A0* This driver is powered by bad=
 coffee and bombay mix.<br>&gt;&gt; + *<br>&gt;&gt; + *<br>&gt;&gt; + * Bas=
ed on Linux drivers/iommu/arm-smmu-v3.c<br>&gt;&gt; + * =3D&gt; commit 7aa8=
619a66aea52b145e04cbab4f8d6a4e5f3f3b<br>&gt;&gt; + *<br>&gt;&gt; + * Xen mo=
difications:<br>&gt;&gt; + * Sameer Goel &lt;<a href=3D"mailto:sameer.goel@=
linaro.org">sameer.goel@linaro.org</a>&gt;<br>&gt;&gt; + * Copyright (C) 20=
17, The Linux Foundation, All rights reserved.<br>&gt;&gt; + *<br>&gt;&gt; =
+ */<br>&gt;&gt; +<br>&gt;&gt; +#include &lt;xen/acpi.h&gt;<br>&gt;&gt; +#i=
nclude &lt;xen/config.h&gt;<br>&gt;&gt; +#include &lt;xen/delay.h&gt;<br>&g=
t;&gt; +#include &lt;xen/errno.h&gt;<br>&gt;&gt; +#include &lt;xen/err.h&gt=
;<br>&gt;&gt; +#include &lt;xen/irq.h&gt;<br>&gt;&gt; +#include &lt;xen/lib=
.h&gt;<br>&gt;&gt; +#include &lt;xen/linux_compat.h&gt;<br>&gt;&gt; +#inclu=
de &lt;xen/list.h&gt;<br>&gt;&gt; +#include &lt;xen/mm.h&gt;<br>&gt;&gt; +#=
include &lt;xen/rbtree.h&gt;<br>&gt;&gt; +#include &lt;xen/sched.h&gt;<br>&=
gt;&gt; +#include &lt;xen/sizes.h&gt;<br>&gt;&gt; +#include &lt;xen/vmap.h&=
gt;<br>&gt;&gt; +#include &lt;acpi/acpi_iort.h&gt;<br>&gt;&gt; +#include &l=
t;asm/atomic.h&gt;<br>&gt;&gt; +#include &lt;asm/device.h&gt;<br>&gt;&gt; +=
#include &lt;asm/io.h&gt;<br>&gt;&gt; +#include &lt;asm/platform.h&gt;<br>&=
gt;&gt; +<br>&gt;&gt; +/* Alias to Xen device tree helpers */<br>&gt;&gt; +=
#define device_node dt_device_node<br>&gt;&gt; +#define of_phandle_args dt_=
phandle_args<br>&gt;&gt; +#define of_device_id dt_device_match<br>&gt;&gt; =
+#define of_match_node dt_match_node<br>&gt;&gt; +#define of_property_read_=
u32(np, pname, out) (!dt_property_read_u32(np,<br>&gt;&gt; pname, out))<br>=
&gt;&gt; +#define of_property_read_bool dt_property_read_bool<br>&gt;&gt; +=
#define of_parse_phandle_with_args dt_parse_phandle_with_args<br>&gt;&gt; +=
<br>&gt;&gt; +/* Xen: Helpers to get device MMIO and IRQs */<br>&gt;&gt; +s=
truct resource {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 u64 addr;<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 u64 size;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned=
 int type;<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +#define resource_size=
(res) ((res)-&gt;size)<br>&gt;&gt; +<br>&gt;&gt; +#define platform_device d=
evice<br>&gt;&gt; +<br>&gt;&gt; +#define IORESOURCE_MEM 0<br>&gt;&gt; +#def=
ine IORESOURCE_IRQ 1<br>&gt;&gt; +<br>&gt;&gt; +static struct resource *pla=
tform_get_resource(struct platform_device<br>&gt;&gt; *pdev,<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unsigned int type,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int num)<br>&gt;&gt;=
 +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* The resource is only used between 2 calls of<br>&gt;&gt; platfo=
rm_get_resource.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* It&#39;s quite =
ugly but it&#39;s avoid to add too much code in the part<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* imported from Linux<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 static struct resource r=
es;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct acpi_iort_node *iort_node;<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct acpi_iort_smmu_v3 *node_smmu_data;<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>&gt;&gt; +<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 res.type =3D type;<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 switch (type) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 case I=
ORESOURCE_MEM:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (pdev-&gt;type =3D=3D DEV_ACPI) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 iort_node =3D pdev-&gt;acpi_node;<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_smmu_da=
ta =3D<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct acpi_iort_smmu=
_v3<br>&gt;&gt; *)iort_node-&gt;node_data;<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (node_smmu_data !=3D NULL) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 res.addr =3D node_smmu_data-&gt;base_address;<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 res.size =3D SZ_128K;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret =3D 0;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dt_device_=
get_address(dev_to_dt(pdev), num,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;res.addr, &amp;res.size);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 return ((ret) ? NULL : &amp;res);<br>&gt;&gt; +<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 case IORESOURCE_IRQ:<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ACPI case not implemented as ther=
e is no use case for<br>&gt;&gt; it */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D platform_get_irq(dev_to_dt(pdev), num);=
<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>&gt;&gt; +<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res.addr =3D ret;<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res.size =3D 1;<br=
>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return &amp;res;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 default:<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&=
gt; +static int platform_get_irq_byname(struct platform_device *pdev, const=
<br>&gt;&gt; char *name)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
const struct dt_property *dtprop;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct=
 acpi_iort_node *iort_node;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct acpi_=
iort_smmu_v3 *node_smmu_data;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int ret =
=3D 0;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (pdev-&gt;type =
=3D=3D DEV_ACPI) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 iort_node =3D pdev-&gt;acpi_node;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_smmu_data =3D (struct acpi_iort_smmu_v3<b=
r>&gt;&gt; *)iort_node-&gt;node_data;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node_smmu_data !=3D NULL) {<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (!strcmp(name, &quot;eventq&quot;))<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D node_smmu_data-&gt;event_gsiv;<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else if (!strcmp(name, &quot;priq&quot;))<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ret =3D node_smmu_data-&gt;pri_gsiv;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
lse if (!strcmp(name, &quot;cmdq-sync&quot;))<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ret =3D node_smmu_data-&gt;sync_gsiv;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
lse if (!strcmp(name, &quot;gerror&quot;))<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret =3D node_smmu_data-&gt;gerr_gsiv;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 } else {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dtprop =3D dt_find_property(dev_to_dt(pdev),<br>&gt;&gt; &quot;i=
nterrupt-names&quot;, NULL);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (!dtprop)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>&gt;&gt=
; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dtp=
rop-&gt;value)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODATA;<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return ret;<b=
r>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +/*<br>&gt;&gt; + * Xen: Helpers fo=
r DMA allocation. Just the function name is reused for<br>&gt;&gt; + * port=
ing code these allocation are not managed allocations<br>&gt;&gt; =C2=A0 =
=C2=A0*/<br>&gt;&gt; =C2=A0 -#include &lt;linux/acpi.h&gt;<br>&gt;&gt; -#in=
clude &lt;linux/acpi_iort.h&gt;<br>&gt;&gt; -#include &lt;linux/delay.h&gt;=
<br>&gt;&gt; -#include &lt;linux/dma-iommu.h&gt;<br>&gt;&gt; -#include &lt;=
linux/err.h&gt;<br>&gt;&gt; -#include &lt;linux/interrupt.h&gt;<br>&gt;&gt;=
 -#include &lt;linux/iommu.h&gt;<br>&gt;&gt; -#include &lt;linux/iopoll.h&g=
t;<br>&gt;&gt; -#include &lt;linux/module.h&gt;<br>&gt;&gt; -#include &lt;l=
inux/msi.h&gt;<br>&gt;&gt; -#include &lt;linux/of.h&gt;<br>&gt;&gt; -#inclu=
de &lt;linux/of_address.h&gt;<br>&gt;&gt; -#include &lt;linux/of_iommu.h&gt=
;<br>&gt;&gt; -#include &lt;linux/of_platform.h&gt;<br>&gt;&gt; -#include &=
lt;linux/pci.h&gt;<br>&gt;&gt; -#include &lt;linux/platform_device.h&gt;<br=
>&gt;&gt; -<br>&gt;&gt; -#include &lt;linux/amba/bus.h&gt;<br>&gt;&gt; -<br=
>&gt;&gt; -#include &quot;io-pgtable.h&quot;<br>&gt;&gt; +static void *dmam=
_alloc_coherent(struct device *dev, size_t size,<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dma_addr_t *dma_handle, gfp_t gfp)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 void *vaddr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned =
long alignment =3D size;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /=
*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* _xzalloc requires that the (al=
ign &amp; (align -1)) =3D 0. Most of<br>&gt;&gt; the<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* allocations in SMMU code should send the right value =
for size.<br>&gt;&gt; In<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* case th=
is is not true print a warning and align to the size of<br>&gt;&gt; a<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* (void *)<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (size &amp; (size - 1=
)) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_war=
n(dev, &quot;Fixing alignment for the DMA buffer\n&quot;);<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alignment =3D sizeof(void =
*);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 vaddr =3D _xzalloc(size, alignment);<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 if (!vaddr) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;DMA allocation failed\n&quot;);<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 *dma_handle =3D virt_to_maddr(vaddr);<br>&gt;&gt; +<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 return vaddr;<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt;=
 +<br>&gt;&gt; +static void dmam_free_coherent(struct device *dev, size_t s=
ize, void<br>&gt;&gt; *vaddr,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t dma_handle)<br>&gt=
;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 xfree(vaddr);<br>&gt;&gt; +}<br=
>&gt;&gt; +<br>&gt;&gt; +/* Xen: Stub out DMA domain related functions */<b=
r>&gt;&gt; +#define iommu_get_dma_cookie(dom) 0<br>&gt;&gt; +#define iommu_=
put_dma_cookie(dom)<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Stub out module para=
m related function */<br>&gt;&gt; +#define module_param_named(a, b, c, d)<b=
r>&gt;&gt; +#define MODULE_PARM_DESC(a, b)<br>&gt;&gt; +<br>&gt;&gt; +#defi=
ne dma_set_mask_and_coherent(d, b) 0<br>&gt;&gt; +<br>&gt;&gt; +#define of_=
dma_is_coherent(n) 0<br>&gt;&gt; +<br>&gt;&gt; +#define MODULE_DEVICE_TABLE=
(type, name)<br>&gt;&gt; +<br>&gt;&gt; +static void __iomem *devm_ioremap_r=
esource(struct device *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res)<br>&gt;&gt; =
+{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 void __iomem *ptr;<br>&gt;&gt; +<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (!res || res-&gt;type !=3D IORESOURCE_MEM=
) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(=
dev, &quot;Invalid resource\n&quot;);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-EINVAL);<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ptr =3D io=
remap_nocache(res-&gt;addr, res-&gt;size);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 if (!ptr) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_err(dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ioremap failed (addr 0x%&quot;PRIx=
64&quot; size<br>&gt;&gt; 0x%&quot;PRIx64&quot;)\n&quot;,<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
es-&gt;addr, res-&gt;size);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENOMEM);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return ptr;<br>&gt;&=
gt; +}<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Compatibility define for iommu_do=
main_geometry.*/<br>&gt;&gt; +struct iommu_domain_geometry {<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 dma_addr_t aperture_start; /* First address that can b=
e mapped =C2=A0<br>&gt;&gt; */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 dma_addr_=
t aperture_end; =C2=A0 /* Last address that can be mapped =C2=A0 =C2=A0<br>=
&gt;&gt; */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 bool force_aperture; =C2=A0 =
=C2=A0 =C2=A0 /* DMA only allowed in mappable range?<br>&gt;&gt; */<br>&gt;=
&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Type definitions =
for iommu_domain */<br>&gt;&gt; +#define IOMMU_DOMAIN_UNMANAGED 0<br>&gt;&g=
t; +#define IOMMU_DOMAIN_DMA 1<br>&gt;&gt; +#define IOMMU_DOMAIN_IDENTITY 2=
<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Dummy iommu_domain */<br>&gt;&gt; +stru=
ct iommu_domain {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* Runtime SMMU config=
uration for this iommu_domain */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct =
arm_smmu_domain =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*priv;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 unsigned int type;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 /* Dummy compatibility defines */<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 unsigned long pgsize_bitmap;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 stru=
ct iommu_domain_geometry geometry;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 atomic_t ref;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0* Used to link iommu_domain contexts for a sam=
e domain.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* There is at least one =
per-SMMU to used by the domain.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct list_head =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list;<br>&gt;&gt; +};<br>&gt;&gt; +<br>&g=
t;&gt; +/* Xen: Describes information required for a Xen domain */<br>&gt;&=
gt; +struct arm_smmu_xen_domain {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spinlo=
ck_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0lock;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* List of iommu domains ass=
ociated to this domain */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct list_he=
ad =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contexts;<br>&gt;=
&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +/*<br>&gt;&gt; + * Xen: Information abo=
ut each device stored in dev-&gt;archdata.iommu<br>&gt;&gt; + *<br>&gt;&gt;=
 + * The dev-&gt;archdata.iommu stores the iommu_domain (runtime configurat=
ion<br>&gt;&gt; of<br>&gt;&gt; + * the SMMU).<br>&gt;&gt; + */<br>&gt;&gt; =
+struct arm_smmu_xen_device {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct iom=
mu_domain *domain;<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +/*<br>&gt;&gt=
; + * Xen: io_pgtable compatibility defines.<br>&gt;&gt; + * Most of these =
are to port in the S1 translation code as is.<br>&gt;&gt; + */<br>&gt;&gt; =
+struct io_pgtable_ops {<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +struct =
iommu_gather_ops {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 void (*tlb_flush_all)=
(void *cookie);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 void (*tlb_add_flush)(un=
signed long iova, size_t size, size_t<br>&gt;&gt; granule,<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool leaf, void *cookie);<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 void (*tlb_sync)(void *cookie);<br>&gt;&gt; +};<br>&gt;&gt; +<br=
>&gt;&gt; +struct io_pgtable_cfg {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* IO_PGTABLE_QUIRK_ARM_NS: (ARM form=
ats) Set NS and NSTABLE bits<br>&gt;&gt; in<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0stage 1 PTEs, for hardware which insists on=
 validating<br>&gt;&gt; them<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=
=A0 =C2=A0 =C2=A0even in non-secure state where they should normally be<br>=
&gt;&gt; ignored.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* IO_PGTABLE_QUIRK_NO_PERMS: Ignore the IOMMU_RE=
AD, IOMMU_WRITE<br>&gt;&gt; and<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =
=C2=A0 =C2=A0 =C2=A0IOMMU_NOEXEC flags and map everything with full access,=
<br>&gt;&gt; for<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =
=C2=A0hardware which does not implement the permissions of a<br>&gt;&gt; gi=
ven<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0format, =
and/or requires some format-specific default<br>&gt;&gt; value.<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =
IO_PGTABLE_QUIRK_TLBI_ON_MAP: If the format forbids caching<br>&gt;&gt; inv=
alid<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0(unmapp=
ed) entries but the hardware might do so anyway,<br>&gt;&gt; perform<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0TLB maintenance wh=
en mapping as well as when unmapping.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* IO_PGTABLE_QUIRK_ARM_MTK=
_4GB: (ARM v7s format) Set bit 9 in all<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* =C2=A0 =C2=A0 =C2=A0PTEs, for Mediatek IOMMUs which treat it as a 3=
3rd address<br>&gt;&gt; bit<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=
=A0 =C2=A0 =C2=A0when the SoC is in &quot;4GB mode&quot; and they can only =
access the<br>&gt;&gt; high<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=
=A0 =C2=A0 =C2=A0remap of DRAM (0x1_00000000 to 0x1_ffffffff).<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* I=
O_PGTABLE_QUIRK_NO_DMA: Guarantees that the tables will only<br>&gt;&gt; ev=
er<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0be access=
ed by a fully cache-coherent IOMMU or CPU (e.g.<br>&gt;&gt; for a<br>&gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0software-emulated IOM=
MU), such that pagetable updates need<br>&gt;&gt; not<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0be treated as explicit DMA data.<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 #define IO_PGTABLE_QUIRK_ARM_NS =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 #define IO_PGTABLE_QUIRK_NO_PERMS =C2=A0 =C2=
=A0 =C2=A0 BIT(1)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 #define IO_PGTABLE_QUI=
RK_TLBI_ON_MAP =C2=A0 =C2=A0BIT(2)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 #defi=
ne IO_PGTABLE_QUIRK_ARM_MTK_4GB =C2=A0 =C2=A0BIT(3)<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 #define IO_PGTABLE_QUIRK_NO_DMA =C2=A0 =C2=A0 =C2=A0 =C2=A0 B=
IT(4)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quirks;<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 pgsize_bitmap;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned in=
t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ias;=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oas;<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 const struct iommu_gather_ops =C2=A0 *tlb;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 struct device =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *iommu_dev;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 /* Low-level data specific to the table format */<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 union {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =C2=A0 =C2=A0 ttbr[2];<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 u64 =C2=A0 =C2=A0 tcr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =C2=A0 =C2=A0 mair[2];<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } arm_lpae_s1_cfg=
;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =C2=A0 =C2=A0 vttbr;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =
=C2=A0 =C2=A0 vtcr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 } arm_lpae_s2_cfg;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 =C2=A0 =C2=A0 t=
tbr[2];<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 u32 =C2=A0 =C2=A0 tcr;<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 =C2=A0 =
=C2=A0 nmrr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 =C2=A0 =C2=A0 prrr;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } arm_v7s_cfg;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 };<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +enum io_pgt=
able_fmt {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ARM_32_LPAE_S1,<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 ARM_32_LPAE_S2,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 AR=
M_64_LPAE_S1,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ARM_64_LPAE_S2,<br>&gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 ARM_V7S,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 IO_PGT=
ABLE_NUM_FMTS,<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +/*<br>&gt;&gt; + =
* Xen: The pgtable_ops are used by the S1 translations, so return the<br>&g=
t;&gt; dummy<br>&gt;&gt; + * address.<br>&gt;&gt; + */<br>&gt;&gt; +#define=
 alloc_io_pgtable_ops(f, c, o) ((struct io_pgtable_ops *)0x0)<br>&gt;<br>&g=
t; Is this correct? it will make the caller null check fail<br>In your earl=
ier patch it was<br><br>#define alloc_io_pgtable_ops(f, c, o) ((struct io_p=
gtable_ops *)0xDEADBEEF)<br><br>&gt;<br>&gt;&gt; +#define free_io_pgtable_o=
ps(o)<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Define wrapper for requesting IRQs=
 */<br>&gt;&gt; +#define IRQF_ONESHOT 0<br>&gt;&gt; +<br>&gt;&gt; +typedef =
void (*irq_handler_t)(int, void *, struct cpu_user_regs *);<br>&gt;&gt; +<b=
r>&gt;&gt; +static inline int devm_request_irq(struct device *dev, unsigned=
 int irq,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_ha=
ndler_t handler, unsigned long<br>&gt;&gt; irqflags,<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *devname, void *dev_id)<br=
>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* SMMUv3 implementation can support wired interrupt output=
s that<br>&gt;&gt; are<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* edge-trig=
gered. Set the irq type as per the spec.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 irq_set_type(irq, IRQ_TYPE_EDG=
E_BOTH);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return request_irq(irq, irqflag=
s, handler, devname, dev_id);<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +/*<=
br>&gt;&gt; + * Xen does not have a concept of threaded irq, but eventually=
 we can use<br>&gt;&gt; + * tasklets to optimize the following function.<br=
>&gt;&gt; + */<br>&gt;&gt; +int devm_request_threaded_irq(struct device *de=
v, unsigned int irq,<br>&gt;&gt; irq_handler_t handler,<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 irq_handler_t thread_fn, unsigned long<br>&gt;&gt; irq=
flags,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devname, void *de=
v_id)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return devm_request=
_irq(dev, irq, thread_fn, irqflags, devname,<br>&gt;&gt; dev_id);<br>&gt;&g=
t; +}<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: The mutex is used only during init=
ialization so the typecast is<br>&gt;&gt; safe */<br>&gt;&gt; +#define mute=
x spinlock<br>&gt;&gt; +#define mutex_init spin_lock_init<br>&gt;&gt; +#def=
ine mutex_lock spin_lock<br>&gt;&gt; +#define mutex_unlock spin_unlock<br>&=
gt;&gt; +<br>&gt;&gt; +#define readx_poll_timeout(op, addr, val, cond, slee=
p_us, timeout_us) \<br>&gt;&gt; +({ \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 s_=
time_t deadline =3D NOW() + MICROSECS(timeout_us); \<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 for (;;) { \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (val) =3D op(addr); \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (cond) \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break; \<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (NOW() &gt; deadline) =
{ \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (val) =3D op(addr); \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break; \<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 udelay(sleep_us); \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 } \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 (cond) ? 0 : -ETIMEDOUT; \<br>&gt;&=
gt; +})<br>&gt;&gt; +<br>&gt;&gt; +#define readl_relaxed_poll_timeout(addr,=
 val, cond, delay_us, timeout_us)<br>&gt;&gt; \<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us,<br>&gt=
;&gt; timeout_us)<br>&gt;&gt; +<br>&gt;&gt; +#define VA_BITS 0 /* Only need=
ed for S1 translations */<br>&gt;&gt; =C2=A0 =C2=A0 /* MMIO registers */<br=
>&gt;&gt; =C2=A0 #define ARM_SMMU_IDR0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x0<br>&gt;&gt; @@ -433,6 +819,7 @@ enum pri_resp {<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 PRI_RESP_SUCC,<br>&gt;&gt; =C2=A0 };<=
br>&gt;&gt; =C2=A0 +#if 0 /* Xen: No MSI support in this iteration */<br>&g=
t;&gt; =C2=A0 enum arm_smmu_msi_index {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 EVTQ_MSI_INDEX,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 GERROR_MSI_I=
NDEX,<br>&gt;&gt; @@ -457,6 +844,7 @@ static phys_addr_t<br>&gt;&gt; arm_sm=
mu_msi_cfg[ARM_SMMU_MAX_MSIS][3] =3D {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM_SMMU_PRIQ_IRQ_CFG2,<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 },<br>&gt;&gt; =C2=A0 };<br>&gt;&gt; +#endif<br>&gt;&g=
t; =C2=A0 =C2=A0 struct arm_smmu_cmdq_ent {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Common fields */<br>&gt;&gt; @@ -561,6 +949,8 @@ struct arm_s=
mmu_s2_cfg {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vmid;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vttbr;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vtcr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* Xen: Domain associated t=
o this configuration */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct domain =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *domain;<br>=
&gt;&gt; =C2=A0 };<br>&gt;&gt; =C2=A0 =C2=A0 struct arm_smmu_strtab_ent {<b=
r>&gt;&gt; @@ -635,9 +1025,21 @@ struct arm_smmu_device {<br>&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_strtab_cfg =C2=A0 =C2=A0 =C2=A0str=
tab_cfg;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IOMMU core code handle =
*/<br>&gt;&gt; +#if 0 /*Xen: Generic iommu_device ref not needed here */<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iommu_device =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 iommu;<br>&gt;&gt; +#endif<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 /* Xen: Need to keep a list of SMMU devices */<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 struct list_head =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0devices;<br>&gt;&gt; =C2=A0 };<br>&gt;&gt; =C2=A0 +/* X=
en: Keep a list of devices associated with this driver */<br>&gt;&gt; +stat=
ic DEFINE_SPINLOCK(arm_smmu_devices_lock);<br>&gt;&gt; +static LIST_HEAD(ar=
m_smmu_devices);<br>&gt;&gt; +/* Xen: Helper for finding a device using fwn=
ode */<br>&gt;&gt; +static<br>&gt;&gt; +struct arm_smmu_device *arm_smmu_ge=
t_by_fwnode(struct fwnode_handle<br>&gt;&gt; *fwnode);<br>&gt;&gt; +<br>&gt=
;&gt; +<br>&gt;&gt; =C2=A0 /* SMMU private data for each master */<br>&gt;&=
gt; =C2=A0 struct arm_smmu_master_data {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct arm_smmu_device =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*smmu;<br>&=
gt;&gt; @@ -1232,7 +1634,7 @@ static void arm_smmu_handle_ppr(struct<br>&gt=
;&gt; arm_smmu_device *smmu, u64 *evt)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_info(smmu-&gt;dev, &quot;unexpected PRI request received:\n&quot;);=
<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(smmu-&gt;dev,<br>&gt;&gt;=
 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\tsid 0x%08=
x.0x%05x: [%u%s] %sprivileged %s%s%s access<br>&gt;&gt; at iova 0x%016llx\n=
&quot;,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;\tsid 0x%08x.0x%05x: [%u%s] %sprivileged %s%s%s access<br>&gt;&gt;=
 at iova %#&quot; PRIx64 &quot;\n&quot;,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sid, ssid, grpid, last ? &quot;L&q=
uot; : &quot;&quot;,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0evt[0] &amp; PRIQ_0_PERM_PRIV ? &quot;&quot; : &quot;un=
&quot;,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0evt[0] &amp; PRIQ_0_PERM_READ ? &quot;R&quot; : &quot;&quot;,<br>&gt=
;&gt; @@ -1346,6 +1748,8 @@ static irqreturn_t arm_smmu_combined_irq_handle=
r(int<br>&gt;&gt; irq, void *dev)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arm_smmu_gerror_handler(irq, dev);<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arm_smmu_cmdq_sync_handler(irq, dev);<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 /*Xen: No threaded irq. So call the required function =
from here */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_combined_irq_threa=
d(irq, dev);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_WAKE_THREAD=
;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 @@ -1358,6 +1762,46 @@ static voi=
d __arm_smmu_tlb_sync(struct<br>&gt;&gt; arm_smmu_device *smmu)<br>&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_cmdq_issue_cmd(smmu, &amp;cmd);<br>&g=
t;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 +/*<br>&gt;&gt; + * Xen: Define the IRQ =
handlers for xen. The linux functions would be<br>&gt;&gt; + * modified to =
use the functions defined in the following code.<br>&gt;&gt; + */<br>&gt;&g=
t; +static void arm_smmu_evtq_thread_xen(int irq, void *dev,<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpu_user_=
regs *regs)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_evtq=
_thread(irq, dev);<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static void ar=
m_smmu_priq_thread_xen(int irq, void *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpu_user_regs *regs)<br>&gt=
;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_priq_thread(irq, dev);=
<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static void arm_smmu_cmdq_sync_h=
andler_xen(int irq, void *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cpu_user_regs *regs)<br>&gt;&gt; +{<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_cmdq_sync_handler(irq, dev);<br>=
&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static void arm_smmu_gerror_handler_=
xen(int irq, void *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct cpu_user_regs *regs)<br>&gt;&gt; +{<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_gerror_handler(irq, dev);<br>&gt;&gt; +=
}<br>&gt;&gt; +<br>&gt;&gt; +static void arm_smmu_combined_irq_handler_xen(=
int irq, void *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct cpu_user_regs *regs)<br>&gt;&gt; +{<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 arm_smmu_combined_irq_handler(irq, dev);<br>&gt;&gt; +=
}<br>&gt;&gt; +<br>&gt;&gt; +#define arm_smmu_evtq_thread arm_smmu_evtq_thr=
ead_xen<br>&gt;&gt; +#define arm_smmu_priq_thread arm_smmu_priq_thread_xen<=
br>&gt;&gt; +#define arm_smmu_cmdq_sync_handler arm_smmu_cmdq_sync_handler_=
xen<br>&gt;&gt; +#define arm_smmu_gerror_handler arm_smmu_gerror_handler_xe=
n<br>&gt;&gt; +#define arm_smmu_combined_irq_handler arm_smmu_combined_irq_=
handler_xen<br>&gt;&gt; +<br>&gt;&gt; =C2=A0 static void arm_smmu_tlb_sync(=
void *cookie)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
struct arm_smmu_domain *smmu_domain =3D cookie;<br>&gt;&gt; @@ -1415,6 +185=
9,7 @@ static const struct iommu_gather_ops<br>&gt;&gt; arm_smmu_gather_ops=
 =3D {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .tlb_sync =C2=A0 =C2=A0 =C2=
=A0 =3D arm_smmu_tlb_sync,<br>&gt;&gt; =C2=A0 };<br>&gt;&gt; =C2=A0 +#if 0 =
/*Xen: Unused functionality */<br>&gt;&gt; =C2=A0 /* IOMMU API */<br>&gt;&g=
t; =C2=A0 static bool arm_smmu_capable(enum iommu_cap cap)<br>&gt;&gt; =C2=
=A0 {<br>&gt;&gt; @@ -1427,6 +1872,7 @@ static bool arm_smmu_capable(enum i=
ommu_cap cap)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return false;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; =
=C2=A0 }<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0 static struct iommu_=
domain *arm_smmu_domain_alloc(unsigned type)<br>&gt;&gt; =C2=A0 {<br>&gt;&g=
t; @@ -1546,9 +1992,16 @@ static int arm_smmu_domain_finalise_s2(struct<br>=
&gt;&gt; arm_smmu_domain *smmu_domain,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (vmid &lt; 0)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return vmid;<br>&gt;&gt; =C2=A0 - =C2=A0 =C2=A0 cfg-&gt;vmid =
=C2=A0 =C2=A0 =C2=A0 =3D (u16)vmid;<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 cfg-=
&gt;vttbr =C2=A0 =C2=A0 =C2=A0=3D pgtbl_cfg-&gt;arm_lpae_s2_cfg.vttbr;<br>&=
gt;&gt; - =C2=A0 =C2=A0 =C2=A0 cfg-&gt;vtcr =C2=A0 =C2=A0 =C2=A0 =3D pgtbl_=
cfg-&gt;arm_lpae_s2_cfg.vtcr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Xen: Get the ttbr and vtcr values<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* vttbr: This is a shared value with th=
e domain page table<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* vtcr: The TC=
R settings are the same as CPU since the page<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0* tables are shared<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
/<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 cfg-&gt;vmid =C2=A0 =C2=
=A0 =C2=A0 =3D vmid;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 cfg-&gt;vttbr =C2=
=A0 =C2=A0 =C2=A0=3D page_to_maddr(cfg-&gt;domain-&gt;arch.p2m.root);<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 cfg-&gt;vtcr =C2=A0 =C2=A0 =C2=A0 =3D READ_SY=
SREG32(VTCR_EL2) &amp;<br>&gt;&gt; STRTAB_STE_2_VTCR_MASK;<br>&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 =
@@ -1604,6 +2057,7 @@ static int arm_smmu_domain_finalise(struct<br>&gt;&gt=
; iommu_domain *domain)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smmu-&g=
t;features &amp; ARM_SMMU_FEAT_COHERENCY)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgtbl_cfg.quirks =3D IO_PGTABLE_QUIRK_NO=
_DMA;<br>&gt;&gt; =C2=A0 + =C2=A0 =C2=A0 /* Xen: pgtbl_ops gets an invalid =
address */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgtbl_ops =3D alloc_io_p=
gtable_ops(fmt, &amp;pgtbl_cfg, smmu_domain);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!pgtbl_ops)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>&gt;<br>&gt; Will this not fail ?<b=
r>&gt;<br>&gt;&gt; @@ -1721,6 +2175,7 @@ out_unlock:<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return ret;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 +#if =
0 /* Xen: Unused functionality */<br>&gt;&gt; =C2=A0 static int arm_smmu_ma=
p(struct iommu_domain *domain, unsigned long iova,<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
hys_addr_t paddr, size_t size, int prot)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; @=
@ -1772,6 +2227,7 @@ struct arm_smmu_device<br>&gt;&gt; *arm_smmu_get_by_fw=
node(struct fwnode_handle *fwnode)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
put_device(dev);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dev ? dev_g=
et_drvdata(dev) : NULL;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; +#endif<br>&gt;&gt=
; =C2=A0 =C2=A0 static bool arm_smmu_sid_in_range(struct arm_smmu_device *s=
mmu, u32<br>&gt;&gt; sid)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; @@ -1783,7 +2239=
,14 @@ static bool arm_smmu_sid_in_range(struct<br>&gt;&gt; arm_smmu_device=
 *smmu, u32 sid)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sid &lt; li=
mit;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 +/* Xen: Unused */<br>&gt;&gt;=
 +#if 0<br>&gt;&gt; =C2=A0 static struct iommu_ops arm_smmu_ops;<br>&gt;&gt=
; +#endif<br>&gt;&gt; +<br>&gt;&gt; +/* Xen: Redefine arm_smmu_ops to what =
fwspec should evaluate */<br>&gt;&gt; +static const struct iommu_ops arm_sm=
mu_iommu_ops;<br>&gt;&gt; +#define arm_smmu_ops arm_smmu_iommu_ops<br>&gt;&=
gt; =C2=A0 =C2=A0 static int arm_smmu_add_device(struct device *dev)<br>&gt=
;&gt; =C2=A0 {<br>&gt;&gt; @@ -1791,8 +2254,11 @@ static int arm_smmu_add_d=
evice(struct device *dev)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ar=
m_smmu_device *smmu;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct arm_smm=
u_master_data *master;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iommu=
_fwspec *fwspec =3D dev-&gt;iommu_fwspec;<br>&gt;&gt; +#if 0 /*Xen: iommu_g=
roup is not needed */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iommu_=
group *group;<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 + =C2=A0 =C2=A0 /* Xen=
: fwspec-&gt;ops are not needed */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!fwspec || fwspec-&gt;ops !=3D &amp;arm_smmu_ops)<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>&gt;&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; @@ -1830,6 +2296,11 @@ static =
int arm_smmu_add_device(struct device *dev)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt;&gt; =C2=A0 +/*<br>&gt;&gt; + * Xen: Do not need an iommu g=
roup as the stream data is carried by the<br>&gt;&gt; SMMU<br>&gt;&gt; + * =
master device object<br>&gt;&gt; + */<br>&gt;&gt; +#if 0<br>&gt;&gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 group =3D iommu_group_get_for_dev(dev);<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(group)) {<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iommu_group_put(group);<br>&gt;&=
gt; @@ -1837,8 +2308,16 @@ static int arm_smmu_add_device(struct device *de=
v)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return PTR_ERR_OR_ZERO(group);<br>&gt;&gt; +#endif<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 +/*=
<br>&gt;&gt; + * Xen: We can potentially support this function and destroy =
a device.<br>&gt;&gt; This<br>&gt;&gt; + * will be relevant for PCI hotplug=
. So, will be implemented as needed<br>&gt;&gt; after<br>&gt;&gt; + * passt=
hrough support is available.<br>&gt;&gt; + */<br>&gt;&gt; +#if 0<br>&gt;&gt=
; =C2=A0 static void arm_smmu_remove_device(struct device *dev)<br>&gt;&gt;=
 =C2=A0 {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iommu_fwspec *fwsp=
ec =3D dev-&gt;iommu_fwspec;<br>&gt;&gt; @@ -1974,6 +2453,7 @@ static struc=
t iommu_ops arm_smmu_ops =3D {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .put=
_resv_regions =C2=A0 =C2=A0 =C2=A0 =3D arm_smmu_put_resv_regions,<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pgsize_bitmap =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D -1UL, /* Restricted during device attach<br>&gt;&gt; */<br>&gt;&g=
t; =C2=A0 };<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0 /* Probing and i=
nitialisation functions */<br>&gt;&gt; =C2=A0 static int arm_smmu_init_one_=
queue(struct arm_smmu_device *smmu,<br>&gt;&gt; @@ -2182,6 +2662,7 @@ stati=
c int arm_smmu_update_gbpa(struct<br>&gt;&gt; arm_smmu_device *smmu, u32 se=
t, u32 clr)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1, ARM_SMMU_POLL_TIMEOUT_US);<br>&gt;&gt; =C2=A0 }=
<br>&gt;&gt; =C2=A0 +#if 0 /* Xen: There is no MSI support as yet */<br>&gt=
;&gt; =C2=A0 static void arm_smmu_free_msis(void *data)<br>&gt;&gt; =C2=A0 =
{<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D data;<br>&=
gt;&gt; @@ -2247,12 +2728,15 @@ static void arm_smmu_setup_msis(struct<br>&=
gt;&gt; arm_smmu_device *smmu)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A=
dd callback to free MSIs on teardown */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 devm_add_action(dev, arm_smmu_free_msis, dev);<br>&gt;&gt; =C2=A0 }<=
br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0 static void arm_smmu_setup_un=
ique_irqs(struct arm_smmu_device *smmu)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, ret;<br>&gt;&gt; =C2=A0 +#if 0 /*Xen: =
Cannot setup msis for now */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_sm=
mu_setup_msis(smmu);<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Request interrupt lines */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 irq =3D smmu-&gt;evtq.q.irq;<br>&gt;&gt; @@ -2316,9 +2800,13 @@ static =
int arm_smmu_setup_irqs(struct<br>&gt;&gt; arm_smmu_device *smmu)<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Cavium T=
hunderX2 implementation doesn&#39;t not support<br>&gt;&gt; unique<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* irq lin=
es. Use single irq line for all the SMMUv3<br>&gt;&gt; interrupts.<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt=
;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_reque=
st_threaded_irq(smmu-&gt;dev, irq,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* Xen: Does not support threaded irqs, so serialise=
 the<br>&gt;&gt; setup.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* This is the same for pris and event interrupt lines o=
n<br>&gt;&gt; other<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0* systems<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D devm_request_irq(smmu-&gt;dev, irq,<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_combin=
ed_irq_handler,<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 arm_smmu_combined_irq_thread,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IRQF_ONESHOT,<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ar=
m-smmu-v3-combined-irq&quot;, smmu);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>&gt;&gt; @@ -2542,8 +303=
0,14 @@ static int arm_smmu_device_hw_probe(struct<br>&gt;&gt; arm_smmu_dev=
ice *smmu)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 smmu-&gt;features |=3D ARM_SMMU_FEAT_STALLS;<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0 +/*<br>&gt;&gt; + * Xen: Block stage 1 t=
ranslations. By doing this here we do not need to<br>&gt;&gt; set the<br>&g=
t;&gt; + * domain-&gt;stage explicitly.<br>&gt;&gt; + */<br>&gt;&gt; +#if 0=
<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg &amp; IDR0_S1P)<br>&gt;&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smmu-&gt;features=
 |=3D ARM_SMMU_FEAT_TRANS_S1;<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (reg &amp; IDR0_S2P)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smmu-&gt;features |=3D ARM_SMMU_FEAT_TRANS_=
S2;<br>&gt;&gt; @@ -2616,10 +3110,12 @@ static int arm_smmu_device_hw_probe=
(struct<br>&gt;&gt; arm_smmu_device *smmu)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (reg &amp; IDR5_GRAN4K)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 smmu-&gt;pgsize_bitmap |=3D SZ_4K | SZ_2M | SZ_=
1G;<br>&gt;&gt; =C2=A0 +#if 0 /* Xen: SMMU ops do not have a pgsize_bitmap =
member for Xen */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_smmu_ops.=
pgsize_bitmap =3D=3D -1UL)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arm_smmu_ops.pgsize_bitmap =3D smmu-&gt;pgsize_bitmap;=
<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_ops.pgsize_bitmap |=3D smmu=
-&gt;pgsize_bitmap;<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Output address size */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sw=
itch (reg &amp; IDR5_OAS_MASK &lt;&lt; IDR5_OAS_SHIFT) {<br>&gt;&gt; @@ -26=
80,7 +3176,8 @@ static int arm_smmu_device_acpi_probe(struct<br>&gt;&gt; pl=
atform_device *pdev,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device =
*dev =3D smmu-&gt;dev;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_=
iort_node *node;<br>&gt;&gt; =C2=A0 - =C2=A0 =C2=A0 node =3D *(struct acpi_=
iort_node **)dev_get_platdata(dev);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* X=
en: Modification to get iort_node */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 nod=
e =3D (struct acpi_iort_node *)dev-&gt;acpi_node;<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Retrieve SMMUv3 specific data */<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 iort_smmu =3D (struct acpi_iort_smmu_v3 *)node-&gt;node_d=
ata;<br>&gt;&gt; @@ -2703,7 +3200,7 @@ static inline int arm_smmu_device_ac=
pi_probe(struct<br>&gt;&gt; platform_device *pdev,<br>&gt;&gt; =C2=A0 stati=
c int arm_smmu_device_dt_probe(struct platform_device *pdev,<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_device=
 *smmu)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 struct devi=
ce *dev =3D &amp;pdev-&gt;dev;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct de=
vice *dev =3D pdev;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cells;<br>&=
gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D -EINVAL;<br>&gt;&gt; =C2=A0=
 @@ -2716,6 +3213,7 @@ static int arm_smmu_device_dt_probe(struct<br>&gt;&g=
t; platform_device *pdev,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_dri=
ver_options(smmu);<br>&gt;&gt; =C2=A0 + =C2=A0 =C2=A0 /* Xen: of_dma_is_coh=
erent is a stub till dt support is introduced<br>&gt;&gt; */<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_dma_is_coherent(dev-&gt;of_node))<br>&gt=
;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smmu-&gt;feat=
ures |=3D ARM_SMMU_FEAT_COHERENCY;<br>&gt;&gt; =C2=A0 @@ -2734,9 +3232,11 @=
@ static int arm_smmu_device_probe(struct<br>&gt;&gt; platform_device *pdev=
)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, ret=
;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>&gt;&gt;=
 +#if 0 /*Xen: Do not need to setup sysfs */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 resource_size_t ioaddr;<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct arm_smmu_device *smmu;<br>&gt;&gt; - =C2=A0 =C2=
=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 struct device *dev =3D pdev;/* Xen: dev is ignored */<br>&gt;=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool bypass;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);<br>&gt;&g=
t; @@ -2763,7 +3263,9 @@ static int arm_smmu_device_probe(struct<br>&gt;&gt=
; platform_device *pdev)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;MMIO region too small (%pr)\n&quot;, r=
es);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn -EINVAL;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +#if 0 =
/*Xen: Do not need to setup sysfs */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ioaddr =3D res-&gt;start;<br>&gt;&gt; +#endif<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 smmu-&gt;base =3D devm_ioremap_resource(dev, res);<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(smmu-&gt;base))<br>&gt;&gt; @@ -2=
802,13 +3304,18 @@ static int arm_smmu_device_probe(struct<br>&gt;&gt; plat=
form_device *pdev)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return ret;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Record=
 our private device structure */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* Xen:=
 SMMU is not treated a a platform device*/<br>&gt;&gt; +#if 0<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, smmu);<br>&gt;&gt; +=
#endif<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reset the device */<br>&g=
t;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D arm_smmu_device_reset(smmu, bypa=
ss);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;&gt; =
=C2=A0 +/* Xen: Not creating an IOMMU device list for Xen */<br>&gt;&gt; +#=
if 0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* And we&#39;re up. Go go go!=
 */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D iommu_device_sysfs_add(=
&amp;smmu-&gt;iommu, dev, NULL,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;smmu3.%pa&quot;, &amp;ioaddr);<br>&gt;&gt;=
 @@ -2844,9 +3351,20 @@ static int arm_smmu_device_probe(struct<br>&gt;&gt;=
 platform_device *pdev)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (ret)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +#endif<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Xen: Keep a list o=
f all probed devices. This will be used to<br>&gt;&gt; query<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* the smmu devices based on the fwnode.<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 INIT=
_LIST_HEAD(&amp;smmu-&gt;devices);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_=
lock(&amp;arm_smmu_devices_lock);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 list_a=
dd(&amp;smmu-&gt;devices, &amp;arm_smmu_devices);<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 spin_unlock(&amp;arm_smmu_devices_lock);<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 +/* Xen=
: Unused function */<br>&gt;&gt; +#if 0<br>&gt;&gt; =C2=A0 static int arm_s=
mmu_device_remove(struct platform_device *pdev)<br>&gt;&gt; =C2=A0 {<br>&gt=
;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_device *smmu =3D platform=
_get_drvdata(pdev);<br>&gt;&gt; @@ -2860,6 +3378,8 @@ static void arm_smmu_=
device_shutdown(struct<br>&gt;&gt; platform_device *pdev)<br>&gt;&gt; =C2=
=A0 {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_device_remove(pdev);=
<br>&gt;&gt; =C2=A0 }<br>&gt;&gt; +#endif<br>&gt;&gt; +<br>&gt;&gt; =C2=A0 =
=C2=A0 static const struct of_device_id arm_smmu_of_match[] =3D {<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;arm,smmu-v3&quot;, }=
,<br>&gt;&gt; @@ -2867,6 +3387,7 @@ static const struct of_device_id arm_sm=
mu_of_match[]<br>&gt;&gt; =3D {<br>&gt;&gt; =C2=A0 };<br>&gt;&gt; =C2=A0 MO=
DULE_DEVICE_TABLE(of, arm_smmu_of_match);<br>&gt;&gt; =C2=A0 +#if 0<br>&gt;=
&gt; =C2=A0 static struct platform_driver arm_smmu_driver =3D {<br>&gt;&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver =3D {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;arm-smmu-v3&quot;,<br>&gt;&gt; @@ -2883,3 +3404,316 @@ IOMMU_=
OF_DECLARE(arm_smmuv3, &quot;arm,smmu-v3&quot;, NULL);<br>&gt;&gt; =C2=A0 M=
ODULE_DESCRIPTION(&quot;IOMMU API for ARM architected SMMUv3<br>&gt;&gt; im=
plementations&quot;);<br>&gt;&gt; =C2=A0 MODULE_AUTHOR(&quot;Will Deacon &l=
t;<a href=3D"mailto:will.deacon@arm.com">will.deacon@arm.com</a>&gt;&quot;)=
;<br>&gt;&gt; =C2=A0 MODULE_LICENSE(&quot;GPL v2&quot;);<br>&gt;&gt; +#endi=
f<br>&gt;&gt; +<br>&gt;&gt; +/***** Start of Xen specific code *****/<br>&g=
t;&gt; +<br>&gt;&gt; +static int __must_check arm_smmu_iotlb_flush_all(stru=
ct domain *d)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_=
smmu_xen_domain *smmu_domain =3D dom_iommu(d)-&gt;arch.priv;<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 struct iommu_domain *cfg;<br>&gt;&gt; +<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;smmu_domain-&gt;lock);<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 list_for_each_entry(cfg, &amp;smmu_domain-&gt;contexts=
, list) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Onl=
y invalidate the context when SMMU is present.<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This is because the context init=
ialization is delayed<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* until a master has been added.<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!ACCESS_ONCE(cfg-&gt;priv-=
&gt;smmu)))<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_tlb_inv_context(cfg-&gt;priv);<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_unloc=
k(&amp;smmu_domain-&gt;lock);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<=
br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static int __must_check arm_smmu_=
iotlb_flush(struct domain *d,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long gfn,<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int page_count)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 return arm_smmu_iotlb_flush_all(d);<br>&gt;&gt; +}<br>&gt;&gt; +=
<br>&gt;&gt; +static struct iommu_domain *arm_smmu_get_domain(struct domain=
 *d,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev)<br>&gt;&gt; +{<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 struct iommu_domain *domain;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 struct arm_smmu_xen_domain *xen_domain;<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 struct arm_smmu_device *smmu;<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 struct arm_smmu_domain *smmu_domain;<br>&gt;&gt; +<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 xen_domain =3D dom_iommu(d)-&gt;arch.priv;<br>&gt;&gt;=
 +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 smmu =3D arm_smmu_get_by_fwnode(dev-&=
gt;iommu_fwspec-&gt;iommu_fwnode);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (!=
smmu)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 NULL;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Loop through the &amp;xen_domain-&gt;contexts =
to locate a context<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* assigned to =
this SMMU<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 list_for_each_entry(domain, &amp;xen_domain-&gt;contexts, lis=
t) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smmu_do=
main =3D to_smmu_domain(domain);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (smmu_domain-&gt;smmu =3D=3D smmu)<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return domain;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 return NULL;<br>&gt;&gt; +}<br>&gt;&gt; +<br>=
&gt;&gt; +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *do=
main)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 list_del(&amp;domai=
n-&gt;list);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 arm_smmu_domain_free(domain=
);<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static int arm_smmu_assign_dev=
(struct domain *d, u8 devfn,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct device *dev, u32 flag)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 int ret =3D 0;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct iommu_domain *=
domain;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_xen_domain *xen_=
domain;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_domain *arm_smmu=
;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 xen_domain =3D dom_iommu=
(d)-&gt;arch.priv;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (!de=
v-&gt;archdata.iommu) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dev-&gt;archdata.iommu =3D xzalloc(struct arm_smmu_xen_device=
);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dev-=
&gt;archdata.iommu)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D ar=
m_smmu_add_device(dev);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;=
&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;xen_domain-&gt;loc=
k);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0* Check to see if an iommu_domain already exists fo=
r this xen<br>&gt;&gt; domain<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* un=
der the same SMMU<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 domain =3D arm_smmu_get_domain(d, dev);<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 if (!domain) {<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 domain =3D arm_smmu_domain_alloc(IOM=
MU_DOMAIN_DMA);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!domain) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto =
out;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&g=
t;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm=
_smmu =3D to_smmu_domain(domain);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 arm_smmu-&gt;s2_cfg.domain =3D d;<br>&gt;&gt; +<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Chain the new =
context to the domain */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 list_add(&amp;domain-&gt;list, &amp;xen_domain-&gt;contexts);=
<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 ret =3D arm_smmu_attach_dev(domain, dev);<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (domain-&gt;ref.counter =3D=3D 0)<br>&gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arm_smmu_destroy_iommu_domain(domain);<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 } else {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 atomic_inc(&amp;domain-&gt;ref);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<b=
r>&gt;&gt; +<br>&gt;&gt; +out:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlo=
ck(&amp;xen_domain-&gt;lock);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return ret=
;<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static int arm_smmu_deassign_de=
v(struct domain *d, struct device *dev)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 struct iommu_domain *domain =3D arm_smmu_get_domain(d, dev);=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_xen_domain *xen_domain;=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_domain *arm_smmu =3D to=
_smmu_domain(domain);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 xen_=
domain =3D dom_iommu(d)-&gt;arch.priv;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 if (!arm_smmu || arm_smmu-&gt;s2_cfg.domain !=3D d) {<br>&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
 not attached to domain %d\n&quot;,<br>&gt;&gt; d-&gt;domain_id);<br>&gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ESRCH;<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 spin_lock(&amp;xen_domain-&gt;lock);<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 arm_smmu_detach_dev(dev);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 atomic_dec(&amp;domain-&gt;ref);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 if (domain-&gt;ref.counter =3D=3D 0)<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_smmu_destroy_iommu_domain(domain);<=
br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;xen_domai=
n-&gt;lock);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>=
&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static int arm_smmu_reassign_dev(str=
uct domain *s, struct domain *t,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u8 devfn, =C2=A0struct device *dev)<br>&gt;&gt; +{<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 /* Don&#39;t allow remapping on other domain than hwdom */<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 if (t &amp;&amp; t !=3D hardware_domain)<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EPERM;<b=
r>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (t =3D=3D s)<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D arm_smmu_deassign_dev(s, dev);<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 if (t) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* No flags are defined for ARM. */<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D arm_smmu_assign_dev(t, devfn=
, dev, 0);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (ret)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 }<b=
r>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +}<br=
>&gt;&gt; +<br>&gt;&gt; +static int arm_smmu_iommu_domain_init(struct domai=
n *d)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_xen=
_domain *xen_domain;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 xen_d=
omain =3D xzalloc(struct arm_smmu_xen_domain);<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 if (!xen_domain)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return -ENOMEM;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 spin_lock_init(&amp;xen_domain-&gt;lock);<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 INIT_LIST_HEAD(&amp;xen_domain-&gt;contexts);<br>&gt;&gt; +<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 dom_iommu(d)-&gt;arch.priv =3D xen_domain;<br>&g=
t;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +}<br>&gt=
;&gt; +<br>&gt;&gt; +static void __hwdom_init arm_smmu_iommu_hwdom_init(str=
uct domain *d)<br>&gt;&gt; +{<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +sta=
tic void arm_smmu_iommu_domain_teardown(struct domain *d)<br>&gt;&gt; +{<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct arm_smmu_xen_domain *xen_domain =3D=
 dom_iommu(d)-&gt;arch.priv;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 ASSERT(list_empty(&amp;xen_domain-&gt;contexts));<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 xfree(xen_domain);<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +=
static int __must_check arm_smmu_map_page(struct domain *d, unsigned long<b=
r>&gt;&gt; gfn,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long mfn, unsigned int flags)<br>&=
gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 p2m_type_t t;<br>&gt;&gt; +<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* Grant mappings can be used for DMA requests. The dev_bus_addr<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* returned by the hypercall is the MFN (no=
t the IPA). For device<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* protected=
 by an IOMMU, Xen needs to add a 1:1 mapping in the<br>&gt;&gt; domain<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* p2m to allow DMA request to work.<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* This is only valid when the domain=
 is directed mapped. Hence<br>&gt;&gt; this<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* function should only be used by gnttab code with gfn =3D=3D mfn=
.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 BUG_ON(!is_domain_direct_mapped(d));<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 BUG_ON(mfn !=3D gfn);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
/* We only support readable and writable flags */<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 if (!(flags &amp; (IOMMUF_readable | IOMMUF_writable)))<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>&=
gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 t =3D (flags &amp; IOMMUF_writ=
able) ? p2m_iommu_map_rw :<br>&gt;&gt; p2m_iommu_map_ro;<br>&gt;&gt; +<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
* The function guest_physmap_add_entry replaces the current<br>&gt;&gt; map=
ping<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* if there is already one...<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 return guest_physmap_add_entry(d, _gfn(gfn), _mfn(mfn), 0, t);<br>&gt;&=
gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static int __must_check arm_smmu_unmap_pa=
ge(struct domain *d, unsigned<br>&gt;&gt; long gfn)<br>&gt;&gt; +{<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Th=
is function should only be used by gnttab code when the<br>&gt;&gt; domain<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* is direct mapped<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (!is_do=
main_direct_mapped(d))<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 return guest_physmap_remove_page(d, _gfn(gfn), _mfn(gfn), 0);<br>&gt;&gt; =
+}<br>&gt;&gt; +<br>&gt;&gt; +static const struct iommu_ops arm_smmu_iommu_=
ops =3D {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .init =3D arm_smmu_iommu_domai=
n_init,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .hwdom_init =3D arm_smmu_iommu_h=
wdom_init,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .teardown =3D arm_smmu_iommu_=
domain_teardown,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .iotlb_flush =3D arm_sm=
mu_iotlb_flush,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .iotlb_flush_all =3D arm=
_smmu_iotlb_flush_all,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .assign_device =
=3D arm_smmu_assign_dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .reassign_devic=
e =3D arm_smmu_reassign_dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .map_page =
=3D arm_smmu_map_page,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .unmap_page =3D a=
rm_smmu_unmap_page,<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +static<br>&g=
t;&gt; +struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle=
<br>&gt;&gt; *fwnode)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 str=
uct arm_smmu_device *smmu =3D NULL;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 spin_lock(&amp;arm_smmu_devices_lock);<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 list_for_each_entry(smmu, &amp;arm_smmu_devices, devices) {<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (smmu-&gt;dev=
-&gt;fwnode =3D=3D fwnode)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 }<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;arm_smmu_d=
evices_lock);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return smmu;=
<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static __init int arm_smmu_dt_in=
it(struct dt_device_node *dev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const void *data)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 int rc;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Even if the device can&#39;t be init=
ialized, we don&#39;t want to<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* gi=
ve the SMMU device to dom0.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>=
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 dt_device_set_used_by(dev, DOMID_XEN);<br>&=
gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 rc =3D arm_smmu_device_probe(d=
t_to_dev(dev));<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (rc)<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>&gt;&gt; +<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 iommu_set_ops(&amp;arm_smmu_iommu_ops);<b=
r>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +}<br=
>&gt;&gt; +<br>&gt;&gt; +DT_DEVICE_START(smmuv3, &quot;ARM SMMU V3&quot;, D=
EVICE_IOMMU)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .dt_match =3D arm_smmu_of_m=
atch,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .init =3D arm_smmu_dt_init,<br>&gt=
;&gt; +DT_DEVICE_END<br>&gt;&gt; +<br>&gt;&gt; +#ifdef CONFIG_ACPI<br>&gt;&=
gt; +/* Set up the IOMMU */<br>&gt;&gt; +static int __init arm_smmu_acpi_in=
it(const void *data)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 int =
rc;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 rc =3D arm_smmu_device=
_probe((struct device *)data);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (rc)<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br=
>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 iommu_set_ops(&amp;arm_smmu_=
iommu_ops);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +}<br>=
&gt;&gt; +<br>&gt;&gt; +ACPI_DEVICE_START(asmmuv3, &quot;ARM SMMU V3&quot;,=
 DEVICE_IOMMU)<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .class_type =3D ACPI_IORT=
_NODE_SMMU_V3,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 .init =3D arm_smmu_acpi_i=
nit,<br>&gt;&gt; +ACPI_DEVICE_END<br>&gt;&gt; +<br>&gt;&gt; +#endif<br>&gt;=
&gt; diff --git a/xen/include/xen/linux_compat.h<br>&gt;&gt; b/xen/include/=
xen/linux_compat.h<br>&gt;&gt; new file mode 100644<br>&gt;&gt; index 00000=
00000..8037be0a3e<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b/xen/include/x=
en/linux_compat.h<br>&gt;&gt; @@ -0,0 +1,84 @@<br>&gt;&gt;<br>&gt;&gt; +/**=
***************************************************************************=
*<br>&gt;&gt; + * include/xen/linux_compat.h<br>&gt;&gt; + *<br>&gt;&gt; + =
* Compatibility defines for porting code from Linux to Xen<br>&gt;&gt; + *<=
br>&gt;&gt; + * Copyright (c) 2017 Linaro Limited<br>&gt;&gt; + *<br>&gt;&g=
t; + * This program is free software; you can redistribute it and/or modify=
<br>&gt;&gt; + * it under the terms of the GNU General Public License as pu=
blished by<br>&gt;&gt; + * the Free Software Foundation; either version 2 o=
f the License, or<br>&gt;&gt; + * (at your option) any later version.<br>&g=
t;&gt; + *<br>&gt;&gt; + * This program is distributed in the hope that it =
will be useful,<br>&gt;&gt; + * but WITHOUT ANY WARRANTY; without even the =
implied warranty of<br>&gt;&gt; + * MERCHANTABILITY or FITNESS FOR A PARTIC=
ULAR PURPOSE.=C2=A0 See the<br>&gt;&gt; + * GNU General Public License for =
more details.<br>&gt;&gt; + *<br>&gt;&gt; + * You should have received a co=
py of the GNU General Public License<br>&gt;&gt; + * along with this progra=
m; If not, see &lt;<a href=3D"http://www.gnu.org/licenses/">http://www.gnu.=
org/licenses/</a>&gt;.<br>&gt;&gt; + */<br>&gt;&gt; +<br>&gt;&gt; +#ifndef =
__XEN_LINUX_COMPAT_H__<br>&gt;&gt; +#define __XEN_LINUX_COMPAT_H__<br>&gt;&=
gt; +<br>&gt;&gt; +#include &lt;asm/types.h&gt;<br>&gt;&gt; +<br>&gt;&gt; +=
typedef paddr_t phys_addr_t;<br>&gt;&gt; +typedef paddr_t dma_addr_t;<br>&g=
t;&gt; +<br>&gt;&gt; +typedef unsigned int gfp_t;<br>&gt;&gt; +#define GFP_=
KERNEL 0<br>&gt;&gt; +#define __GFP_ZERO 0x01U<br>&gt;&gt; +<br>&gt;&gt; +/=
* Helpers for IRQ functions */<br>&gt;&gt; +#define free_irq release_irq<br=
>&gt;&gt; +<br>&gt;&gt; +enum irqreturn {<br>&gt;&gt; + =C2=A0 =C2=A0IRQ_NO=
NE,<br>&gt;&gt; + =C2=A0 =C2=A0IRQ_HANDLED,<br>&gt;&gt; + =C2=A0 =C2=A0IRQ_=
WAKE_THREAD,<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +typedef enum irqret=
urn irqreturn_t;<br>&gt;&gt; +<br>&gt;&gt; +/* Device logger functions */<b=
r>&gt;&gt; +#define dev_dbg(dev, fmt, ...) printk(XENLOG_DEBUG fmt, ## __VA=
_ARGS__)<br>&gt;&gt; +#define dev_notice(dev, fmt, ...) printk(XENLOG_INFO =
fmt, ## __VA_ARGS__)<br>&gt;&gt; +#define dev_warn(dev, fmt, ...) printk(XE=
NLOG_WARNING fmt, ##<br>&gt;&gt; __VA_ARGS__)<br>&gt;&gt; +#define dev_err(=
dev, fmt, ...) printk(XENLOG_ERR fmt, ## __VA_ARGS__)<br>&gt;&gt; +#define =
dev_info(dev, fmt, ...) printk(XENLOG_INFO fmt, ## __VA_ARGS__)<br>&gt;&gt;=
 +<br>&gt;&gt; +#define dev_err_ratelimited(dev, fmt, ...) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>&gt;&gt; + =C2=A0 =C2=
=A0 printk(XENLOG_ERR fmt, ## __VA_ARGS__)<br>&gt;&gt; +<br>&gt;&gt; +#defi=
ne dev_name(dev) dt_node_full_name(dev_to_dt(dev))<br>&gt;&gt; +<br>&gt;&gt=
; +/* Alias to Xen allocation helpers */<br>&gt;&gt; +#define kfree xfree<b=
r>&gt;&gt; +#define kmalloc(size, flags) ({\<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 void *__ret_alloc =3D NULL; \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if =
(flags &amp; __GFP_ZERO) \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 __ret_alloc =3D _xzalloc(size, sizeof(void *)); \<br>&gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 else \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 __ret_alloc =3D _xmalloc(size, sizeof(void *)); \<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 __ret_alloc; \<br>&gt;&gt; +})<br>&gt;&gt; +=
#define kzalloc(size, flags) =C2=A0 =C2=A0 =C2=A0 =C2=A0_xzalloc(size, size=
of(void *))<br>&gt;&gt; +#define devm_kzalloc(dev, size, flags) =C2=A0_xzal=
loc(size, sizeof(void *))<br>&gt;&gt; +#define kmalloc_array(size, n, flags=
) ({\<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 void *__ret_alloc =3D NULL; \<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 if (flags &amp; __GFP_ZERO) \<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ret_alloc =3D _xzalloc_a=
rray(size, sizeof(void *), n); \<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 else \<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ret_alloc =
=3D _xmalloc_array(size, sizeof(void *), n); \<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 __ret_alloc; \<br>&gt;&gt; +})<br>&gt;&gt; +<br>&gt;&gt; +/* Alias t=
o Xen time functions */<br>&gt;&gt; +#define ktime_t s_time_t<br>&gt;&gt; +=
#define ktime_get() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (NOW())<br>&g=
t;&gt; +#define ktime_add_us(t,i) =C2=A0 =C2=A0 =C2=A0 (t + MICROSECS(i))<b=
r>&gt;&gt; +#define ktime_compare(t,i) =C2=A0 =C2=A0 =C2=A0(t &gt; (i))<br>=
&gt;&gt; +<br>&gt;&gt; +#endif /* __XEN_LINUX_COMPAT_H__ */<br>&gt;<br>&gt;=
<br>&gt;<br>&gt; _______________________________________________<br>&gt; Xe=
n-devel mailing list<br>&gt; <a href=3D"mailto:Xen-devel@lists.xenproject.o=
rg">Xen-devel@lists.xenproject.org</a><br>&gt; <a href=3D"https://lists.xen=
project.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailma=
n/listinfo/xen-devel</a><br></div>

--001a11452256e3807405672ed983--


--===============3227785545391631416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3227785545391631416==--
