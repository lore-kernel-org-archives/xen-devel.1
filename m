Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D89C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:52:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11E020747
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 10:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11E020747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaLp-0005Aw-Te; Wed, 01 Jul 2020 10:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqaLo-0005Am-Lr
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:52:24 +0000
X-Inumbo-ID: f1b7a509-bb88-11ea-86ed-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1b7a509-bb88-11ea-86ed-12813bfff9fa;
 Wed, 01 Jul 2020 10:52:23 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /e81gyTLqkFFAWY9nm+5cjUP9KpjGf82wUwOjctenLDDD+S+A+VHslJCmNuHR316ru/v6UhQi/
 ZRpKvDaS1PnJd8efKGfr3wT1dCXYXqLa7MRMykvmk6+VR+tPpedxkO1gmFddANPkkBuwtuV+7w
 UhACHRE1gsYJIWIRQs7r1scAPUf7sBJ9dO7j+QjBqdBGmjpTUhtLOEYacWX4gvepSCzFefn706
 fQ3Oj0uoDR5Ul68+/oyOGx+rgdMOrrrcfRcG7U9DHLAT7SeAIIyAh8v4+/qJ2X5xDW/Eq7JPco
 AI0=
X-SBRS: 2.7
X-MesageID: 21718948
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21718948"
Date: Wed, 1 Jul 2020 12:52:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 07/10] x86/mm: add vmtrace_buf resource type
Message-ID: <20200701105216.GT735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2446caa5be5eca36f0b5ca47d2edcbd6f7792484.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2446caa5be5eca36f0b5ca47d2edcbd6f7792484.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:50PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to map processor trace buffer using
> acquire_resource().
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/mm.c           | 25 +++++++++++++++++++++++++
>  xen/include/public/memory.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e376fc7e8f..bb781bd90c 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4624,6 +4624,31 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          }
>          break;
>      }
> +
> +    case XENMEM_resource_vmtrace_buf:
> +    {
> +        mfn_t mfn;
> +        unsigned int i;
> +        struct vcpu *v = domain_vcpu(d, id);

Missing blank newline between variable definitions and code.

> +        rc = -EINVAL;
> +
> +        if ( !v )
> +            break;
> +
> +        if ( !v->arch.vmtrace.pt_buf )
> +            break;
> +
> +        mfn = page_to_mfn(v->arch.vmtrace.pt_buf);
> +
> +        if ( frame + nr_frames > (v->domain->vmtrace_pt_size >> PAGE_SHIFT) )
> +            break;

You can place all the checks done above in a single if.

Thanks, Roger.

