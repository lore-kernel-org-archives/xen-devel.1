Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D56C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 10:26:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EC320721
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 10:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30EC320721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbiPW-000181-MZ; Thu, 21 May 2020 10:26:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6UB=7D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbiPV-00017t-Kv
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 10:26:45 +0000
X-Inumbo-ID: 9164d8f2-9b4d-11ea-aaee-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9164d8f2-9b4d-11ea-aaee-12813bfff9fa;
 Thu, 21 May 2020 10:26:44 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 75XxUCYNwSU5PDE8kjHRJJnoYPfbEYOuogidHwKMPh1e+DSLxqQMLlnJ33ExmqwJtdUTpMnj7N
 qS3fxZWWqc2XRA5mQG7uyBglXqkij/rZPJk7zWali7ClFsZ0597tgpUul6jbFiVQBQsJIhIQi+
 pwq+6IUjyDckFYlaVU1tuqUmOOCpGHKP3/7tbmEBOKu5BeIK9MxwGQW0NylCy8LsFzoxSyh+vJ
 OUYgsoEApNquTyHh3VeGEa2ojkuEcZHGdxXtnY1aUZzXLk95Nzzij2kVMjrrVn3F6JhV8koWjQ
 0FI=
X-SBRS: 2.7
X-MesageID: 18785460
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18785460"
Date: Thu, 21 May 2020 12:26:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
Message-ID: <20200521102636.GR54375@Air-de-Roger>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200521090428.11425-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 10:04:28AM +0100, Andrew Cooper wrote:
> When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:
> 
>   common.c:41:12: error: ‘sh_remove_write_access_from_sl1p’ declared ‘static’ but never defined [-Werror=unused-function]
>    static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> due to an unguarded forward declaration.
> 
> It turns out there is no need to forward declare
> sh_remove_write_access_from_sl1p() to begin with, so move it to just ahead of
> its first users, which is within a larger #ifdef'd SHOPT_OUT_OF_SYNC block.
> 
> Fix up for style while moving it.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Tim Deegan <tim@xen.org>
> ---
>  xen/arch/x86/mm/shadow/common.c | 56 ++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
> index 0ac3f880e1..6dff240e97 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -38,9 +38,6 @@
>  #include <xen/numa.h>
>  #include "private.h"
>  
> -static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
> -                                            mfn_t smfn, unsigned long offset);
> -
>  DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
>  
>  static int sh_enable_log_dirty(struct domain *, bool log_global);
> @@ -252,6 +249,31 @@ static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
>          SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
>  }
>  
> +static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
> +                                            mfn_t smfn, unsigned long off)
> +{
> +    struct page_info *sp = mfn_to_page(smfn);
> +
> +    ASSERT(mfn_valid(smfn));
> +    ASSERT(mfn_valid(gmfn));
> +
> +    if ( sp->u.sh.type == SH_type_l1_32_shadow ||
> +         sp->u.sh.type == SH_type_fl1_32_shadow )

Using a switch would also be nice IMO and would avoid some of the code
churn.

Thanks, Roger.

