Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C952DC433DF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:34:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F5222E00
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F5222E00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3f5x-00041m-Ow; Thu, 06 Aug 2020 12:34:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3f5v-00041h-VV
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:34:03 +0000
X-Inumbo-ID: 01afc08c-84a8-4d08-9041-a6b1920390aa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01afc08c-84a8-4d08-9041-a6b1920390aa;
 Thu, 06 Aug 2020 12:34:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6532AC23;
 Thu,  6 Aug 2020 12:34:19 +0000 (UTC)
Subject: Re: [PATCH v4 12/14] vtd: use a bit field for root_entry
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-13-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71e1a4a9-eac0-5aae-f2d5-fa33ca8b6036@suse.com>
Date: Thu, 6 Aug 2020 14:34:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-13-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -184,21 +184,28 @@
>  #define dma_frcd_source_id(c) (c & 0xffff)
>  #define dma_frcd_page_addr(d) (d & (((u64)-1) << 12)) /* low 64 bit */
>  
> -/*
> - * 0: Present
> - * 1-11: Reserved
> - * 12-63: Context Ptr (12 - (haw-1))
> - * 64-127: Reserved
> - */
>  struct root_entry {
> -    u64    val;
> -    u64    rsvd1;
> +    union {
> +        __uint128_t val;

I couldn't find a use of this field, and I also can't foresee any.
Could it be left out?

> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            uint64_t p:1;

bool?

> +            uint64_t reserved0:11;
> +            uint64_t ctp:52;
> +
> +            /* 64 - 127 */
> +            uint64_t reserved1;
> +        };
> +    };
>  };
> -#define root_present(root)    ((root).val & 1)
> -#define set_root_present(root) do {(root).val |= 1;} while(0)
> -#define get_context_addr(root) ((root).val & PAGE_MASK_4K)
> -#define set_root_value(root, value) \
> -    do {(root).val |= ((value) & PAGE_MASK_4K);} while(0)
> +
> +#define root_present(r) (r).p
> +#define set_root_present(r) do { (r).p = 1; } while (0)

And then "true" here?

> +#define root_ctp(r) ((r).ctp << PAGE_SHIFT_4K)
> +#define set_root_ctp(r, val) \
> +    do { (r).ctp = ((val) >> PAGE_SHIFT_4K); } while (0)

For documentation purposes, can the 2nd macro param be named maddr
or some such?

> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -74,8 +74,8 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
>  static bool device_in_domain(const struct vtd_iommu *iommu,
>                               const struct pci_dev *pdev, uint16_t did)
>  {
> -    struct root_entry *root_entry;
> -    struct context_entry *ctxt_entry = NULL;
> +    struct root_entry *root_entry, *root_entries = NULL;
> +    struct context_entry *context_entry, *context_entries = NULL;

Just like root_entry, root_entries doesn't look to need an initializer.
I'm unconvinced anyway that you now need two variables each:
unmap_vtd_domain_page() does quite fine with the low 12 bits not all
being zero, afaict.

Jan

