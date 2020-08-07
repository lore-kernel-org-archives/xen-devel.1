Return-Path: <SRS0=XA5Y=BR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3019C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 14:38:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8737221E2
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 14:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8737221E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k43VG-0007c0-Rp; Fri, 07 Aug 2020 14:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k43VG-0007bv-6W
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 14:37:50 +0000
X-Inumbo-ID: 91c23aa3-bcf8-42c5-8dd6-c8d57238241b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91c23aa3-bcf8-42c5-8dd6-c8d57238241b;
 Fri, 07 Aug 2020 14:37:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5C13B71B;
 Fri,  7 Aug 2020 14:38:06 +0000 (UTC)
Subject: Re: [PATCH v6 06/11] x86/hvm: processor trace interface in HVM
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <1916e06793ffaaa70c471bcd6bcf168597793bd5.1594150543.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9357d4a-0b6e-f5da-9fe4-478a25a00c0e@suse.com>
Date: Fri, 7 Aug 2020 16:37:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1916e06793ffaaa70c471bcd6bcf168597793bd5.1594150543.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 21:39, Michał Leszczyński wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2205,6 +2205,27 @@ int domain_relinquish_resources(struct domain *d)
>                  altp2m_vcpu_disable_ve(v);
>          }
>  
> +        for_each_vcpu ( d, v )
> +        {
> +            unsigned int i;
> +            uint64_t nr_pages = v->domain->processor_trace_buf_kb * KB(1);
> +            nr_pages >>= PAGE_SHIFT;
> +
> +            if ( !v->vmtrace.pt_buf )
> +                continue;
> +
> +            for ( i = 0; i < nr_pages; i++ )
> +            {
> +                struct page_info *pg = mfn_to_page(
> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));
> +
> +                put_page_alloc_ref(pg);
> +                put_page_and_type(pg);
> +            }
> +
> +            v->vmtrace.pt_buf = NULL;
> +        }

This needs to allow for preemption. Also this isn't x86-specific,
so should be implemented in common code (just like allocation is).

Jan

