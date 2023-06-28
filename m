Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B2EB64DA
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jun 2023 23:03:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.556622.869296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEeBi-0003ka-5G; Wed, 28 Jun 2023 23:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556622.869296; Wed, 28 Jun 2023 23:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEeBi-0003kS-2h; Wed, 28 Jun 2023 23:03:02 +0000
Received: by outflank-mailman (input) for mailman id 556622;
 Wed, 28 Jun 2023 23:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzH+=CQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEeBh-0003kH-8q
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 23:03:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec78aad1-1607-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 01:02:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D76746147F;
 Wed, 28 Jun 2023 23:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC39C433C0;
 Wed, 28 Jun 2023 23:02:55 +0000 (UTC)
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
X-Inumbo-ID: ec78aad1-1607-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687993377;
	bh=ncTKAPsYzGyiI/JGSQ5zxyLQ6MpO5CiHOyqqXYdG90o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cdtDBeyYKsXl857KCZkQlHM8EmoWcY4w76gK9emyRNrtmTfYGk5SC4Ug1mC2DwwOU
	 fFZHF4Fd6lgmJqD/2OLSjaf9xMrWIf6l091n+rxFlbVYbzjPS67mRs2RTpqDgYLSZV
	 v/GLl4NPdhm74m+9uKC1pkJs9Xw3xlTMU+Rk7flKLObTO/kQ8pmzRXUsdI+zTcHiGl
	 JB64sJlArrAnWIbKkHu9criW2T9A+nKaGmDAGobCili6T3WmXdphacbm0Ldy2zMDaD
	 o04T9QLn2V1V1ifh5lMCMNpzMq2yU0qiYS73E6p4vb4491vg80J4Keri+/93LnWAJV
	 BjCuUbTXo4wJQ==
Date: Wed, 28 Jun 2023 16:02:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v6] xen/include: avoid using a compiler extension
 for BUILD_BUG_ON_ZERO
In-Reply-To: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306281602450.3936094@ubuntu-linux-20-04-desktop>
References: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jun 2023, Nicola Vetrini wrote:
> Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
> that gives an acceptable semantics to C99 undefined behavior 58
> ("A structure or union is defined as containing no named members
> (6.7.2.1)").
> 
> The first definition includes an additional named field of type
> char.
> 
> The chosen ill-formed construct for the second definition is a struct
> with a named bitfield of width 0 when the condition is true,
> which prevents the UB without using the compiler extension while keeping
> the semantic of the construct.
> 
> The choice of the bitwise AND operation to bring the result to 0
> when cond is false boils down to possibly better portability.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V2:
> - Avoid using a VLA as the compile-time assertion
> - Do not drop _Static_assert
> Changes in V3:
> - Changed the operation to bring the result to 0 when the
> construct does not lead to a compilation error
> Changes in V4:
> - Switched to a shorter construct for the second definition.
> Changes in V5:
> - Dropped 'U's from the macro definitions.
> Changes in V6:
> - Fixed patch submission.
> ---
>  xen/include/xen/lib.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 67fc7c1d7e..a8958ed57b 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -51,9 +51,10 @@
>     e.g. in a structure initializer (or where-ever else comma expressions
>     aren't permitted). */
>  #define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0)
>  #else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : !(cond); }) & 0)
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  
> -- 
> 2.34.1
> 

