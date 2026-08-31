Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424DDC61DE4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 01:31:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403722.1637709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qrR-0004MU-JO; Mon, 31 Aug 2026 01:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403722.1637709; Mon, 31 Aug 2026 01:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qrR-0004MN-GG; Mon, 31 Aug 2026 01:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1403722;
 Mon, 31 Aug 2026 01:30:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x0qrQ-0004MD-Ou
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 01:30:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0qrQ-0082jR-64
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 03:30:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d93c-bab6-0a2a0a5309dd-0a2a4506d214-20
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:30:56 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d94e-195a-0a2a45060019-aceafc1f8246-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:30:55 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E877A4079D;
 Mon, 31 Aug 2026 01:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6111F000E9;
 Mon, 31 Aug 2026 01:30:52 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788139853;
	bh=DnLEnchd2VaOyhF8/tkpJeYRmI7T17gPbSEznKwQNno=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Fz8OycsB4/fNcaiiZ4bTyAG4hrAPtn+vbUWvESl6NOgK1jglH3g/eywC+pEi9SNsd
	 T4Q0FOybtJ8MVFkquDXecGbBulsf9LjkSVqWDyhO5yvRWBV4fAAjGaEWDvVrZ1kTLb
	 JFiWvSzXTOVJEMm8WyO6ZFBDLIb5Wl9i/naoy/22VV1brqQjOC3ZZXTSNzMQcyxIJH
	 BCUQcKMSf6UoV70u7TpRzX0jKZfBxNktqj14S33ItDHZ+Vk3kSV6Vc+XZt4MIICUzQ
	 iCbSiYZIzsz8Kngv9uu30k18MjRxOvtEHj5JoDtn2MmXF6lyhh0tfgXqi29t4kIkB3
	 7VaAeqYmvH0Dw==
Date: Sun, 30 Aug 2026 18:30:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 09/12] Eclair: deviate BUILD_ERROR() wrt rule 2.1 and
 introduce variants
In-Reply-To: <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
Message-ID: <6a118f4d-4bd0-ea3c-8322-18edfb682e58@kernel.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com> <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1788139856-F420077B-20216E5B/0/0
X-purgate-type: clean
X-purgate-size: 2786

On Fri, 28 Aug 2026, Jan Beulich wrote:
> BUILD_ERROR() is even stronger a guard than assertions in general, and
> ASSERT_UNREACHABLE() (or BUG()) in particular. Deviate it just like those
> to allow use for marking unreachable portions of code.
> 
> In some cases code being unreachable is dependent upon configuration.
> Introduce two variants, as constructs like
> 
>     if ( IS_ENABLED(CONFIG_...) )
>         BUILD_ERROR("...");
> 
> results in the if() still being reported as unreachable. Sadly these two
> new macros introduce a new 20.12 violation each, which hence also needs
> deviating.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -19,6 +19,7 @@ Constant expressions and unreachable bra
>  
>  -doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
>  -config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(^BUILD_ERROR(|_IF(|_NOT))$))))"}
>  -doc_end
>  
>  -doc_begin="The asm-offset files are not linked deliberately, since they are used to generate definitions for asm modules."
> @@ -667,6 +668,7 @@ deliberate."
>  to the # or ## operators within the following macros are deliberate, to provide
>  useful diagnostic messages to the user."
>  -config=MC3A2.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
> +-config=MC3A2.R20.12,macros+={deliberate, "^BUILD_ERROR(|_IF(|_NOT))$"}
>  -doc_end
>  
>  -doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -64,6 +64,21 @@
>   */
>  #define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )
>  
> +/*
> + * Like above, but conditional upon @cfg (not) being enabled.  @cfg must be
> + * suitable to pass to IS_ENABLED().
> + */
> +#define BUILD_ERROR_IF(cfg)                               \
> +    (IS_ENABLED(cfg)                                      \
> +     ? ({ BUILD_ERROR( #cfg " unexpectedly enabled"); })  \
> +     : (void)0)
> +
> +#define BUILD_ERROR_IF_NOT(cfg)                           \
> +    (!IS_ENABLED(cfg)                                     \
> +     ? ({ BUILD_ERROR( #cfg " unexpectedly disabled"); }) \
> +     : (void)0)
> +
> +
>  /* Hide a value from the optimiser. */
>  #define HIDE(x)                                 \
>      ({                                          \
> 

