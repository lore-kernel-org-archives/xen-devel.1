Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7D1C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 16:05:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394349.1633180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwMJc-00035D-3Q; Tue, 18 Aug 2026 16:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394349.1633180; Tue, 18 Aug 2026 16:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwMJc-000356-0G; Tue, 18 Aug 2026 16:05:28 +0000
Received: by outflank-mailman (input) for mailman id 1394349;
 Tue, 18 Aug 2026 16:05:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwMJa-00034w-HO
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:05:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwMJZ-00HWf2-Ua
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 18:05:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8482be-2eae-0a2a0a5409dd-0a2a4508803e-14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 18:05:25 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8482c5-f659-0a2a45080019-d155802fb8f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 18:05:25 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so1105e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:05:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d078523sm143035125e9.6.2026.08.18.09.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 09:05:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787069125; x=1787673925; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InfOa6qUmClzKj3WxgBIReQM4wfkrqswb3Yp/gAlkqY=;
        b=PWSalbjmxeSzlRR/aYcgJh1OhuZeOntMMtbNO9EhEhpuHBm8/Fc8Y1K16kZa9y1zh5
         5ENdhrEzxeWuG7pyWTdEaqJjSFaqxvNV/3Hnor70Dcu2PcpImtE5E8DZN/bPkWIJxJFw
         /GhSa8RtCG0P3TwgB43JBugIwNwWf+qDr7rDrxWAH+R/IzlZGwq6Fyv9cLWOfdJw7GwR
         mzXfXFdDhM2E6XoiFli0fFhgPtqEtgRMvnyTNsCWqNcJp9H2aVImBZizTL9AdXniw/mx
         XRBj45iCxBF6ikWwN7/oVA8vk+6DMjB/m3jmPzBcwR5j0Hq1fNrkWAyLwSP78UHc4xoy
         jIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069125; x=1787673925;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InfOa6qUmClzKj3WxgBIReQM4wfkrqswb3Yp/gAlkqY=;
        b=LFWH9+15VGXtap/V3w9FUWSBV/bzQpr1SGv17P4FAYPOzR9S0jVWP4PRTZ31MciDah
         VxKqmgoMi53Sp9wQ1GpxSgTMmuYdtubHQeoSZRE6S+krxcY/IOFfxDeDBQYXDOxeVlzr
         f3CLz9ALkrQKy1F1+48Dq3/UVRlVklnMql3Vbi/K/jMHj7IpWuWGUFT4M5wmJGRp77RW
         WY2WFrVbEGNMWfBEVGlhCPQZ2IAzWUDQhWp3nc81+JhB2sAKPF9qWwTxaG3/IeGbdMCw
         v81pFucmbh20c/k6VqYshgFcKqu2r5oXWNZ8uQ6PD7f2fSv+/PPJirluQC4+F2v9i8JY
         aCHg==
X-Forwarded-Encrypted: i=1; AHgh+RraD/GGA18Fg1v3nLQ1vrFLg3nv4FIRYUFb3p3ZNOwKFVt2ttqOQfsM22wxHzlvjOWNUYe4PATgZow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeKMjRvq9sGSlN47vhYdE9JzBAGYisWdjK7j/eprpolxK/i1vA
	uaL/+OP8Dh/yC5BTQFGiJuamWFhT4LDnbYIeoG96KPO97DTzffvM7b8k0t46ZICHVA==
X-Gm-Gg: AR+sD12KbSiRK/mbLgijE1xK5xbHArrThcBV0bOTIzEO+cT0XvZ9GIdPk+E013ChEiQ
	0IjLmiy7Dx8zxtJ+cl/wy0YXVKWcvSjvudbJsV1RwfXNMtP5hqN6FnODaLkbZzMoSsG0s3GaR0h
	jvnBJxNSdIMopRYs1iOn1MdW3h2g+6qWpBfi3yZ9y4eRvbDRFR6pEzPCRDpcT7kKgaj0dPydabc
	TBOHl3jXBzyR+0IxgZ/YxeUCJhtwcHuea60FhcneSN9D03BmEPatVLvA/T1HkCL7Rx7m5mKwmZA
	4ZsqD7rre5osb2FhDL5vSROWjEMJz213g9/Rxp6MiqrTFDRMyKtqMaEVtZLNaJYwJyYMXYDHkIF
	Hu9+FPRM4KhN2XvCYzENNiRMVtg/z5m9l5HDJMGp6WFUaEPv9rv3bUzmfo+Y1aZ/ZRgXA1qPDUj
	pAMNA4svEBhrXh5205bkw0lQt2qgW7HvZjsnmUFMeLhHsYKs1w4rxiDI0FWMm64k2f1G7/SYhBr
	msRVHPGRwdfLoew4U32v9wXRxm0VxNRMF5xmMrAdLmDHOhHM2Va
X-Received: by 2002:a05:600c:848e:b0:499:8156:cd3f with SMTP id 5b1f17b1804b1-4999fb3f78bmr175917645e9.8.1787069124968;
        Tue, 18 Aug 2026 09:05:24 -0700 (PDT)
Message-ID: <35f997cb-e143-41bd-9360-fafff3c9bfc7@suse.com>
Date: Tue, 18 Aug 2026 18:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] x86/passthrough: Introduce pt_irq_bind_msi() as
 canonical MSI bind path
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787069125-D674387B-8B044975/0/0
X-purgate-type: clean
X-purgate-size: 10305

On 27.04.2026 15:54, Julian Vetter wrote:
> Change pt_irq_bind_msi() to accept raw MSI address and data values instead
> of pre-decoded gvec/gflags. Add msi_addr_to_gflags() to decode the
> destination ID and delivery attributes, including the Extended Destination
> ID bits from address[11:5] per Intel convention.
> 
> Update pt_irq_create_bind() to call pt_irq_bind_msi() via the existing
> gvec/gflags interface so domctl-based callers continue to work.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - As suggested by Roger replace the v3 approach (v3 patches 2+4) of
>   extending the gflags ABI with XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK and
>   XEN_DOMCTL_VMSI_X86_FULL_DEST() so callers could pass extended bits
>   through XEN_DOMCTL_bind_pt_irq. pt_irq_bind_msi() now accepts raw MSI
>   address + data and decodes the destination internally via
>   msi_addr_to_gflags()
> - Replace the gmsi.gvec + gmsi.gflags fields in struct hvm_pirq_dpci
>   with gmsi.addr + gmsi.data
> - Replace msi_gflags() (v3 vmsi.c helper that packed the extended
>   destination bits into gflags) with msi_addr_to_gflags() which decodes
>   the raw MSI address directly
> - pt_irq_create_bind() now rejects PT_IRQ_TYPE_MSI with -EOPNOTSUPP and
>   all callers are redirected through the DM op path in patch 7

This does not look to match what the patch here does. Peeking ahead, patch
7 doesn't look to convert to -EOPNOTSUPP either.

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -43,6 +43,7 @@
>  #include <asm/current.h>
>  #include <asm/event.h>
>  #include <asm/io_apic.h>
> +#include <asm/msi.h>
>  
>  static void vmsi_inj_irq(
>      struct vlapic *target,
> @@ -107,12 +108,12 @@ int vmsi_deliver(
>  
>  void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
>  {
> -    uint32_t flags = pirq_dpci->gmsi.gflags;
> -    int vector = pirq_dpci->gmsi.gvec;
> -    uint8_t dest = (uint8_t)flags;
> -    bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
> -    uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> -    bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
> +    uint32_t dest = MSI_ADDR_DEST(pirq_dpci->gmsi.addr);
> +    bool dest_mode = pirq_dpci->gmsi.addr & MSI_ADDR_DESTMODE_MASK;
> +    uint8_t delivery_mode = MASK_EXTR(pirq_dpci->gmsi.data,
> +                                      MSI_DATA_DELIVERY_MODE_MASK);
> +    bool trig_mode = pirq_dpci->gmsi.data & MSI_DATA_TRIGGER_MASK;
> +    int vector = pirq_dpci->gmsi.data & MSI_DATA_VECTOR_MASK;

Please consider types used, as indicated elsewhere before. I don't see how
"vector" could go negative, and I don't see how delivery_mode can sensibly
be uint8_t. Just to name the two most obvious issues; others may be on the
edge.

> @@ -850,17 +830,17 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
>      {
>          uint8_t vector = MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
>          uint8_t vector_mask = 0xff >> (8 - fls(vectors) + 1);
> -        struct xen_domctl_bind_pt_irq bind = {
> -            .machine_irq = pirq + i,
> -            .irq_type = PT_IRQ_TYPE_MSI,
> -            .u.msi.gvec = (vector & ~vector_mask) |
> -                          ((vector + i) & vector_mask),
> -            .u.msi.gflags = msi_gflags(data, address, (mask >> i) & 1),
> -        };
> -        int rc = pt_irq_create_bind(pdev->domain, &bind);
> +        uint8_t gvec = (vector & ~vector_mask) | ((vector + i) & vector_mask);
> +        uint32_t msi_data = (data & ~MSI_DATA_VECTOR_MASK) | gvec;

Please be consistent throughout with the use of MASK_INSR(): Here you're
open-coding MSI_DATA_VECTOR_SHIFT / MSI_DATA_VECTOR_MASK (of which only
the latter should really exist).

> +        int rc = pt_irq_bind_msi(pdev->domain, pirq + i,
> +                                 address, msi_data, 0, !((mask >> i) & 1));

The literal 0 here could do with a /* gtable */ comment.

>          if ( rc )
>          {
> +            struct xen_domctl_bind_pt_irq bind = {
> +                .irq_type = PT_IRQ_TYPE_MSI,
> +                .machine_irq = pirq + i,
> +            };
>              gdprintk(XENLOG_ERR, "%pp: failed to bind PIRQ %u: %d\n",

Blank line please between declaration(s) and statement(s).

> --- a/xen/arch/x86/include/asm/hvm/irq.h
> +++ b/xen/arch/x86/include/asm/hvm/irq.h
> @@ -120,8 +120,8 @@ struct dev_intx_gsi_link {
>  #define HVM_IRQ_DPCI_TRANSLATE       (1u << _HVM_IRQ_DPCI_TRANSLATE_SHIFT)
>  
>  struct hvm_gmsi_info {
> -    uint32_t gvec;
> -    uint32_t gflags;
> +    uint64_t addr;    /* raw MSI address (0xfeexxxxx, includes ext dest ID) */

Is "includes" true? You need to cope with existing code passing rubbish there
(and I think we have said so before). E.g. in vpci_msi_update().

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -51,8 +51,22 @@
>  #define MSI_ADDR_REDIRECTION_MASK   (1 << MSI_ADDR_REDIRECTION_SHIFT)
>  
>  #define MSI_ADDR_DEST_ID_SHIFT		12
> -#define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
> -#define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
> +#define MSI_ADDR_DEST_ID_UPPER_BITS	8

The name doesn't make clear whether the constant describes a number of
bits, or a bit position, or yet something else. From the use below it
looks to instead describe the number of the _lower_ bits, or
(equivalently) the number of bits to shift left the raw value of the
(seven) upper bits. (In the end I think this value would want deriving
anyway, to make crystal clear where it is coming from.)

> +#define MSI_ADDR_DEST_ID_MASK		0x00ff000
> +#define MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)

I understand there's cleanup potential here, but please leave this alone
when you don't need to touch the lines anyway, and when the patch is
already pretty involved. Plus you don't even finish tidying - the too
long like is left there.

> +/*
> + * Intel convention: in physical destination mode bits 11:5 of the MSI
> + * address carry APIC ID bits [14:8] (the "Extended Destination ID"),
> + * extending the addressable range from 8 to 15 bits.
> + */
> +#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0

What reference is "Intel convention" based upon?

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -21,6 +21,7 @@
>  #include <xen/event.h>
>  #include <xen/iommu.h>
>  #include <xen/cpu.h>
> +#include <xen/ioreq.h>
>  #include <xen/irq.h>
>  #include <asm/hvm/irq.h>
>  #include <asm/io_apic.h>

Why is this? (And didn't I see patch 7 remove it again, when I peeked there?)

> @@ -367,20 +369,22 @@ static int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
>          }
>  
>          /* If pirq is already mapped as vmsi, update guest data/addr. */
> -        if ( pirq_dpci->gmsi.gvec != gvec || pirq_dpci->gmsi.gflags != gflags )
> +        if ( pirq_dpci->gmsi.addr != msi_addr ||
> +             pirq_dpci->gmsi.data != msi_data )

You suddenly compare much more here. To prove correctness of this imo requires
a sentence or two in the description.

>          {
>              /* Directly clear pending EOIs before enabling new MSI info. */
>              pirq_guest_eoi(info);
>  
> -            pirq_dpci->gmsi.gvec = gvec;
> -            pirq_dpci->gmsi.gflags = gflags;
> +            pirq_dpci->gmsi.addr = msi_addr;
> +            pirq_dpci->gmsi.data = msi_data;
>          }
>      }
> +
>      /* Calculate dest_vcpu_id for MSI-type pirq migration. */

Such a blank line would best be inserted when the function is being split out
(or as per the eralier suggesting, maybe when its body is re-indented).

> @@ -448,13 +451,29 @@ int pt_irq_create_bind(
>      switch ( pt_irq_bind->irq_type )
>      {
>      case PT_IRQ_TYPE_MSI:
> -        return pt_irq_bind_msi(d, pirq,
> -                               pt_irq_bind->u.msi.gvec,
> -                               pt_irq_bind->u.msi.gflags &
> -                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
> +    {
> +        uint32_t gflags = pt_irq_bind->u.msi.gflags;
> +        uint64_t msi_addr;
> +        uint32_t msi_data;
> +
> +        msi_addr = MSI_ADDR_HEADER |
> +                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK),
> +                             MSI_ADDR_DEST_ID_MASK) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ?
> +                    MSI_ADDR_REDIRECTION_LOWPRI : MSI_ADDR_REDIRECTION_CPU) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ?
> +                    MSI_ADDR_DESTMODE_LOGIC : MSI_ADDR_DESTMODE_PHYS);

We prefer to treat the ?: operator a little special, to help readbility:

                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK
                    ? MSI_ADDR_REDIRECTION_LOWPRI
                    : MSI_ADDR_REDIRECTION_CPU) |
                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ?
                    ? MSI_ADDR_DESTMODE_LOGIC
                    : MSI_ADDR_DESTMODE_PHYS);

> @@ -617,7 +636,6 @@ int pt_irq_create_bind(
>      }
>  
>      default:
> -        write_unlock(&d->event_lock);
>          return -EOPNOTSUPP;
>      }

Seeing no other locking change here - how is this hunk to be explained?

> @@ -858,11 +876,10 @@ static int cf_check _hvm_dpci_msi_eoi(
>      int vector = (long)arg;
>  
>      if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
> -         (pirq_dpci->gmsi.gvec == vector) )
> +         ((pirq_dpci->gmsi.data & MSI_DATA_VECTOR_MASK) == vector) )

MASK_EXTR()

>      {
> -        unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
> -                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
> -        bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
> +        unsigned int dest = MSI_ADDR_DEST(pirq_dpci->gmsi.addr);
> +        bool dest_mode = pirq_dpci->gmsi.addr & XEN_DOMCTL_VMSI_X86_DM_MASK;

If this is now the raw address, how come XEN_DOMCTL_VMSI_X86_DM_MASK can
be used on it?

Jan

