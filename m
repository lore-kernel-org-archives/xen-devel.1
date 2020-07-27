Return-Path: <SRS0=5MCE=BG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32FDC433EA
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 15:00:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E2220825
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 15:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="f4vcSbrZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E2220825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04br-0003cC-Eh; Mon, 27 Jul 2020 15:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k04bq-0003c7-L9
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 15:00:10 +0000
X-Inumbo-ID: dd15a852-d019-11ea-8ac9-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd15a852-d019-11ea-8ac9-bc764e2007e4;
 Mon, 27 Jul 2020 15:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595862009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ghC7Sl4Drx1oxfzrzb59GnoNx/B87pPHw6/ehG6Kud0=;
 b=f4vcSbrZdhdUkdKMRTUlaRIxh06ktlghnAdnXURcVQ4nBoLWcl8gX37R
 tVtihFwkwbyFDyAn/ROGUMwi9rTFX5LArblO5g0wpekq7dwJPdC6WSeig
 24ND7ua8w2jYR5IvybEDjbbKtfFqwfNp1hwTf0kc4KCcb4N1n+FsGS+A3 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: V4ujmgoOXi3dcztOsZvxoPbi352l92IsXh3e1o0vRIzcIcSFavIRh56fhekWu4K9n9S2U4y3Y8
 mYpR/Fk6HqZ14vmJjFvg6Sb6CoIyNCMevSJxF7morJGqCKqMeZ9Sr/zSg+F25MEGAV9iLAwVAh
 Z0xwg0EfU67qe/QMcAAMXs+88Wxq559J1782ovBmOwOl0Bng1NSUy01vnscHWzkZEvlq7WvCcn
 ISp05G+Z7AB5y0Qlub8syfNYUQKNhd2Kqx+i58UI/99qL7lySZNwpmh1WCnsM+N/OroE6qnQWm
 Zrs=
X-SBRS: 2.7
X-MesageID: 23455758
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23455758"
Date: Mon, 27 Jul 2020 17:00:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
Message-ID: <20200727150002.GS7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:48:46PM +0200, Jan Beulich wrote:
> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
> to introduce a number of #ifdef-s to make the build work with older tool
> chains. Introduce an assembler macro covering for tool chains not
> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
> problem to be dropped again.
> 
> No change to generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks like an improvement overall in code clarity:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Can you test on clang? Just to be on the safe side, otherwise I can
test it.

> ---
> Now that I've done this I'm not longer sure which direction is better to
> follow: On one hand this introduces dead code (even if just NOPs) into
> CET-SS-disabled builds. Otoh this is a step towards breaking the tool
> chain version dependency of the feature.
> 
> I've also dropped conditionals around bigger chunks of code; while I
> think that's preferable, I'm open to undo those parts.
> 
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -31,7 +31,6 @@ ENTRY(__high_start)
>          jz      .L_bsp
>  
>          /* APs.  Set up shadow stacks before entering C. */
> -#ifdef CONFIG_XEN_SHSTK
>          testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
>                  CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
>          je      .L_ap_shstk_done
> @@ -55,7 +54,6 @@ ENTRY(__high_start)
>          mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
>          mov     %rcx, %cr4
>          setssbsy
> -#endif
>  
>  .L_ap_shstk_done:
>          call    start_secondary
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -668,7 +668,7 @@ static void __init noreturn reinit_bsp_s
>      stack_base[0] = stack;
>      memguard_guard_stack(stack);
>  
> -    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
> +    if ( cpu_has_xen_shstk )
>      {
>          wrmsrl(MSR_PL0_SSP,
>                 (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -198,9 +198,7 @@ ENTRY(cr4_pv32_restore)
>  
>  /* See lstar_enter for entry register state. */
>  ENTRY(cstar_enter)
> -#ifdef CONFIG_XEN_SHSTK
>          ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
> -#endif
>          /* sti could live here when we don't switch page tables below. */
>          CR4_PV32_RESTORE
>          movq  8(%rsp),%rax /* Restore %rax. */
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -237,9 +237,7 @@ iret_exit_to_guest:
>   * %ss must be saved into the space left by the trampoline.
>   */
>  ENTRY(lstar_enter)
> -#ifdef CONFIG_XEN_SHSTK
>          ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK

Should the setssbsy be quoted, or it doesn't matter? I'm asking
because the same construction used by CLAC/STAC doesn't quote the
instruction.

Roger.

