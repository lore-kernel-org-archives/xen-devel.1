Return-Path: <SRS0=cMO7=FW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E19BC4361B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 18:56:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4003C23B83
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 18:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4003C23B83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56655.99216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqKvN-0006xX-LH; Fri, 18 Dec 2020 18:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56655.99216; Fri, 18 Dec 2020 18:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqKvN-0006xQ-IM; Fri, 18 Dec 2020 18:56:21 +0000
Received: by outflank-mailman (input) for mailman id 56655;
 Fri, 18 Dec 2020 18:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azX+=FW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kqKvM-0006xL-OJ
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 18:56:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e060be68-4478-4943-9ab5-721e4d779b26;
 Fri, 18 Dec 2020 18:56:20 +0000 (UTC)
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
X-Inumbo-ID: e060be68-4478-4943-9ab5-721e4d779b26
Date: Fri, 18 Dec 2020 10:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608317779;
	bh=mNsuymiy+hlbVxv5osDqiBtsrMfiVf+wAvW+nLwzmsI=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=nAmAtMWzJX6E6aXsN1korRa+N127EuOwl6yqce+Wv0dpOaeltzq+WlTjvod7OnfZf
	 Gbr+4Ekn8ZM2JdS5CufTTVefIAAaDOhaAynwBhiLWIPDGvftTvupN6Y1+Vd0loD7v5
	 Iy1hU3jF0Qg4aalpCP2I5gj4JLbvmEPLNDHhgVXd8grmklWLIose/89x5AEUtah5F5
	 PLFQM6PnChv7N8F4YqgmF7RXNZUnxt6W8b4z1BoIiBsrqoXIgywG8LVnI8jvedniF3
	 i5NYMtbn8C1Hr279+c9MDSuJaqWZTimcTExOq9DPOc07izrLzbNByCEIhBOEligrQx
	 Q9Z1WFaulxSEw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen: Rework WARN_ON() to return whether a warning
 was triggered
In-Reply-To: <20201218133054.7744-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2012181056080.4040@sstabellini-ThinkPad-T480s>
References: <20201218133054.7744-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Dec 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> So far, our implementation of WARN_ON() cannot be used in the following
> situation:
> 
> if ( WARN_ON() )
>     ...
> 
> This is because WARN_ON() doesn't return whether a warning has been
> triggered. Such construciton can be handy if you want to print more
> information and also dump the stack trace.
> 
> Therefore, rework the WARN_ON() implementation to return whether a
> warning was triggered. The idea was borrowed from Linux
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Rework the commit message
>         - Don't use trailing underscore
>         - Add Bertrand's and Juergen's reviewed-by
> ---
>  xen/include/xen/lib.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 48429b69b8df..5841bd489c35 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -23,7 +23,13 @@
>  #include <asm/bug.h>
>  
>  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
> +#define WARN_ON(p)  ({                  \
> +    bool ret_warn_on_ = (p);            \
> +                                        \
> +    if ( unlikely(ret_warn_on_) )       \
> +        WARN();                         \
> +    unlikely(ret_warn_on_);             \
> +})
>  
>  /* All clang versions supported by Xen have _Static_assert. */
>  #if defined(__clang__) || \
> -- 
> 2.17.1
> 

