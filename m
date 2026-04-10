Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCB2F36B9A
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 00:16:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278226.1563150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzXx-00077d-Pq; Fri, 10 Apr 2026 00:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278226.1563150; Fri, 10 Apr 2026 00:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzXx-00077W-Lp; Fri, 10 Apr 2026 00:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1278226;
 Fri, 10 Apr 2026 00:16:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAzXw-00077P-S4
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 00:16:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAzXv-00Dlnx-LB
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 02:16:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d84132-bab6-0a2a0a5309dd-0a2a4507b538-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:16:27 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d8415a-ba2d-0a2a45070019-aceafc1fcafa-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:16:27 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8055C40664;
 Fri, 10 Apr 2026 00:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A75C4CEF7;
 Fri, 10 Apr 2026 00:16:24 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775780185;
	bh=xAa9ho/qWsXTFCn6t/AyO2PTk8zzuFfmA8Xen8QhGmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=McVjr3ZoS28UCtmU7k5Tdgb3gMIt3vJ6kHao/YS66EqzBpA3AYP1wW0EVkMuNB+0G
	 sL77Uu8Pjynejxk7RKAnkRjvqPsv5hQV5SQFRFIc0fh6oxcymzq+ze7sbJRPgE8ujd
	 qQf6tpqd4DMvHwptoY3+sEKouBwnLQUgtrzsUmJu/n+pN0e6b9WPTKTt82NXRX62s0
	 /QAzbLYedrwzMPGHO01kAxBXWwEH1O4Spb+Xqf63Y3xOBrxx8kVg9mHYTz9jNZFotb
	 +i3jEesda/ZWtF+457xcsOEPiM5DVIekF0GQCVFX1+Q8iDNt86oMAFiSyX69K/8JyH
	 VbWKoImRwAuMA==
Date: Thu, 9 Apr 2026 17:16:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
In-Reply-To: <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2604091713230.2873990@ubuntu-linux-20-04-desktop>
References: <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1775780187-13D4741E-E2C98BC8/0/0
X-purgate-type: clean
X-purgate-size: 1814

On Thu, 9 Apr 2026, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> 
> In certain build configurations, the function 'altp2m_vcpu_idx()' is defined
> as an inline function that contains the 'BUG()' macro. This resulted in a
> violation because the 'BUG()' macro makes the function non-returning.
> 
> To ensure compliance with MISRA C Rule 2.1, this patch removes the inline
> function implementation and its BUG()-based unreachable code. It is replaced
> with an unconditional function declaration for 'altp2m_vcpu_idx()'. It relies
> on the compiler's Dead Code Elimination (DCE) to remove the unused function
> in builds where it is not needed.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2441424553
> ---
>  xen/include/asm-generic/altp2m.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
> index 39865a842a..df6b9a9c01 100644
> --- a/xen/include/asm-generic/altp2m.h
> +++ b/xen/include/asm-generic/altp2m.h
> @@ -15,12 +15,7 @@ static inline bool altp2m_active(const struct domain *d)
>  }
>  
>  /* Alternate p2m VCPU */
> -static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
> -{
> -    /* Not implemented on GENERIC, should not be reached. */
> -    BUG();
> -    return 0;
> -}
> +uint16_t altp2m_vcpu_idx(const struct vcpu *v);

The return type being changed to uint16_t is also a fix. It should be
mentioned in the commit message. Aside from that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  #endif /* __ASM_GENERIC_ALTP2M_H */
>  
> -- 
> 2.43.0
> 

