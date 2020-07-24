Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C993BC433EB
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:29:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984C120674
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="KqY+NzLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984C120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1Vl-0006kB-2l; Fri, 24 Jul 2020 17:29:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jz1Vj-0006k6-JS
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:29:31 +0000
X-Inumbo-ID: 3af8e950-cdd3-11ea-a43f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3af8e950-cdd3-11ea-a43f-12813bfff9fa;
 Fri, 24 Jul 2020 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595611770;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NmRU0UDMj5uQajIy/P97l/8BR5JPklmtkyXUqGedd7k=;
 b=KqY+NzLCJmhv0YoHglIPyzxMfbGvhvqiVt2DQ1nO5U53zRu7I7D1c0Sn
 3KRj1OitMs7kmkfk9ZXN/CDAfw7FPmpPntuU4APdQIzk5w1+UOXuMzvCs
 /cWEI7hTw2nPcjQhRZyG4Qae0nD83eMBdEn99TlbCnmsbGoeFwSGyiHK7 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: P+1tZ3uyva1MANEdhZoHbbY03bv6p5w1KtyPxJAnrhHlJBZT+0FR8cLa6Z79CE6THTBkRlsiXP
 pA6bi53OidV6AenxjkFugn7oJMGqO9hhN4tDe9g7/DauQqRoxlvD+9jhx7O9Y/7x8xgRzxI7YM
 eYIiofx7oOL6J2hfT3TL5Mo2qRzYacDEr3c9yI2OtxGmrJZ8pSqpEqCSzt1aO+v0aq0FrkZN93
 DdQg6HEQWwdpSgqdqKoMa1ks6mEHp3MUemORGT1YMfk70zw1oDW1F3ub5vClnSmQjjxjMB4jSL
 8Aw=
X-SBRS: 2.7
X-MesageID: 23474787
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23474787"
Subject: Re: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate common
 fields...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-2-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <68b40fdc-e578-7005-aa6e-499c6f04589c@citrix.com>
Date: Fri, 24 Jul 2020 18:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-2-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 17:46, Paul Durrant wrote:
> diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
> index 6c9d5e5632..a7add5208c 100644
> --- a/xen/include/asm-x86/iommu.h
> +++ b/xen/include/asm-x86/iommu.h
> @@ -45,16 +45,23 @@ typedef uint64_t daddr_t;
>  
>  struct arch_iommu
>  {
> -    u64 pgd_maddr;                 /* io page directory machine address */
> -    spinlock_t mapping_lock;            /* io page table lock */
> -    int agaw;     /* adjusted guest address width, 0 is level 2 30-bit */
> -    u64 iommu_bitmap;              /* bitmap of iommu(s) that the domain uses */
> -    struct list_head mapped_rmrrs;
> -
> -    /* amd iommu support */
> -    int paging_mode;
> -    struct page_info *root_table;
> -    struct guest_iommu *g_iommu;
> +    spinlock_t mapping_lock; /* io page table lock */
> +
> +    union {
> +        /* Intel VT-d */
> +        struct {
> +            u64 pgd_maddr; /* io page directory machine address */
> +            int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
> +            u64 iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
> +            struct list_head mapped_rmrrs;
> +        } vtd;
> +        /* AMD IOMMU */
> +        struct {
> +            int paging_mode;
> +            struct page_info *root_table;
> +            struct guest_iommu *g_iommu;
> +        } amd_iommu;
> +    };

The naming split here is weird.

Ideally we'd have struct {vtd,amd}_iommu in appropriate headers, and
this would be simply

union {
    struct vtd_iommu vtd;
    struct amd_iommu amd;
};

If this isn't trivial to arrange, can we at least s/amd_iommu/amd/ here ?

~Andrew

