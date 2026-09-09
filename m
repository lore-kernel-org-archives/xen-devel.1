Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A7C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:36:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412747.1643105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EiZ-000206-5S; Wed, 09 Sep 2026 09:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412747.1643105; Wed, 09 Sep 2026 09:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EiZ-0001zz-2p; Wed, 09 Sep 2026 09:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1412747;
 Wed, 09 Sep 2026 09:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4EiX-0001zt-BT
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:35:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4EiW-006Nuy-1H;
 Wed, 09 Sep 2026 09:35:44 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4EiW-000bfd-2j;
 Wed, 09 Sep 2026 09:35:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=329bJcs3GTBUNSLxRj8qY4RilkncelvMpWFDZDKA+2I=; b=hLbGOGdB1xXE3CuBFY2pWNdOjj
	ThgwJ0SJ8OO24bIaZQ8ieXFjXyYVh3QX6QZyCbgIl6G3PqnrhU6xORFfGq+H1qXMAok70JfiyhSRq
	nBGzlFTTYMvqR6lmazM1WQvOvOuRcCWj7EiblsXFEKL1q8DPQ9U/t8xxgWKTsfvs0ep0=;
Date: Wed, 9 Sep 2026 11:35:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3] x86/ucode: Work around Granite Rapids erraturm GNR98
Message-ID: <aqEobrU33SuSjf6p@macbook.local>
References: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908171525.3196765-1-andrew.cooper3@citrix.com>

On Tue, Sep 08, 2026 at 06:15:25PM +0100, Andrew Cooper wrote:
> Block loads which are known to hang the system.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> A more complete solution is in the works, but it's taken 4 months to get this
> much published...
> 
> v3:
>  * Double XENLOG_WARNING
> 
> v2:
>  * Correct the sign of the cpu_sig->rev check.
>  * Expand the comment to explain why we are not following what GNR98 says.
> ---
>  xen/arch/x86/cpu/microcode/intel.c | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
> index c45b00c6b033..86cbfb798160 100644
> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -27,6 +27,7 @@
>  #include <xen/string.h>
>  #include <xen/xmalloc.h>
>  
> +#include <asm/intel-family.h>
>  #include <asm/msr.h>
>  #include <asm/processor.h>
>  #include <asm/system.h>
> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>      return false;
>  }
>  
> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
> +{
> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);

I think this could be const?  Or are there further changes expected
that will modify the signature?

> +
> +    /*
> +     * Treat pre-production as always safe - anyone using pre-production
> +     * microcode knows what they are doing, and can keep any resulting pieces.
> +     */
> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
> +        return true;
> +
> +    /*
> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
> +     * sufficiently old firmware.  GNR101 retroactively states that one ucode
> +     * had an incorrect minimum revision field, in light of discovering GNR98.
> +     *
> +     * Both are incomplete statements of the problem.
> +     *
> +     * At the time of writing (August 2026), the believed safe sequence is:
> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
> +     *
> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
> +     * GNR, this allows multi-hop loading to get up to the latest.
> +     */
> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
> +          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )

Given the logic, I don't think the CPU needs to strictly be in version
0x01000370 to update to the [0x01000380...0x010003f3] range?

Maybe you want to replace 0x01000370 with "any previous" to match the
semantics used in the tail of the sequence with "any later".

In any case:

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

