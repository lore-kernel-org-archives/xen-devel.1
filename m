Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEC4C4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:01:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE41D61152
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE41D61152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168752.308103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhfS-0006TA-Fd; Thu, 19 Aug 2021 13:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168752.308103; Thu, 19 Aug 2021 13:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhfS-0006Sd-Cc; Thu, 19 Aug 2021 13:01:10 +0000
Received: by outflank-mailman (input) for mailman id 168752;
 Thu, 19 Aug 2021 13:01:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGhfR-0006PO-DU
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:01:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhfK-0007um-Km; Thu, 19 Aug 2021 13:01:02 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhfK-0006Bd-DX; Thu, 19 Aug 2021 13:01:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=kPRD1YSEk4/zg+30xLpP6gUHJObPS7eTAOYadF4Cq1w=; b=sbQ2+jVx/BQzH3DCA4g5i4wQeT
	O1JrXd1tJ8bKCz53vHnkKbXbV2VyK5TqGKaUGM+ellHeco3AlWr6OLt4RaCJvmAcWq2aYuCYgnRyO
	M6fU78x9RrA1SJvdAqJib2W7yU8QMJ44CA0R7RkFv6XhdSn0fKLudguMyE1qQJ7hyPvI=;
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c0ea2f05-bf0a-a8b0-a811-d899516c26ba@xen.org>
Date: Thu, 19 Aug 2021 14:00:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> libxl will create an emulated PCI device tree node in the device tree to
> enable the guest OS to discover the virtual PCI during guest boot.
> Emulated PCI device tree node will only be created when there is any
> device assigned to guest.
> 
> A new area has been reserved in the arm guest physical map at
> which the VPCI bus is declared in the device tree (reg and ranges
> parameters of the node).
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   tools/libs/light/libxl_arm.c          | 109 ++++++++++++++++++++++++++
>   tools/libs/light/libxl_types.idl      |   1 +
>   tools/xl/xl_parse.c                   |   2 +
>   xen/include/public/arch-arm.h         |  11 +++
>   xen/include/public/device_tree_defs.h |   1 +
>   5 files changed, 124 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..a091e97e76 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
>       return fdt_property(fdt, "reg", regs, sizeof(regs));
>   }
>   
> +static int fdt_property_values(libxl__gc *gc, void *fdt,
> +        const char *name, unsigned num_cells, ...)
> +{
> +    uint32_t prop[num_cells];
> +    be32 *cells = &prop[0];
> +    int i;
> +    va_list ap;
> +    uint32_t arg;
> +
> +    va_start(ap, num_cells);
> +    for (i = 0 ; i < num_cells; i++) {
> +        arg = va_arg(ap, uint32_t);
> +        set_cell(&cells, 1, arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, name, prop, sizeof(prop));
> +}
> +
> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
> +                                    unsigned addr_cells,
> +                                    unsigned size_cells,
> +                                    unsigned num_regs, ...)
> +{
> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
> +    be32 *cells = &regs[0];
> +    int i;
> +    va_list ap;
> +    uint64_t arg;
> +
> +    va_start(ap, num_regs);
> +    for (i = 0 ; i < num_regs; i++) {
> +        /* Set the memory bit field */
> +        arg = va_arg(ap, uint64_t);
> +        set_cell(&cells, 1, arg);
> +
> +        /* Set the vpci bus address */
> +        arg = addr_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, addr_cells , arg);
> +
> +        /* Set the cpu bus address where vpci address is mapped */
> +        set_cell(&cells, addr_cells, arg);
> +
> +        /* Set the vpci size requested */
> +        arg = size_cells ? va_arg(ap, uint64_t) : 0;
> +        set_cell(&cells, size_cells,arg);
> +    }
> +    va_end(ap);
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
>   static int make_root_properties(libxl__gc *gc,
>                                   const libxl_version_info *vers,
>                                   void *fdt)
> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
>       return 0;
>   }
>   
> +static int make_vpci_node(libxl__gc *gc, void *fdt,
> +        const struct arch_info *ainfo,
> +        struct xc_dom_image *dom)
> +{
> +    int res;
> +    const uint64_t vpci_ecam_base = GUEST_VPCI_ECAM_BASE;
> +    const uint64_t vpci_ecam_size = GUEST_VPCI_ECAM_SIZE;
> +    const char *name = GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
> +
> +    res = fdt_begin_node(fdt, name);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "device_type", "pci");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
> +    if (res) return res;
> +
> +    res = fdt_property_values(gc, fdt, "bus-range", 2, 0,17);

AFAICT, the "bus-range" is optional. Can you explain why we need it?

> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if (res) return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if (res) return res;
> +
> +    res = fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +        GUEST_ROOT_SIZE_CELLS, 2,
> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_SIZE,
> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR,
> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
> +    if (res) return res;
> +
> +    res = fdt_property_values(gc, fdt, "msi-map", 4, 0, GUEST_PHANDLE_ITS,
> +                              0, 0x10000);

The ITS is not exposed to the guest so far. So I think this wants to be 
moved to the future series that will add ITS support.

> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -971,6 +1074,9 @@ next_resize:
>           if (info->tee == LIBXL_TEE_TYPE_OPTEE)
>               FDT( make_optee_node(gc, fdt) );
>   
> +        if (libxl_defbool_val(info->arch_arm.vpci))
> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );
>   
> @@ -1189,6 +1295,9 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>       /* ACPI is disabled by default */
>       libxl_defbool_setdefault(&b_info->acpi, false);
>   
> +    /* VPCI is disabled by default */
> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);

Here you say that vPCI is disabled by default. However, AFAICT, in the 
previous patch you will unconditionally enable vPCI if Xen has been 
built with VPCI.

Rather than unconditionally enable VPCI for a domain, I think we should 
introduce a new flag that is passed to Xen at the domain creation. The 
flag will be set based on arch_arm.vpci.

> +
>       if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>           return;
>   
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff653a..78b1ddf0b8 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>   
>       ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                  ("vuart", libxl_vuart_type),
> +                               ("vpci", libxl_defbool),

Any new addition in the structure should be accompanied with a 
LIBXL_HAVE_* in the libxl.h header.

>                                 ])),
>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                 ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..ffafbeffb4 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>           }
>           if (d_config->num_pcidevs && c_info->type == LIBXL_DOMAIN_TYPE_PV)
>               libxl_defbool_set(&b_info->u.pv.e820_host, true);
> +        if (d_config->num_pcidevs)
> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>       }
>   
>       if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 0a9749e768..01d13e669e 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>   #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>   
> +/* PCI-PCIe memory space types */
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)

What the size of those regions?

> +
> +/* Guest PCI-PCIe memory space where config space and BAR will be available.*/
> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
So far the memory layout defines the address in ascending order. So 
please add that after GUEST_RAM_BANK_BASES_*.

However, if I am not mistaken that base address you provide will clash 
with RAM bank 1. It also seem to be pretty high which means that this 
will not work for 32-bit domain or on CPUs that don't allow offer large 
IPA bits.

I think we need to start making the guest layout more dynamic. The VPCI 
memory space would have to go right after the end of the RAM allocated 
for a given guest.

> +
> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)

It would be better if the size for each region is defined right after 
each base.

Also, how did you decide the size of each region?

> +
>   /*
>    * 16MB == 4096 pages reserved for guest to use as a region to map its
>    * grant table in.
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
> index 209d43de3f..d24d86b1fc 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -7,6 +7,7 @@
>    * onwards. Reserve a high value for the GIC phandle.
>    */
>   #define GUEST_PHANDLE_GIC (65000)
> +#define GUEST_PHANDLE_ITS (64999)
>   
>   #define GUEST_ROOT_ADDRESS_CELLS 2
>   #define GUEST_ROOT_SIZE_CELLS 2
> 

Cheers,

-- 
Julien Grall

